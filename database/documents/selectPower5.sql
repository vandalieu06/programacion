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
SELECT * FROM employees;
SELECT department_id, AVG(salary) FROM employees; -- Esto peta porque departamentos no esta agrupados
SELECT department_id, AVG(salary), MAX(salary) FROM employees WHERE department_id IS NOT NULL GROUP BY department_id;

-- Cuantos departamento hay en HR
SELECT COUNT(DEPARTMENT_ID) FROM DEPARTMENTS;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES;
SELECT COUNT(MANAGER_ID) FROM EMPLOYEES;
SELECT MANAGER_ID, EMPLOYEE_ID FROM EMPLOYEES;