--1. Mostra nom, salari i nom de departament, dels empleats que cobren més de 5000 i
--   pertanyen als departaments 50, 60 o 100.
SELECT emp.first_name, emp.salary, dep.department_name
FROM employees emp
    JOIN departments dep ON (dep.department_id = emp.department_id)
WHERE emp.salary > 5000 AND emp.department_id IN ('50', '60', '100');


--2. Llista que contingui: Nom dels departaments, el seu carrer, la ciutat i el nom del país.
SELECT dep.departament_name, loc.street_address, loc.city, cou.country_name 
FROM department dep
    JOIN locations loc ON (loc.location_id = dep.location_id)
    JOIN countries cou ON (cou.country_id = loc.country_id);

--3. Mostra el nom, cognom i nom del job (job_title) dels empleats que treballen al departament ‘IT’ (department_name).
SELECT emp.first_name, emp.last_name, job.job_title
FROM employees emp
    JOIN jobs job ON (job.job_id = emp.job_id)
    JOIN departments dep ON (dep.departament_id = emp.departament_id)
WHERE UPPER(dep.departament_name) IN ('IT');

--4. Mostra el nom i cognom dels empleats que treballen a la ciutat de ‘Seattle’.
SELECT emp.first_name, emp.last_name
FROM employees emp
    JOIN departaments dep ON (dep.departament_id = emp.departament_id)
    JOIN locations loc ON (loc.location_id = dep.location_id)
WHERE UPPER(loc.city) IN ('SEATTLE');

--5. Mostra el nom i cognom de cada empleat i el nom i cognom del seu manager.
SELECT emp.first_name, emp.last_name, man.first_name, man.last_name
FROM employees emp
    JOIN employees man ON (man.employee_id = emp.manager_id)

--6. Llista que contingui:
-- • Nom del treballador.
-- • Nom del responsable del treballador (manager).
-- • Nom del job del treballador.
-- • Nom del job del responsable (manager).
SELECT emp.first_name, man.first_name, job.job_title, jobman.job_title
FROM employees emp
    JOIN jobs job ON (job.job_id = emp.job_id)
    JOIN employees man ON (man.employee_id = emp.manager_id)
    JOIN jobs jobman ON (jobman.job_id = man.job_id); 

--7. Llista que contingui:
-- • Nom i Cognom dels treballadors
-- • Nom del departament
-- • Nom del job
-- • Han de sortit TOTS els treballadors contractats entre 2005 i 2007
SELECT emp.first_name, emp.last_name, dep.departament_name, job.job_title
FROM employees emp
    JOIN departaments dep ON (dep.departament_id = emp.departament_id)
    JOIN jobs job ON (job.job_id = emp.job_id)
WHERE TO_CHAR(emp.hire_date, 'YYYY') BETWEEN '2005' AND '2007';

-- 8. Quan es gasta cada departament (nom) en salaris. Mostra TOTS els departaments ?
SELECT dep.departament_name, NVL(SUM(emp.salary), 0)
FROM departaments dep
    LEFT JOIN employees emp ON (emp.departament_id = dep.departament_id)
GROUP BY dep.departament_name;

-- 9. Mostra tots els empleats que son managers i mostra quanta gent tenen al seu càrrec.
SELECT man.first_name, NVL(COUNT(emp.employee_id), 0)
FROM  employees emp
    JOIN employees man ON (man.employee_id = emp.manager_id)
GROUP BY man.first_name;

-- 10. Mostrar els empleats (nom), el seu manager (nom), el manager (nom) del seu
-- departament i la comissió de cada un d’ells en format TANT PER CENT (%). Si pots, mostra’ls TOTS .
SELECT emp.first_name, man.first_name, depman.first_name, NVL(emp.commission_pct * 100, 0) || '%' AS "Comision"
FROM employees emp  
    LEFT JOIN employees man ON man.employee_id = emp.manager_id
    LEFT JOIN departments dep ON emp.department_id = dep.department_id
    LEFT JOIN employees depman ON dep.manager_id = depman.employee_id;

-- 11. Quants treballadors hi ha a cada departament?
-- • Mostra els noms de departament amb el nombre de treballadors que hi ha.
-- • Mostra’ls TOTS .
SELECT dep.departament_name, COUNT(emp.employee_id)
FROM departaments dep
    LEFT JOIN employees emp (emp.departament_id = dep.departament_id)
GROUP BY dep.departament_name;

-- 12. Mostra el nom de les ciutats i nombre de treballadors, d’aquelles on hi ha més de 4 treballadors
SELECT loc.city, COUNT(emp.first_name)
FROM locations loc
    JOIN departaments dep ON (dep.location_id = loc.location_id)
    JOIN employees emp ON (emp.departament_id = dep.departament_id)
GROUP BY loc.city
HAVING COUNT(emp.employee_id) > 4;
