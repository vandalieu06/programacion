--Select Basicos
SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT first_name, last_name, salary + 300 FROM employees;
SELECT first_name, 12 * salary + 300, 12 * (salary + 300) FROM employees;
SELECT first_name, salary, commission_pct, salary*commission_pct, salary + (salary*commission_pct) FROM employees; --NULL 

-- Funcion NVL (pasar nulos a valor escogido)
SELECT 
  first_name, 
  salary, 
  commission_pct,
  NVL(commission_pct, -1), -- Si es nuelo le pone -1 porque 
  salary + (salary * NVL(commission_pct, 0)), -- Manera 1, pasara el nuemro a multiplicar a 0
  salary + NVL(salary * commission_pct, 0) -- Manera 2, sI el resultado de la multiuplicacion es null pone 0
FROM employees; -- SI ES NULL PONER 0

-- Alias columnas
SELECT 
  first_name Nombre, 
  last_name "Apellido",
  salary AS salario_manual,
  phone_number AS "Numero de telefono"
FROM employees;

SELECT 
  first_name,
  last_name, 
  first_name || ' ' || last_name AS "todo_junto",
  first_name || ' x ',
  'Rana ' || EMPLOYEE_ID || ': ' || first_name || ' ' || last_name AS muchas_cosas_juntas
FROM employees;

-- Restricciones (filtro de filas) y ordenacion
/* Tipo de compraciones:
  !=/<> --> diferente
  IN ()   --> coincide con algun elemento del conjunto
  BETWEEN x AND y --> esta dentro del rango x e y
  LIKE    --> coincide con el patron
  IS NULL --> evalua NULLs (exclusivo)
  NOT     --> invierte el resultrado (true - false)
*/

SELECT  first_name, last_name, salary
FROM employees
WHERE salary = 7000;

SELECT first_name, last_name, salary
FROM employees 
WHERE salary <> 7000;

SELECT first_name, last_name, salary
FROM employees 
WHERE  salary > 20000;

SELECT first_name, last_name, salary, NVL(commission_pct, 0) * 100 || '%' AS "Comission", commission_pct
FROM employees
WHERE NVL(commission_pct, 0) * 100 < 15;

SELECT first_name, last_name, department_id 
FROM employees
WHERE department_id IN (30, 50, 90, 100);

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 7000 AND 10000;

SELECT first_name, last_name, salary, commission_pct 
FROM employees
WHERE commission_pct IS NOT NULL;


SELECT first_name, last_name, department_id 
FROM employees
WHERE department_id NOT IN (30, 50, 90, 100);

--LIKE - Evaluacion de patron de caracteres
  -- % Cualquier combinacion de caracteres
  -- _ solo un caracter
SELECT first_name 
FROM EMPLOYEES 
WHERE first_name LIKE 'J%'; -- Gente que comienze con la j

SELECT first_name 
FROM EMPLOYEES 
WHERE first_name LIKE 'J____'; -- Gente cque comienze con j seguida de quatro caractres

SELECT first_name 
FROM EMPLOYEES 
WHERE first_name LIKE '%a%' OR first_name LIKE '%A%';

SELECT first_name 
FROM EMPLOYEES 
WHERE UPPER(first_name) LIKE '%A%';

SELECT first_name, email, SUBSTR(email, 1, 3) FROM employees; -- Obtener de desde la letra 1 3 caracteres de email.
SELECT first_name, email, SUBSTR(email, 3, 2) FROM employees;
SELECT first_name, email, SUBSTR(email, -1, 1) FROM employees; -- Ultima letra
SELECT first_name, email, SUBSTR(email, LENGTH(email), 1) FROM employees;

--LPAD O RPAD: rellena por la derecha o la izquierda
-- La palabra, hasta llegar a la longitud y con el 
-- caracter que le digas
-- LPAD(columna, longitus, rellena)
SELECT salary, LPAD(salary, 8, 0) AS "SALARY LONG 8" FROM employees;
SELECT salary, RPAD(salary, 8, 'x') AS "SALARY LONG 8" FROM employees;


--Funciones numericas
-- ROUND, MOD, MOD: modulo base x

SELECT ROUND(5.5), TRUNC(4.999999),MOD(784931984, 5) FROM dual;