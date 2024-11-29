SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS WHERE LOCATION_ID <> 1700;

/*
Ejercicio 1: Mostrar nombres y apellidos
  Escribe una consulta para mostrar los nombres (first_name) y apellidos (last_name) de todos los 
  empleados de la tabla employees. Renombra las columnas como Nombre y Apellido, respectivamente.
*/

SELECT first_name AS Nombre, last_name AS APELLIDO FROM EMPLOYEES;

/*
Ejercicio 2: Filtrar empleados por departamento
  Escribe una consulta para obtener los nombres (first_name), apellidos (last_name) y salarios (salary) 
  de los empleados que trabajan en el departamento 50 (department_id = 50).
*/

SELECT first_name, last_name, salary FROM EMPLOYEES WHERE department_id = 50;

/*
Ejercicio 3: Filtrar salarios por rango
  Escribe una consulta para listar los nombres (first_name), apellidos (last_name) y salarios (salary) 
  de los empleados cuyo salario está entre 5000 y 10000.
*/

SELECT first_name, last_name, salary FROM EMPLOYEES WHERE salary BETWEEN 5000 AND 10000;

/*
Ejercicio 4: Filtrar combinando condiciones
  Escribe una consulta para mostrar los nombres (first_name), apellidos (last_name) y trabajos (job_id) 
  de los empleados que trabajan en el departamento 30 o cuyo salario sea mayor o igual a 10000.
*/

SELECT first_name, last_name, job_id FROM EMPLOYEES WHERE department_id = 50 OR salary >= 10000; 


/*EXTRA*/
SELECT employee_id, first_name, last_name, salary, RANK() OVER (ORDER BY salary DESC) as ranking
  FROM EMPLOYEES 
  ORDER BY ranking;
/*
  - RANK() deja huecos y ordena segun lo indicado
  - DENSE_RANK() no deja un hueco;
  - ROW_NUMBER() clasifica todos los registros de forma diferente, aunque los valores sean los mismos.
*/

WITH employee_ranking AS (
  SELECT first_name, last_name, salary, RANK() OVER (ORDER BY salary DESC) as ranking 
  FROM EMPLOYEES 
) SELECT first_name, last_name, salary FROM employee_ranking WHERE ranking <=5 ORDER BY ranking; 