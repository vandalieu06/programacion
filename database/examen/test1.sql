/*
EXERCICI 1 
TIPUS: Bloc anónim 
DESCRIPCIÓ: 
El programa recorrerà tota la taula de departaments i mostrarà el següent missatge, per cada departament: 
"El departament XXXXXX té id XXXXXXX"
*/

SET SERVEROUTPUT ON;

DECLARE
  CURSOR c_cursor IS
    SELECT 'El departament ' || department_name || ' té la id ' || department_id as message
    FROM departments;
BEGIN 
  FOR x IN c_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(x.message);
  END LOOP;
END;
/

/*
EXERCICI 2 
TIPUS: Bloc anónim 
DESCRIPCIÓ: 
El programa recorrerà la taula d'empleats i mostrarà el següent missatge per als treballadors amb id senar: 
"L'empleat XXXXXX té id XXXXXXX"
*/

DECLARE 
  CURSOR c_cursor IS
    SELECT 'L''empleat ' || first_name || ' té la id ' || employee_id as message
    FROM employees;
BEGIN 
  FOR x IN c_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(x.message);
  END LOOP;
END;
/

/*
EXERCICI 3
TIPUS: Bloc anónim 
DESCRIPCIÓ: 
El programa mostrarà una llista de missatges amb el següent text:  
"L'empleat XXXXX cobra MÁS/MENOS que la mitja del seu departament"  
Si l'empleat no té departament, canvia pel text:  
"L'empleat XXXXX no el volen a cap departament..."
*/

DECLARE
  CURSOR c_cursor IS
    SELECT
      emp.first_name AS name,
      emp.salary,
      dep.department_id AS did,
      NVL((SELECT AVG(salary) FROM employees WHERE department_id = dep.department_id), 0) AS avg_salary 
    FROM employees emp
      LEFT JOIN departments dep ON (emp.department_id = dep.department_id);
BEGIN
  FOR x IN c_cursor
  LOOP
    IF x.did IS NOT NULL THEN
      IF x.salary > x.avg_salary THEN 
        DBMS_OUTPUT.PUT_LINE('L''empleat ' || x.name || ' cobra MÁS que la mitja del seu departament');
      ELSE
        DBMS_OUTPUT.PUT_LINE('L''empleat ' || x.name || ' cobra MENOS que la mitja del seu departament');
      END IF;
    ELSE 
      DBMS_OUTPUT.PUT_LINE('L''empleat ' || x.name || ' no el volen a cap departament...');
    END IF;
  END LOOP;

END;
/
/*
EXERCICI 4 
TIPUS: Bloc anónim 
DESCRIPCIÓ: 
El programa mostrarà una llista de missatges per a cada departament amb el següent text: 
"El departament <department_name> té el manager <first_name> <last_name>". 
Si el departament no té manager, el missatge serà: 
"El departament <department_name> no té manager."
*/

DECLARE
  CURSOR c_cursor IS
    SELECT
      dep.department_name AS dname,
      man.employee_id AS mid,
      man.first_name || ' '|| man.last_name as mname 
    FROM departments dep
      LEFT JOIN employees man ON (dep.department_id = man.department_id); 
BEGIN 
  FOR x IN c_cursor
  LOOP
    IF x.mid IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('El departmanet ' || x.dname || ' té el manager ' || x.mname);
    ELSE
      DBMS_OUTPUT.PUT_LINE('El departmanet ' || x.dname || ' no té manager.');
    END IF;
  END LOOP;
END;
/
/*
EXERCICI 5
TIPUS: procedimiento 
NOM: p_quien_cobra 
PARÀMETRES D'ENTRADA: p_salary 
DESCRIPCIÓ: 
El procediment rebrà un import(salary) i mostrarà el llistat de tots els treballadors que cobren aquesta quantitat (nom i cognom). 
CONTROL D'ERRORS:  
- Si ens passen un nombre negatiu – Genera error "salari negatiu" 
- Si ens passen un 0 – Genera error "Ningú fa tanta llàstima" 
- Si no hi ha cap empleat que cobra la quantitat – Genera error "Ningú cobra la quantitat"
*/

CREATE OR REPLACE PROCEDURE p_quien_cobra(p_salary NUMBER) 
IS
  CURSOR c_cursor IS
    SELECT emp.first_name || ' ' || emp.last_name as fullname
    FROM employees emp
    WHERE emp.salary = p_salary;
  v_comprovante BOOLEAN := FALSE;
BEGIN 
  IF p_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salari negatiu');
  ELSIF p_salary = 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Ningu fa tanta llàstima');
  END IF;

  FOR x IN c_cursor 
  LOOP
      DBMS_OUTPUT.PUT_LINE(x.fullname);
      v_comprovante := TRUE;
  END LOOP;

  IF NOT v_comprovante THEN
      RAISE_APPLICATION_ERROR(-20003, 'Ningú cobra la quantitat');
  END IF;

END;
/
EXEC p_quien_cobra(24000);
EXEC p_quien_cobra(240020);
EXEC p_quien_cobra(0);
EXEC p_quien_cobra(-3000);

/*
EXERCICI 6: Procediment amb paràmetres múltiples
TIPUS: Procediment
NOM: p_informe_salaris
PARÀMETRES:
- p_department_id (ID del departament)
- p_salari_minim (Salari mínim a considerar)
- p_salari_maxim (Salari màxim a considerar)

DESCRIPCIÓ:
Crea un procediment que mostri un informe dels empleats d'un departament específic que cobren entre un salari mínim i màxim.
El informe ha d'incloure: nom complet, salari actual i percentatge respecte a la mitja del departament.

CONTROL D'ERRORS:
1. Si el departament no existeix → "Departament no trobat"
2. Si el salari mínim > màxim → "Interval de salaris invàlid"
3. Si no hi ha empleats en l'interval → "Cap empleat trobat en aquest rang"

SORTIDA ESPERADA:
Informe salarial - Departament IT
---------------------------------
Nom: Diana Lorentz - Salari: 4,200 - Percentatge: 92.5%
Nom: David Austin - Salari: 4,800 - Percentatge: 105.8%
---------------------------------
Mitja departament: 4,540
*/

CREATE OR REPLACE 


/*
EXERCICI 7: Funció amb validació complexa
TIPUS: Funció
NOM: f_validar_promocio
PARÀMETRES:
- p_employee_id (ID de l'empleat)
- p_nou_salari (Proposat nou salari)

DESCRIPCIÓ:
Funció que valida si es pot promocionar un empleat amb un nou salari, complint:
1. El nou salari no pot ser inferior a l'actual
2. No pot superar en un 30% el salari actual
3. No pot superar el salari màxim del seu departament
4. No pot superar el salari del seu manager

RETORN:
- 1 si és vàlida la promoció
- 0 si no és vàlida
- -1 si l'empleat no existeix
- -2 si hi ha dades inconsistents

EXEMPLE D'ÚS:
DECLARE
  v_resultat NUMBER;
BEGIN
  v_resultat := f_validar_promocio(107, 8000);
  CASE v_resultat
    WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Promoció vàlida');
    WHEN 0 THEN DBMS_OUTPUT.PUT_LINE('Promoció invàlida');
    WHEN -1 THEN DBMS_OUTPUT.PUT_LINE('Empleat no trobat');
    WHEN -2 THEN DBMS_OUTPUT.PUT_LINE('Dades inconsistents');
  END CASE;
END;
/

DIFICULTAT AFEGIDA:
Implementa també un bloc anònim que mostri un informe detallat dels motius quan la validació falla.
*/