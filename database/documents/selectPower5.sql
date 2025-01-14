--PW 5 RESUMEN Y AGRUPACIONç
-- Agrupar una sola columna con FUNCIONEs
-- MAX, MIN, AVG, SUM, COUNT
SELECT MAX(salary) FROM EMPLOYEES; --Coge todos los salario y devuelve la mas grande
SELECT MIN(salary) FROM EMPLOYEES; --Coge todos los salario y devuelve el mas pequeño
SELECT ROUND(AVG(salary),2) FROM EMPLOYEES; --Coge todos los salario y devuelve la media de estos salarios
SELECT SUM(salary) FROM EMPLOYEES; --Coge todos los salario y devuelve la suma de todos
SELECT COUNT(salary) FROM EMPLOYEES; --Coge todos los salario y devuelve cunatos salarios hay

--Ejercicio de ejemplo
SELECT 
  MAX(salary) AS maximo, 
  MIN(salary) AS minimo, 
  SUM(salary) AS suma, 
  ROUND(AVG(salary),2) AS media, 
  COUNT(salary) AS total_empleados 
FROM employees;


-- Contexto: no puedo mostrar algunos campos resumidos, y otros no.
-- Muestra los departmantos en los que hay empleados y el salario medio de cada uno
-- COUNT, AVG, MIN, MAX, SUM, 
SELECT * FROM employees;
SELECT department_id, AVG(salary) FROM employees; -- Esto peta porque departamentos no esta agrupados
SELECT department_id, AVG(salary), MAX(salary) FROM employees WHERE department_id IS NOT NULL GROUP BY department_id;

-- Cuantos departamento hay en HR
SELECT COUNT(DEPARTMENT_ID) FROM DEPARTMENTS;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES;
SELECT COUNT(MANAGER_ID) FROM EMPLOYEES;
SELECT MANAGER_ID, EMPLOYEE_ID FROM EMPLOYEES;

-- CLASE 03 (19/12/2024)
SELECT last_name, AVG(Salary) FROM employees GROUP BY LAST_NAME;

SELECT * FROM LOCATIONS;
SELECT COUNTRY_ID, COUNT(LOCATION_ID)  
FROM LOCATIONS 
GROUP BY COUNTRY_ID 
ORDER BY 2 DESC; 

--Muetsra cuanta gente trabaja en el mismo departamento y con el mismo job
SELECT * FROM EMPLOYEES;
SELECT DEPARTMENT_ID, JOB_ID, COUNT(LAST_NAME) AS recuento
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID, JOB_ID 
ORDER BY 3 DESC, 1;

-- Muestra cuanto se gasta en salarios cada departamento y cual es el salario minimo maxmio y promedi de estos dep.
SELECT DEPARTMENT_ID, MIN(SALARY), MAX(SALARY), SUM(SALARY), ROUND(AVG(SALARY), 2) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY 1 DESC;

-- Muestra lso apellido de los empleados que se repiten
--HAVING PERMITE AÑADIR CONDICIONES A UNA QUERY QUE IMPLIQUE EVALUAR FUNCIONES DE RESUMEN/AGRUPACIÓN
--WHERE --> SIN FUNCIONES DE RESUMEN
SELECT LAST_NAME, COUNT(EMPLOYEE_ID) AS REPETIDOS
FROM EMPLOYEES
HAVING COUNT(EMPLOYEE_ID) > 1
GROUP BY LAST_NAME
ORDER BY LAST_NAME;

--EJeplo Tampa 2 : Muetsra los nombres que se repitan y que no empiexen por J
SELECT FIRST_NAME, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE 'J%'
HAVING COUNT(EMPLOYEE_ID) > 1
GROUP BY FIRST_NAME
ORDER BY 1 ASC;


/* LA QUE SE AVECINA
  - JOIN
  - LEFT/RIGHT/FULL/CROOS JOIN
  - SUBQUERRIES
  - UNION 
*/
SELECT 
    emp.EMPLOYEE_ID,
    emp.DEPARTMENT_ID,
    dep.DEPARTMENT_ID,
    emp.FIRST_NAME, 
    dep.DEPARTMENT_NAME,
    loc.CITY,
    job.JOB_TITLE
FROM EMPLOYEES emp
  JOIN DEPARTMENTS dep ON (emp.DEPARTMENT_ID = dep.DEPARTMENT_ID)
  JOIN LOCATIONS loc ON (dep.LOCATION_ID = loc.LOCATION_ID)
  JOIN JOBS job on (emp.JOB_ID = job.JOB_ID);

--Muestra los datos, pero los que no tienen assigando un jefe en esta tabla no se muestran
SELECT 
  emp.FIRST_NAME AS "Nombre Empleado",
  emp.LAST_NAME,
  man.FIRST_NAME AS "Nombre Jefe",
  man.LAST_NAME
FROM EMPLOYEES emp
  JOIN EMPLOYEES man ON (EMP.MANAGER_ID = man.EMPLOYEE_ID);

--Mostrar todos los empleados includo losque no estan assignados
SELECT 
  emp.FIRST_NAME AS "Nombre Empleado",
  emp.LAST_NAME,
  man.FIRST_NAME AS "Nombre Jefe",
  man.LAST_NAME
FROM EMPLOYEES emp
  LEFT JOIN EMPLOYEES man ON (EMP.MANAGER_ID = man.EMPLOYEE_ID);


-- SUB SELECT
SELECT * 
FROM EMPLOYEES 
WHERE SALARY >= (SELECT SALARY FROM EMPLOYEES
                  WHERE FIRST_NAME = 'Kimberely'
                  AND LAST_NAME = 'Grant');

SELECT 
  FIRST_NAME, 
  LAST_NAME, 
  SALARY, 
  (SELECT SUM(SALARY) FROM EMPLOYEES) 
FROM EMPLOYEES;

SELECT EMPLOYEE_ID AS Pocoyo, FIRST_NAME || ' ' || LAST_NAME AS Patoo, 'EMPLEADO' AS ELI  
FROM EMPLOYEES
UNION
SELECT DEPARTMENT_ID AS Pocoyo, DEPARTMENT_NAME AS Patoo, 'DEPT' AS ELI 
FROM DEPARTMENTS
UNION
SELECT LOCATION_ID AS Pocoyo, CITY AS Patoo, 'LOCALITION' AS ELI 
FROM LOCATIONS
ORDER BY 3 ASC;