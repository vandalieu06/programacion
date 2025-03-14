/*
  DESCRIPCION: Crea una función func_max_salary que reciba un ID de departamento y devuelva el 
               salario más alto en ese departamento. Si el departamento no tiene empleados, la 
               función debe retornar NULL.
*/

CREATE OR REPLACE FUNCTION func_max_salary(p_dep_id NUMBER) 
RETURN NUMBER IS
  max_salary_dep NUMBER;
BEGIN
  SELECT MAX(emp.salary) INTO max_salary_dep
  FROM employees emp
  WHERE emp.DEPARTMENT_ID = p_dep_id; 

  RETURN max_salary_dep;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/

SELECT func_max_salary(20) FROM dual;
SELECT func_max_salary(50) FROM dual;

/*
  DESCRIPCION: Crea un procedimiento proc_increase_salary que reciba un ID de empleado y un porcentaje de aumento.
               Debe actualizar el salario del empleado en la tabla EMPLOYEES.
               Si el empleado no existe, debe mostrar un mensaje con DBMS_OUTPUT.PUT_LINE.
*/
CREATE OR REPLACE PROCEDURE proc_increase_salary (p_emp_id NUMBER, p_augmento NUMBER) IS
BEGIN
  IF p_augmento < 100 THEN
    UPDATE EMPLOYEES_COPY
    SET SALARY = SALARY * (p_augmento / 100 + 1)
    WHERE EMPLOYEE_ID = p_emp_id;
  END IF;

  DBMS_OUTPUT.PUT_LINE('Usuario actualizado correctamente.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('El usuario no existe.');
END;