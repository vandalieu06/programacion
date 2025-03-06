SET SERVEROUTPUT ON;

DECLARE 
    v_dept_id NUMBER := 80;
    v_job_id VARCHAR2(20) := 'SA_REP';

    v_dept_name VARCHAR2(100);
    v_job_name VARCHAR2(100);
BEGIN
    SELECT department_name
    INTO v_dept_name
    FROM departments
    WHERE department_id = v_dept_id;
    
    SELECT job_title
    INTO v_job_name
    FROM jobs
    WHERE job_id = v_job_id;

    DBMS_OUTPUT.PUT_LINE(v_dept_name);
    DBMS_OUTPUT.PUT_LINE(v_job_name);
END;
/

CREATE OR REPLACE PROCEDURE obtener_info (p_id_employee NUMBER)
IS
    v_name_manager VARCHAR2(100);
    v_last_name_manager VARCHAR2(100);
    v_number_employees NUMBER;
BEGIN
    SELECT man.first_name, man.last_name, COUNT(emp.employee_id)
        INTO v_name_manager, v_last_name_manager, v_number_employees
    FROM employees man
        JOIN employees emp ON (man.employee_id = emp.manager_id)
    WHERE man.employee_id = p_id_employee
    GROUP BY man.first_name, man.last_name;
    
    DBMS_OUTPUT.PUT_LINE(v_name_manager || ' ' || v_last_name_manager || 
        ' és mànager de ' || v_number_employees || ' empleats.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No s''ha trobat cap mànager amb aquest ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

EXECUTE obtener_info(100);
EXECUTE obtener_info(600);

CREATE OR REPLACE PROCEDURE obtener_gasto (p_id_department NUMBER)
IS
    v_suma NUMBER;
BEGIN
    SELECT SUM(emp.salary)
        INTO v_suma
    FROM departments dep
        JOIN employees emp ON (dep.department_id = emp.department_id)
    WHERE dep.department_id = p_id_department;

    IF v_suma > 19000 THEN
        DBMS_OUTPUT.PUT_LINE('Es gasten molt!');
    ELSIF v_suma < 19000 THEN
        DBMS_OUTPUT.PUT_LINE('Es gasten poc!');
    ELSIF v_suma = 19000 THEN
        DBMS_OUTPUT.PUT_LINE('Es gasten justament 19000');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

EXECUTE obtener_gasto(10);
EXECUTE obtener_gasto(20);
EXECUTE obtener_gasto(80);