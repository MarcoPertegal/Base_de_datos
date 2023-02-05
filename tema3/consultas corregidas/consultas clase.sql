SELECT *
FROM employees;

SELECT employee_id, 
		first_name, last_name
FROM employees;



--Seleccionar todos los datos de empleados que cobren menos de 10000$ de mayor a menor. 

SELECT *
FROM employees
WHERE salary < 10000
ORDER BY salary DESC;

-- 10000 y 15000
SELECT*
FROM employees
WHERE salary >= 10000 AND salary <= 15000;

-- LO mismo de arriba pero mejor
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

SELECT *
FROM departments;

-- si usamos and=y no saldria bien porque se va pisando se usa or
SELECT *
FROM employees
WHERE department_id = 1
	OR  department_id = 2
	OR department_id = 3;

SELECT *
FROM employees
WHERE department_id IN (1, 3, 5);

--LIKE que empiece por
--% eL TANTO PORCIENTO CUALQUIER CADENA DE CARACTERES DE 0 O MÁS CARACTERES, es sensible con mayuscular y minusculas 
-- para evitar mayusculas y minusculas se usa ILIKE( se va a usar siempre ILIKE)
SELECT *
FROM employees
WHERE first_name ILIKE 'ale%';

--Nombre empieve por a pero segundaletra del nombre sea cualquiera pero la segunda letra sea otra a y ya despues lo que sea
SELECT *
FROM employees
WHERE first_name ILIKE 'a_a%';

--Operador NOT
-- Slececionar empleados que NO cobren mas de 1000$ dolares
SELECT *
FROM employees
-- WHERE salary <= 1000;
WHERE NOT (salary > 1000);

--Seleccionar empleados del departamento 6 que cobren entre 7000 y 9000
SELECT *
FROM employees
WHERE department_id=6
	AND salary BETWEEN 7000 AND 9000;

--Seleccionar empleados que cobran menos de 10000 y la primera letra del nombre es A o n.
-- AQuí harían falta los parentesis porque sino el salario se aplicaría a and bien pero despues a or no le afectaría.
SELECT *
FROM employees
WHERE salary < 10000
	AND (first_name ILIKE 'a%'
	OR first_name ILIKE 'n%');

-- Buscar al empleado en el manager_id es nulo, si quisiesemos lo contrario abria que poner IS NOT NULL
SELECT manager_id
FROM employees
WHERE manager_id IS NULL;

--Concadenar texto
SELECT first_name || '' || last_name
		AS "Full name",
	'Department ID: ' || department_id
		AS "Department ID"
FROM employees;

--Devulveme los empleados con sus datos y añade el salario pero le vas a restar el 10% 
SELECT salary,
		salary - (salary*10/100)
FROM employees;

--Seleccinar empleados contratados el mes de junio
SELECT *
FROM employees
WHERE hire_date::text LIKE '%-06-%'

--Cuentos empleados hay en la tabla empleados
SELECT count (*)

FROM employees
WHERE department_id = 6;

--Calcula el salario medio de los empleados del departamento 6
SELECT sum(salary)
FROM employees;

--Cual es el máximo salario del departamento 6
SELECT max(salary), min(salary)
FROM employees
WHERE department_id = 6;