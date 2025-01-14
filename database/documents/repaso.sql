--1
SELECT first_name, last_name, salary, UPPER(first_name)
FROM employees
WHERE salary > 7000 AND salary <24000
ORDER BY first_name DESC, 3 DESC;

--2
SELECT first_name, last_name, salary, UPPER(first_name), 
  first_name || ' ' || last_name AS "Full name"
FROM employees
WHERE salary > 7000 AND salary <24000
ORDER BY first_name DESC, 3 DESC;

--3
SELECT street_address || ', ' || city || '(' || postal_code ||').' 
FROM addresses;

--4
SELECT first_name, LENGTH(last_name)
FROM employees
ORDER BY LENGTH(first_name) ASC;

--5
SELECT first_name, hire_date, TO_CHAR(hire_date, 'DD-MM')
FROM employees
ORDER BY 2 DESC;

--6
SELECT first_name, hire_date, 
  TO_CHAR(hire_date, '"Se contrato un" DAY "en el mes " ')
FROM employees
ORDER BY 2 DESC;

--6
SELECT TO_DATE('17-Marzo', 'DD-MONTH')
FROM dual;

--7
SELECT COUNT(salary)
FROM employees
GROUP BY department_id;

--8
SELECT first_name, COUNT(first_name)
FROM employees
WHERE firstname LIKE 'J%'
HAVING COUNT(first_name) > 1
GROUP BY first_name
ORDER BY 2 ASC;

--EX 1
SELECT department_id, ROUND(AVG(SALARY), 2)
FROM employees
HAVING ROUND(AVG(SALARY), 2) > 5000
GROUP BY department_id
ORDER BY 2 DESC; 

--EX 2
SELECT employee_id, first_name, last_name 
FROM employees
HAVING ROUND(AVG(salary)) < salary
GROUP BY employee_id, first_name, last_name 
ORDER BY 3 DESC, 1 DESC, 2 DESC; 

--EX 2 - BIEN
SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY 3 DESC; 


--EX 3
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY employee_id
HAVING COUNT(employee_id) > 5
ORDER BY 1 ASC;

