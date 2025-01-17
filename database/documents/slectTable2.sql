--APUNTS QUERIES AND JOINS (Pw6)
--Muetsra nombre, apellido de los empleados y su nombre de departamento
--Solo deparrtamentos (id) 30, 50, 80, 100

SELECT emp.first_name, emp.last_name, dep.department_id, dep.department_name
FROM employees emp
  JOIN departments dep ON (emp.department_id = dep.department_id) 
WHERE department_id IN (30, 50, 80, 100)
ORDER BY 1, 2, 4;

--EX 1
SELECT emp.first_name || ' ' ||emp.last_name AS "Nombre completo", job.job_title
FROM employees emp
  JOIN jobs job ON (emp.job_id = job.job_id);

--EX 2: Muetrs el nombre y apellido de los empleados, el nombre de su depatrtamento y el nombre de su JOIN
SELECT emp.first_name, emp.last_name, dep.department_name, job.job_name, man.first_name
FROM employees emp
  JOIN departments dep ON (emp.departament_id = dep.department_id)
  JOIN jobs job ON (emp.job_id = job.job_id);
  JOIN employees man ON (emp.manager_id = man.employee_id)
WHERE emp.departament_id IS NOT NULL;

--EX 3: Muestra el nombre y apellido de cada empleado y el nombre de la ciudad en la que trabaja.
SELECT emp.first_name, emp.last_name, loc.CITY
FROM employees emp
  JOIN departments dep ON (emp.departament_id = dep.department_id)  
  JOIN locations loc ON (dep.location_id = loc.location_id);