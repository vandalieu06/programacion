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
        SELECT dep.department_name AS name, dep.department_id AS id
        FROM departments dep;
BEGIN
  FOR x IN c_cursor
  LOOP 
    DBMS_OUTPUT.PUT_LINE( 'El department ' || x.name || ' té id ' || x.id );
  END LOOP;
END;
/
/*
EXERCICI 2 
TIPUS: Bloc anónim 
DESCRIPCIÓ: 
El programa recorrerà la taula d'empleats i mostrarà el següent missatge per als 
treballadors amb id senar: 
"L'empleat XXXXXX té id XXXXXXX"
*/
DECLARE
    CURSOR c_cursor IS 
      SELECT emp.employee_id AS id, emp.first_name AS name
      FROM employees emp;
BEGIN
    FOR x IN c_cursor 
    LOOP
        DBMS_OUTPUT.PUT_LINE('L''empleat '|| x.name || 'té id ' || x.id);
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
      emp.department_id AS did,
      NVL((SELECT AVG(salary) 
        FROM employees
        WHERE department_id = emp.department_id), 0) AS avg_sal
    FROM employees emp
      LEFT JOIN departments dep ON (emp.department_id = dep.department_id);
BEGIN 
  FOR x IN c_cursor
  LOOP 
    IF x.did IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('L''empleat ' || x.name || ' no el volen a cap departament...');
    ELSE
      IF x.salary > x.avg_sal THEN
        DBMS_OUTPUT.PUT_LINE('L''empleat ' || x.name || ' cobra MÉS que la mitja del seu departament');
      ELSE
        DBMS_OUTPUT.PUT_LINE('L''empleat ' || x.name || ' cobra MENYS que la mitja del seu departament');
      END IF;
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
      man.first_name AS mname,
      man.last_name AS mlast
    FROM employees man 
      RIGHT JOIN departments dep ON (man.department_id = dep.department_id);
BEGIN
  FOR x IN c_cursor
  LOOP
     IF x.mname IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('El departament ' || x.dname || ' no té manager.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('El departament ' || x.dname ||' té el manager ' 
                            || x.mname || ' ' || x.mlast);
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
El procediment rebrà un import(salary) i mostrarà el llistat de tots els treballadors
que cobren aquesta quantitat (nom i cognom). 
CONTROL D'ERRORS:  
- Si ens passen un nombre negatiu – Genera error "salari negatiu" 
- Si ens passen un 0 – Genera error "Ningú fa tanta llàstima" 
- Si no hi ha cap empleat que cobra la quantitat – Genera error "Ningú cobra la quantitat"
*/
CREATE OR REPLACE PROCEDURE p_quien_cobra (p_salary NUMBER) 
IS
  v_empleats_trobats BOOLEAN := FALSE;
  CURSOR c_cursor IS 
    SELECT first_name AS name, last_name AS last
    FROM employees
    WHERE salary = p_salary
    ORDER BY last_name, first_name;
BEGIN
  IF p_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'salari negatiu');
  ELSIF p_salary = 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Ningú fa tanta llàstima');
  END IF;

  FOR x IN c_cursor LOOP
    DBMS_OUTPUT.PUT_LINE(x.name || ' ' || x.last);
    v_empleats_trobats := TRUE;
  END LOOP;

 IF NOT v_empleats_trobats THEN
    RAISE_APPLICATION_ERROR(-20003, 'Ningú cobra la quantitat');
  END IF;

END;
/

EXEC p_quien_cobra(24000);
EXEC p_quien_cobra(-100); 
EXEC p_quien_cobra(0);     
EXEC p_quien_cobra(99999);