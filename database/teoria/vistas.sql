/*id_departamento, nombre_departamento, localizacion_id, 
manager_id_departamento, total de empleados, salario medio, salario maximo y salario minimo
TODOS lOS DEPARTAMENTOS
*/
CREATE VIEW department_deatils AS
SELECT 
	dep.department_id, 
	dep.department_name, 
	dep.locaction_id, 
	dep.managaer_id, 
	COUNT(emp.employee_id) AS total_emps, 
	AVG(emp.salary) AS avg_salary,
	MIN(emp.salary) AS min_salary,
	MAX(emp.salary) AS max_salary
FROM deaprtments dep
	LEFT JOIN employees emp ON (dep.department_id = emp.department_id)
GROUP BY dep.department_id, dep.department_name, dep.locaction_id, dep.managaer_id,

/*Haz una select que muestre
	- nombre y apellido de los empleados
	- salario del empleado
	- nombtre del departamento
	- nombre del job
	- salario medio del departmaneto
	- salario maximo y salario minimo del departamento		
*/


SELECT 
	emp.first_name, 
	emp.last_name,
	emp.salary,
	job.job_title,
	depd.avg_salary,
	depd.max_salary,
	depd.mi_salary,
FROM employees emp
	JOIN jobs job ON (emp.job_id = emp.job_id)
	JOIN department_details depd ON (emp.department_id = depd.department_id);

/*MUestra todos los empleados, su nombre, apellido, salrio y numero total de empleados.*/
SELECT emp.first_name, emp.last_name, salary, (SELECT COUNT(employee_id) FROM employees) FROM employees emp;

/*Muestra todos los trabajaderes que cobran mas que el empleado 178*/

SELECT first_name
FROM employees_id
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 178);

SELECT first_name
FROM employees emp
	FULL JOIN

/*Muestra los empleados que trabajan en un departamento en el que haya alguien llamado 'Steven'*/
SELECT *
FROM employees emp
	JOIN departemnts dep ON (emp.department_id = dep.department_id)
WHERE dep.department_id IN (SELECT department_id FROM employees WHERE first_name='Steve')
	AND emp.first_name <> 'Steven';
