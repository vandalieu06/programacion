SET SERVEROUTPUT ON;
-- /: Delimitador que separa los bloques anonimos porque sino interpetra los dos anonimos como uno y da error
--EX 1
DECLARE
  v_hiredate DATE;
  v_deptno NUMBER(2) NOT NULL := 10;
  v_localition VARCHAR2(13) := 'Atlanta';
  cc_comm CONSTANT NUMBER := 1400;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Fecha: ' || v_hiredate);
  DBMS_OUTPUT.PUT_LINE('Number: ' || v_deptno);
  DBMS_OUTPUT.PUT_LINE('Localition: ' || v_localition);
  DBMS_OUTPUT.PUT_LINE('Constant Number: ' || cc_comm);
END;
/

--EX2
DECLARE
  v_A#a$ VARCHAR2(13) := 'Atlanta';
  --_num NUMBER := 2;
  X2 NUMBER := 2;
  --2X NUMBER := 2;
  v_num NUMBER := 12;
  --#A VARCHAR2(13) := 'Atlanta';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Var 1: ' || v_A#a$);
  --DBMS_OUTPUT.PUT_LINE('Var 2: ' || _num);
  DBMS_OUTPUT.PUT_LINE('Var 3: ' || X2);
  --DBMS_OUTPUT.PUT_LINE('Var 4: ' || 2X);
  DBMS_OUTPUT.PUT_LINE('Var 5: ' || v_num);
  --DBMS_OUTPUT.PUT_LINE('Var 6: ' || #A);
END;
/
--EX3
/*
DECLARE
  v_id NUMBER(4); 
  --v_x, v_y, v_z VARCHAR2(10); 
  v_birthdate DATE NOT NULL; 
  v_in_stock BOOLEAN:=1; 
  emp_ename emp_ename_type;
BEGIN

END;
/
*/

--EX4
DECLARE
  v_nom employees.first_name%TYPE;
  v_cognom employees.last_name%TYPE;
BEGIN
  SELECT first_name, last_name
  INTO v_nom, v_cognom
  FROM employees
  WHERE employee_id = 107;
  DBMS_OUTPUT.PUT_LINE('El treballador és: ' || v_nom || ' ' || v_cognom);
END;
/

--EX5
DECLARE
  v_nom employees.first_name%TYPE;
  v_cognom employees.last_name%TYPE;
  v_departament departments.department_name%TYPE;
BEGIN
  SELECT emp.first_name, emp.last_name, dep.department_name
  INTO v_nom, v_cognom, v_departament
  FROM employees emp
  LEFT JOIN departments dep ON emp.department_id = dep.department_id
  WHERE emp.employee_id = 109;
  DBMS_OUTPUT.PUT_LINE(v_nom || ' ' || v_cognom || ' treballa al departament ' || NVL(v_departament, 'Sense departament'));
END;
/

--EX6
DECLARE
  v_empleat1 employees.employee_id%TYPE := 107;  
  v_carrer1 locations.street_address%TYPE;
  v_ciutat1 locations.city%TYPE;
  v_codi_postal1 locations.postal_code%TYPE;
  v_provincia1 locations.state_province%TYPE;
  
  v_empleat2 employees.employee_id%TYPE := 109;
  v_carrer2 locations.street_address%TYPE;
  v_ciutat2 locations.city%TYPE;
  v_codi_postal2 locations.postal_code%TYPE;
  v_provincia2 locations.state_province%TYPE;
BEGIN
  SELECT loc.street_address, loc.city, loc.postal_code, loc.state_province
  INTO v_carrer1, v_ciutat1, v_codi_postal1, v_provincia1
  FROM employees emp
    JOIN departments dep ON emp.department_id = dep.department_id
    JOIN locations loc ON dep.location_id = loc.location_id
  WHERE emp.employee_id = v_empleat1;

  SELECT loc.street_address, loc.city, loc.postal_code, loc.state_province
  INTO v_carrer2, v_ciutat2, v_codi_postal2, v_provincia2
  FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations loc ON d.location_id = loc.location_id
  WHERE e.employee_id = v_empleat2;

  DBMS_OUTPUT.PUT_LINE('L''empleat ' || v_empleat1 || ' viu al carrer ' || v_carrer1 || ', ' || v_ciutat1 || ', ' || NVL(v_codi_postal1, 'Sense codi postal') || ', ' || NVL(v_provincia1, 'Sense província'));
  DBMS_OUTPUT.PUT_LINE('L''empleat ' || v_empleat2 || ' viu al carrer ' || v_carrer2 || ', ' || v_ciutat2 || ', ' || NVL(v_codi_postal2, 'Sense codi postal') || ', ' || NVL(v_provincia2, 'Sense província'));
END;
/

DECLARE
  v_total_empleats   NUMBER;
  v_total_departaments NUMBER;
  v_total_localitzacions NUMBER;
  v_total_paisos     NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total_empleats FROM employees;
  SELECT COUNT(*) INTO v_total_departaments FROM departments;
  SELECT COUNT(*) INTO v_total_localitzacions FROM locations;
  SELECT COUNT(*) INTO v_total_paisos FROM countries;

  DBMS_OUTPUT.PUT_LINE('Total d''empleats: ' || v_total_empleats);
  DBMS_OUTPUT.PUT_LINE('Total de departaments: ' || v_total_departaments);
  DBMS_OUTPUT.PUT_LINE('Total de localitzacions: ' || v_total_localitzacions);
  DBMS_OUTPUT.PUT_LINE('Total de països: ' || v_total_paisos);
END;
/

