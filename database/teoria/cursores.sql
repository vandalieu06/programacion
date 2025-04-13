-- CURSORES
-- Pagina inicial de cursores --> 203
-- Declaracion de un cursor --> pag 213
-- Cursor usando FOR --> pag 222

--EJEMPLO 1: bloque anonimo que recorra todos los departaemntos y nos muetsre dep_id 
--           y dep_name y un contador de lineas
SET SERVEROUT ON;
/
DECLARE
  CURSOR c_departments IS SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS;
BEGIN
  FOR i IN c_departments
  LOOP 
    DBMS_OUTPUT.PUT_LINE(i.DEPARTMENT_ID || ' ' || i.DEPARTMENT_NAME);
  END LOOP;
END;
/

-- Ejemplo2: BLOQUE anonimo quer muestre cada empleado en 2lineas de informacion.
--           - ID de empleado + nombre + apellido + " cobra " + salario
--           - "Departamento: "


DECLARE
  CURSOR c_depemp IS
    SELECT emp.EMPLOYEE_ID, emp.first_name, emp.last_name, emp.salary, 
      dep.DEPARTMENT_NAME, job.JOB_TITLE
    FROM employees emp
      LEFT JOIN DEPARTMENTS dep ON (emp.DEPARTMENT_ID = dep.DEPARTMENT_ID)
      LEFT JOIN jobs job ON (emp.JOB_ID = job.JOB_ID);
BEGIN 
  FOR i IN c_depemp
  LOOP 
    DBMS_OUTPUT.PUT_LINE('Empleado: '|| i.first_name);
  END LOOP;

END; 
/

--EJERCICIO 1: Crea un bloque anonimo que muestre un log de informacion sobre cada departamento.
--             1a Linea: 'ID: ' + id_dep + 'NOMBRE: '  + dep_name
--             2a Linea: 'Lacalitzacio: ' + calle + cp + ciudada + pais
--             3a Estadisticas: 'Estadistica' + num_emp + salary_medio + salario_maximo || 'Sin informacion de estadistica'

/*ESTA MAL HACERLO CON JOIN Y QUITAR LAS SUBSELECT*/
DECLARE
  CURSOR c_curs IS
    SELECT
      dep.department_id, 
      dep.department_name, 
      loc.street_address,
      loc.postal_code,
      loc.city,
      cou.country_id,
      (
        SELECT COUNT(emp.EMPLOYEE_ID) 
        FROM employees emp
          LEFT JOIN DEPARTMENTS dep ON (emp.DEPARTMENT_ID = dep.DEPARTMENT_ID)
        GROUP BY dep.DEPARTMENT_ID;
      )
    FROM employees emp
      LEFT JOIN departments dep ON (emp.department_id = dep.department_id)
      LEFT JOIN locations loc ON (dep.location_id = loc.location_id)
      LEFT JOIN countries cou ON (loc.country_id = cou.country_id);
BEGIN
  FOR i IN c_curs
  LOOP 
    DBMS_OUTPUT.PUT_LINE(i.department_id);
  END LOOP;

END;
/