/*
  TIPO: Procedimiento
  NOMBRE: proc_compara_salarios
  INPUT: p_empid1, p_empid2
  DESC: Muestra un menaje informande dek nombre del empleado que cobre mas
        de los dos. EN caso de empate, muestra los dos nombres.
  CONTROL DE ERRORES: Si alguno de los dos empleados no existe genera un error e 
                      infroma de cual no existe.
*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE proc_compara_salarios (p_empid1 NUMBER, p_empid2 NUMBER)
IS
  e_jhonny EXCEPTION;
  v_salary1 NUMBER;
  v_n1 VARCHAR2(100);
  v_salary2 NUMBER;
  v_n2 VARCHAR2(100);
BEGIN
  SELECT first_name, salary
    INTO v_n1, v_salary1
  FROM employees
  WHERE employee_id = p_empid1;

  SELECT first_name, salary 
    INTO v_n2, v_salary2
  FROM employees
  WHERE employee_id = p_empid2;

  IF v_salary1 > v_salary2 THEN
    DBMS_OUTPUT.PUT_LINE(v_n1);
  ELSIF v_salary1 < v_salary2 THEN
    DBMS_OUTPUT.PUT_LINE(v_n2);
  ELSIF v_salary1 = v_salary2 THEN
    DBMS_OUTPUT.PUT_LINE(v_n1 || ' - ' || v_n2);
  END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('El empleado no existe');
END;
/
EXEC proc_compara_salarios(100, 101);



/*
  PREVIA: Modifica la tabla de DAW_EMPLOYEES para añadirle la columna location_id (y una foreign key a LOCATIONS.LOCATION_ID)
  TIPO: Procedimiento
  NOMBRE: proc_load_emp_location
  INPUT: p_emp_id NUMBER, p_locations_id NUMBER
  DESC: El procedimiento actualizara la columna location_id de la tabla employees usando 
        el id de la localizacion de su departamento. Si el empleado ya tiene cargada una localizacion,
        no se actualizara y dara un mensaje avisando de esto.
  ERRORES: 
      - Si el empleado no tiene departamento, informa del error.
      - SI el empleado no existe, infroma del error. 
*/

CREATE TABLE daw_employees AS SELECT * FROM EMPLOYEES;
ALTER TABLE daw_employees ADD location_id NUMBER;

CREATE OR REPLACE PROCEDURE proc_load_emp_location(p_emp_id NUMBER, p_locations_id NUMBER)
IS
  v_loc_id NUMBER;
BEGIN
  --Buscar location_id del dept del empleado
  SELECT dep.location_id INTO v_loc_id
  FROM daw_employees emp
    LEFT JOIN departments dep ON (emp.department_id = dep.department_id)
  WHERE emp.employee_id = p_emp_id;

  --Comprobante de acualizacion de empleado location_id
  IF v_loc_id IS NULL THEN
    UPDATE daw_employees SET location_id = v_loc_id
    WHERE employee_id = p_emp_id;    
    DBMS_OUTPUT.PUT_LINE('Empleado actualizado');
  ELSE
    --Mostrar mensaje final
    DBMS_OUTPUT.PUT_LINE('Empleado ya esta actualizado, no se puede volver a hacer.');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Todo OK')

END;
/

/*
  TIPO: FUNCTION
  NOMBRE: func_first_hire_date
  INPUT: p_emp_id NUMBER
  OUTPUT: DATE
  DESCRIPTION: A la funcion se le pasa una ID de un empleado y retorna la primera fecha de incorporacion
                a la empresa del empleado (teniendo en cuenat las tablas de EMPLOYEES y la de JOB_HISTORY)
  CONSTROL DE ERRORES: Si el empleado no existe, retorna null 
*/
CREATE OR REPLACE FUNCTION func_first_hire_date(p_emp_id NUMBER) 
RETURN DATE IS
  first_date DATE; 
BEGIN
  SELECT MIN(hire_date)
  INTO first_name
  FROM (
    SELECT HIRE_DATE FROM EMPLOYEES_COPY WHERE EMPLOYEE_ID = 101
    UNION ALL
    SELECT start_date FROM JOB_HISTORY WHERE EMPLOYEE_ID = 101;
  );
  
  RETURN first_date;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  WHEN OTHERS THEN 
    RETURN NULL;
END;
/


/*
  TIPO: FUNCTION
  NOMBRE: func_total_salary
  INPUT: p_empid NUMBER 
  OUTPU: NUMBER
  DESC: Retornar la suma de todo el salario pagado a un empleado desde su fecha de contratatcion
        teniendo en cuenta que el salario de la tabla empleado es mensual. Calcularlo desde su 
        primera fecha de contratatcion.
  CONTROL ERRORS: RETORNA null si el empleado no existe
*/

--Hecho por mi, me olvide de añadir un paretesis a la suma de los meses (ya añadido).
CREATE OR REPLACE FUNCTION func_total_salary(p_empid NUMBER) 
RETURN NUMBER IS 
  v_suma NUMBER;
BEGIN 
  -- ((RESTO AÑOS * 12 MESES) + MESES RESTANTES) * SALARY  
  SELECT 
    ((((TO_CHAR(SYSDATE, 'YYYY') - 1) - (TO_CHAR(HIRE_DATE, 'YYYY') + 1)) * 12) 
    + TO_CHAR(HIRE_DATE, 'MM') 
    + (12 - TO_CHAR(SYSDATE, 'MM'))) 
    * SALARY 
  INTO v_suma
  FROM EMPLOYEES_COPY
  WHERE employee_id = p_empid; 
  RETURN v_suma;
EXCEPTION
  WHEN NO_DATA_FOUND THEN 
    RETURN NULL;
END;
/

-- Chat GPT Corregido añadiendo TO_NUMBER
CREATE OR REPLACE FUNCTION func_total_salary(p_empid NUMBER) 
RETURN NUMBER IS 
  v_suma NUMBER;
BEGIN 
  SELECT 
    ((((TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - 1) - (TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) + 1)) * 12) 
    + TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM')) 
    + (12 - TO_NUMBER(TO_CHAR(SYSDATE, 'MM')))) 
    * SALARY 
  INTO v_suma
  FROM EMPLOYEES_COPY
  WHERE employee_id = p_empid; 

  RETURN v_suma;
EXCEPTION
  WHEN NO_DATA_FOUND THEN 
    RETURN NULL;
END;
/


SELECT func_total_salary(100) FROM DUAL;

/*
  TIPO: FUNCTION
  NOMBRE: func_diferencia_salario
  INPUT: p_emp1id NUMBER, p_empid2 NUMBER
  OUTPUT: NUMBER 
  DESC: Retorna la diferencia de salraios que hay entre los dos empleados.
        devuekve ese valor simepre en positivo. 
  CTRLK ERRORS: 
    - Si algun empleado no existe, retorna el salario del otro.
    - Si no existe ninguno retorna 0
*/

CREATE OR REPLACE FUNCTION func_diferencia_salario(p_empid1 NUMBER, p_empid2 NUMBER)
RETURN NUMBER IS
  v_salary1 NUMBER;
  v_salary2 NUMBER;
BEGIN
  BEGIN
    SELECT salary INTO v_salary1 FROM EMPLOYEES_COPY WHERE EMPLOYEE_ID = p_empid1;
  EXCEPTION WHEN NO_DATA_FOUND THEN RETURN NULL;
  END;

  BEGIN
    SELECT salary INTO v_salary2 FROM EMPLOYEES_COPY WHERE EMPLOYEE_ID = p_empid2;
  EXCEPTION WHEN NO_DATA_FOUND THEN RETURN NULL;
  END;

  RETURN ABS(v_salary1 - v_salary2);
END;
/
/*
  TIPO: FUNCTION
  NOMBRE: func_mayor_o_menor
  INPUT: p_depname VARCHAR2, p_option VARCHAR2
  OUTPUT: NUMBER
  DESCR: A la funcion se le pasara el nombre de un departamento (sin importar
         mayusculas o minusculas) y la opcion ("MORE" o "LESS"). La funcion debera
         retornar el id del empleadoque cobre mas o menos de ese departamento (en 
         funcion de la opcion que nos pase)
  ERRORS: 
        - Si el dapartamento no existe, retorna NULL
          > SELECT y poner dato en una variable
        - SI el departamento no tiene empleado retorna -1 
          > COUNT
*/

CREATE OR REPLACE FUNCTION func_mayor_o_menor(p_depname VARCHAR2, p_option VARCHAR2)
RETURN NUMBER IS
  v_salary NUMBER;
BEGIN 

  IF UPPER(p_option) = 'MORE' THEN
    SELECT emp.employee_id
    INTO v_salary
    FROM employees emp
      JOIN departments dep ON (emp.department_id = dep.department_id)
    WHERE UPPER(dep.department_name) = UPPER(p_depname) 
      AND emp.SALARY = (
        SELECT MAX(SALARY) 
        FROM EMPLOYEES 
        WHERE DEPARTMENT_ID = dep.department_id
      );--AND ROWNUM = 1; --Mostrar solo una fila, es algo similar a LIMIT de otro tipo de base de datos como MYSQL, MARIADB, SQLite... 
  ELSIF UPPER(p_option) = 'LESS' THEN
    SELECT emp.employee_id
      INTO v_salary
      FROM employees emp
        JOIN departments dep ON (emp.department_id = dep.department_id)
      WHERE UPPER(dep.department_name) = UPPER(p_depname) 
        AND emp.SALARY = (
          SELECT MIN(SALARY) 
          FROM EMPLOYEES 
          WHERE DEPARTMENT_ID = dep.department_id
        );
  END IF;

  RETURN v_salary;
END;
/

SELECT func_mayor_o_menor('Marketing', 'More') FROM DUAL;
SELECT func_mayor_o_menor('Marketing', 'Less') FROM DUAL;


/*
  TIPO: Procedimiento
  NOMBRE: proc_create_department
  INPUT: p_name VARCHAR2, p_loc NUMBER, p_man NUMBER
  DESCRIPTION: al procedimiento le pasaremo un nombre de depatrtamento (nuevo), el id de una 
               localizacion y el id de un empleado manager. Se debera insertar un nuevo registro 
               en la tabla departmanetos (copy_departments). Usa la secuencia de departments (departments_seq) 
               para insertar los nuevo IDs 
  ERRORES: 
          - Si el department_name esta repetido genera un error e informa.
          - Si el department name o la lacalizacion id esta en NULL, genera un error e informa
          - Si no existe el location_id, genera un error e informa   
          - Si no existe el empleado (p_man), genera un errro e infroma.
*/

CREATE TABLE cp_departments AS SELECT * FROM DEPARTMENTS;

CREATE OR REPLACE PROCEDURE proc_create_department(p_name VARCHAR2, p_loc NUMBER, p_man NUMBER)
IS  

BEGIN

END;