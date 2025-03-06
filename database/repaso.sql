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
BEGIN
  SELECT location_id FROM daw_employees;
  IF location_id IS NULL THEN
    UPDATE daw_employees SET 


END;