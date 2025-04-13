SET SERVEROUTPUT;
CREATE TABLE employees_copy AS SELECT * FROM EMPLOYEES;

/*EJERCICIO 1
  TIPO: PROCEDURE OR FUCNTION
  NOMBRE: insert_log
  INPUT: p_table VARCHAR2, p_action VARCHAR2, p_desc VARCHAR2
  DESCRIPCION: Inserta un registrro en la tabla de daw_logs_con la info que no pasan por parametro.
               La fecha del registro tiene que ser la decha actual.
*/
CREATE OR REPLACE PROCEDURE insert_log (p_table VARCHAR2, p_action VARCHAR2, p_desc VARCHAR2)
IS
BEGIN 
  INSERT INTO daw_logs
    VALUES (seq_daw.logs.NEXTVAL, LOWER(p_table), SYSDATE, LOWER(p_action), p_desc);
END;
/
EXEC insert_log('employees', 'insert', 'Lorem ipsum ... holamundo');

ROLLBACK;

/*EJERCICIO 3
  TIPO: PROCEDIMIENTIO
  NOMBRE: proc_regula_salario
  INPUT: p_employee_id
  OUTPUT: logs
  DESCR: Revisa si el salario del empleado esta en los limites de sy naximo y minimo por JOB
    - Si el salario del empleado esta por  debajo del minimo lo actualiza al salario minimo
    - Si el salario esta por encima del máximo lo actualiza al salario máximo
    - Si esta entre los limites no hace nada  
  Muestra mensaje de cada accion del procedimiento, y guardo los cambios en una linea
  de la tabla de logs(si hahabido algun cambio en el salario).
*/
CREATE OR REPLACE PROCEDURE proc_regula_salario (p_employee_id NUMBER)
IS
  v_salary  NUMBER;
  v_max_salary  NUMBER;
  v_min_salary  NUMBER;
BEGIN
  SELECT emp.SALARY, job.MAX_SALARY, job.MIN_SALARY 
    INTO v_salary, v_max_salary, v_min_salary
  FROM employees_copy emp
    JOIN jobs job ON emp.job_id = job.job_id
  WHERE emp.employee_id = p_employee_id;

  IF v_salary < v_min_salary THEN
    UPDATE employees_copy SET SALARY = v_min_salary
    WHERE employee_id = p_employee_id;
    --AQUI VA EL log
  ELSIF v_salary > v_max_salary THEN
    UPDATE employees_copy SET SALARY = v_max_salary
    WHERE employee_id = p_employee_id;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salario OK, está dentro del rango del JOB, no estas sobrevalorado ni infravalaroda CRACK! (eres normal)');
  END IF;


END;

/*TEORIA 1*/
/*EXPECPCIONES
  Sintaxis:
    BEGIN
    ...
    EXCEPTION
      WHEN <error_type> THEN
        ...
      WHEN <error_type> THEN
        ...
      WHEN <error_type> THEN
        ...
    END;
  Tipos de error: NO_DATA_FOUND, TOO_MANY_ROWS, DIVO, OTHERS
*/

CREATE OR REPLACE PROCEDURE proc_emplota(p_name VARCHAR2, div NUMBER, duplicado BOOLEAN)
IS
  v_emp_id    NUMBER;
  v_resultado NUMBER;
BEGIN
  -- Busca ID del empleado
  SELECT employee_id INTO v_emp_id FROM employees WHERE first_name = p_name;
  --Calculo para que explote
  v_resultado = 9000/div;
IF duplicado
  INSERT INTO employees_copy 
END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error - ese nombre no existe');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Error - el nombre corresponde a varios usuarios');
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error - no se puede dividir por zero');
  WHEN OTHERS THEN 
    DBMS_OUTPUT.PUT_LINE('Error inesperado');
    DBMS_OUTPUT.PUT_LINE(sqlerrm);


END;