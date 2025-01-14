SELECT * FROM employees;

-- 1. Nom, Cognom i email dels empleats que cobren més de 12000$.
SELECT first_name, last_name, email, salary || "€" AS SALARY
FROM employees 
WHERE salary >= 12000;

-- 2. Nom i Cognom dels empleats contractats entre l’any 2007 i 2009.
--Opcion Jhonny:
SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN TO_DATE('01-01-2007', 'DD-MM-YYYY') AND TO_DATE('31-12-2009', 'DD-MM-YYYY');

--Opcion correcta (professor):
SELECT first_name, last_name 
FROM employees 
WHERE TO_CHAR(hire_date, 'YYYY') BETWEEN '2007' AND '2009';

-- 3. Mostrar els noms(title) des JOBS que tinguin un salari mínim entre 5000 i 10000.
SELECT job_title 
FROM jobs 
WHERE min_salary BETWEEN 5000 AND 10000; 

-- 4. Nom, Cognom, sou, sou anual (12 mesos). Reanomena l’última columna com a ‘salari12’.
SELECT 
  first_name, 
  last_name, 
  salary, 
  salary * 12 AS "salari12" 
FROM employees;

--5. En una sola columna mostra la frase: <nom> <cognom> cobra <salari> dòlars mensuals i va ser 
--   contractat al mes de <mes on va ser contractat> . Reanomena la columna com a ‘La Frase’ .
SELECT first_name || ' ' || last_name || ' cobra ' || salary || ' dolars mensuals i va ser contractat al mes de ' || TO_CHAR(hire_date, 'Month') || '.' AS "La Frase" 
FROM employees; 


-- 6. Mostrar l’id i nom dels JOBS que continguin la categoria de "manager" (que continguin la paraula “manager”).
SELECT job_id, job_title 
FROM jobs 
WHERE LOWER(job_title) LIKE '%manager%';

-- 7. Mostra els noms de departament que comencen per ‘C’ i terminen en ‘N’ . Han de poder mostrar-se tant els que 
--   tenen les lletres en majúscula com en minúscula.
SELECT department_name 
FROM departments 
WHERE UPPER(department_name) LIKE 'C%N'; 

-- 8. Mostra els noms de departament que tenen un nom compost (dues paraules o més) i que tenen MANAGER assignat.
SELECT department_name 
FROM departments 
WHERE department_name LIKE '% %' AND manager_id IS NOT NULL;
--WHERE INSTR(department_name, ' ') > 0 AND manager_id IS NOT NULL;

-- 9. Mostra a quins països (Countries) corresponen els ids (CA, KW i MX). Mostra el nom enmajúscules.
SELECT UPPER(country_name) 
FROM countries 
WHERE country_id IN ('CA', 'KW', 'MX');

--10. Mostra el Nom i salari diari de cada empleat arrodonit a 2 decimals i en Euros. Considera que tots 
--    els mesos tenen 30 dies i que l’Euro està a 0.94$.
SELECT 
  first_name, 
  ROUND((salary / 30 * 0.94), 2) || '€' AS "Salari arrodonit" 
FROM employees; 

-- 11. Nom, Cognom, longitud del número de telèfon (nombre de xifres) i job_id dels empleats que no pertanyin a 
--     (IT_PROG, ST_CLERK i SA_REP), ordenats per Cognom de forma descendent.
SELECT first_name, last_name, LENGTH(phone_number) AS "Nombre de Xifres", job_id 
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') 
ORDER BY last_name DESC; 

/*
  12. Nom, salari + comissió (arrodonit a 1 xifra), data de contractació.
    • La comissió es calcula multiplicant el camp salary pel camp commission_pct.
    • Tingues en compte que no tots els empleats cobren comissió, però no per això s’ha de deixar de mostar el seu sou.
    • El format de la data de contractació serà: <dia> de <mes en paraules> del <anys en 4 xifres>.
    Per exemple: 24 de MARÇ del 1998
*/
SELECT 
  first_name, 
  --salary,
  --commission_pct,
  salary + salary * ROUND(NVL(commission_pct, 0), 1) AS "Salary + Comissio", 
  TO_CHAR(hire_date, 'DD "de" MONTH "del" YYYY') AS "Fecha Formato Nuevo"  
FROM employees;

-- 13. Mostra els noms dels departaments de la localització 1700 i que no tinguin un manager
--     assignat; i, a més, el departament amb id 20.
SELECT department_name 
FROM departments 
WHERE (location_id = 1700 OR department_id = 20) AND manager_id IS NOT NULL;

-- 14. Mostra la llista d’empleats amb el seu salari. El salari ha d’ocupar 6 dígits, afegint zeros a
--    l’esquerra. Reanomena la columna de salari a “SALARI6”.
SELECT  first_name, LPAD(salary, 6, '0') AS "SALARI6" 
FROM employees;

-- 15. Mostra el salari màxim, mínim i mitjà, dels empleats que treballen al departament 100.
SELECT MAX(salary) AS "MAX", MIN(salary) AS "MIN", ROUND(AVG(salary), 2) AS "MIDDLE" 
FROM employees 
WHERE DEPARTMENT_ID = 100;

-- 16. Mostra els noms de tots els empleats i quantes vegades està repetit cada nom.
SELECT first_name, COUNT(first_name) as "REPEAT_NAME" 
FROM employees 
GROUP BY first_name; 

