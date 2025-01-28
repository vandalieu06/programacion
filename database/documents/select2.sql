-- Muestra un listado de "todas" las ciudades y cuantos empleados trabajan en cada una
SELECT loc.city, COUNT(emp.employee_id)
FROM locations loc
	JOIN departments dep ON (dep.location_id = loc.location_id)
  JOIN employees emp ON (emp.department_id = dep.department_id)
GROUP BY loc.city;

-- Muetsra una lista de cada departamento (nombre) y el numero de trabajadores que hay en cada uno
SELECT dep.department_name, COUNT(emp.employee_id)
FROM departments dep 
  LEFT JOIN employees emp ON (emp.department_id = dep.department_id)
GROUP BY dep.department_name
ORDER BY 2 DESC;

-- Muestra en listado TODOS los empleaos (nombre, apellido) y el nombre de su managare
SELECT emp.first_name, emp.last_name, NVL(man.first_name, 'No tiene managar') AS "MANAGER NAME"
FROM employees emp
  JOIN employees man ON (man.employee_id = emp.manager_id);

--Muestra un listados de TODOS loes empleados y cuanta gente tienen  a su cargo,
SELECT man.first_name, COUNT(emp.employee_id)
FROM employees emp
  RIGHT JOIN  employees man ON (emp.manager_id = man.employee_id)
GROUP BY man.first_name
ORDER BY 2 DESC;

-- Muestra un listado de todos los empleados, el nombre de su departamento, la infomacion
-- de loaclizacion de su departamento (calle y ciudad), el nombre y apellido de su manager,
-- el job (job_title) del manager y el nombre del manager del departamento

SELECT 
  emp.employee_id, 
  dep.department_name, 
  loc.street_address, 
  loc.city, 
  man.first_name, 
  man.last_name, 
  manjob.job_title,   
  depman.first_name,
  depman.last_name
FROM employees emp
  LEFT JOIN employees man ON (emp.manager_id = man.employee_id)
  LEFT JOIN departments dep ON (dep.department_id = emp.department_id) 
  LEFT JOIN locations loc ON (loc.location_id = dep.location_id) 
  LEFT JOIN jobs manjob ON (man.job_id = manjob.job_id)
  LEFT JOIN employees depman ON (depman.employee_id = dep.manager_id);
