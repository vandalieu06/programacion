SET SERVEROUTPUT ON;


/*EXERCISE 1*/
CREATE OR REPLACE FUNCTION FULL_ADDRESS (p_loc_id NUMBER) 
RETURN VARCHAR2 IS  
  v_result VARCHAR2(100);
  e_per EXCEPTION;
BEGIN

  IF p_loc_id IS NULL THEN
    RAISE e_per;
  END IF;

  SELECT loc.street_address || ' ' || loc.city || ' ' || loc.postal_code
  INTO v_result
  FROM locations loc
  WHERE loc.location_id = p_loc_id;

  RETURN v_result;
EXCEPTION
  WHEN e_per THEN
    RETURN 'error-NULL';
  WHEN NO_DATA_FOUND THEN
    RETURN 'error-No location';
END;
/


SELECT FULL_ADDRESS(20) FROM dual;
SELECT FULL_ADDRESS(1000) FROM dual;
SELECT FULL_ADDRESS(NULL) FROM dual;

/*EXERCISE 2*/

CREATE OR REPLACE PROCEDURE MORE_OR_LESS (p_dep_id NUMBER)
IS
  avg_salary_dep NUMBER;
  avg_salary_emp NUMBER;
  v_dep_name VARCHAR2(100);
BEGIN

  SELECT dep.DEPARTMENT_NAME
  INTO v_dep_name
  FROM DEPARTMENTS dep
  WHERE dep.DEPARTMENT_ID = p_dep_id;
  
  SELECT AVG(EMP.SALARY) 
  INTO avg_salary_dep
  FROM EMPLOYEES emp 
  WHERE emp.DEPARTMENT_ID = p_dep_id;

  SELECT AVG(SALARY) INTO avg_salary_emp FROM EMPLOYEES;

  IF avg_salary_dep > avg_salary_emp THEN 
    DBMS_OUTPUT.PUT_LINE('La mitjana salarial està per sobre al department ' || v_dep_name);
  ELSIF avg_salary_dep < avg_salary_emp THEN
    DBMS_OUTPUT.PUT_LINE('La mitjana salarial està per sota al department ' || v_dep_name);
  ELSE
    DBMS_OUTPUT.PUT_LINE('NO hi ha diferencies entre les mitjanes');
  END IF;

END;
/

EXEC MORE_OR_LESS(100);

/*EXERCISE 3*/

ALTER TABLE EMPLOYEES_COPY ADD city VARCHAR2(200);
SELECT * FROM EMPLOYEES_COPY;

CREATE OR REPLACE PROCEDURE UPGRADE_EMP_CITY
IS
  CURSOR c_depemp IS
    SELECT 
      emp.EMPLOYEE_ID empid, 
      'Empleado: ' || emp.FIRST_NAME || ' ' || emp.LAST_NAME || ' con ' || loc.CITY AS mensaje,
      loc.city 
    FROM EMPLOYEES_COPY emp
      JOIN DEPARTMENTS dep ON (emp.DEPARTMENT_ID = dep.DEPARTMENT_ID)
      JOIN LOCATIONS loc ON (dep.LOCATION_ID = loc.LOCATION_ID);
BEGIN
  FOR i IN c_depemp
  LOOP 
    UPDATE EMPLOYEES_COPY SET city = i.CITY WHERE EMPLOYEE_ID = i.empid;
    DBMS_OUTPUT.PUT_LINE(i.mensaje);
  END LOOP;

END;
/


EXEC UPGRADE_EMP_CITY();

/

/*
  TIPO: Procedimiento
  NOMBRE: update_max_salary
  INPUT: p_job_id VARCHAR2, p_salary NUMBER
  DESCR: El procedimeinto intentará actualiar el valor de max_salary del job que recibe.
         Si no hay ningun conflicto con salarios de empleados, se actualizará el valor.
         Si hay empleados con ese job que tienen salarios más altos que el nuevo valor,
         se mostrará una lista de cada empleado (id, nombre, apellido y salario) que entre 
         en conflicto y no se actualizarź el max_salary.
  CTRL.ERRS: Si el job_id no existe, informa del error 
*/

CREATE OR REPLACE PROCEDURE update_max_salary (p_jobid VARCHAR2, p_salary NUMBER) 
IS
  v_update BOOLEAN := TRUE;
  CURSOR c_curs IS 
    SELECT first_name ||  ' ' || last_name as name, salary 
    FROM employees emp
      RIGHT JOIN jobs job ON (emp.job_id = job.job_id)
    WHERE salary > p_salary 
      AND job.job_id = p_jobid;
BEGIN

  FOR c IN c_curs LOOP
    v_update := FALSE;
    DBMS_OUTPUT.PUT_LINE('Empleado en conflicto: ' || c.name || ' salrio ' || c.salary);
  END LOOP;

  IF v_update THEN 
    UPDATE jobs SET max_salary = p_salary WHERE job_id = p_jobid;
    DBMS_OUTPUT.PUT_LINE('Se ha actualizado correctamente!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('No se ha actualizado!');
  END IF;

END;

/
EXEC update_max_salary('30', 3600);

/*
  Dame 1 ejercicio para practicar Oracle PLSQL, sobre la version 11g y usando la bbdd de HR. 
  Se podrá pedir crear FUNCION, PROCEDIMIENTO, o BLOQUE ANONIMO. REdacta el ejercicio en formato
  NOMBRE, TIPO, PARAMETROS ENTRADA, PARAMETROS SALIDA (solo funciones), DESCRPICION DEL EJERCICIO,
  CONTROL DE ERRORES(por exception). El ejercicio puede incluir de DML , Queries, operaciones aritmeticas,
  control de flujo con IF-ELSIF-ELSE y EXCEPTIONS. NO des puestas sobre el tipo de codigo o operadores a usar.
*/