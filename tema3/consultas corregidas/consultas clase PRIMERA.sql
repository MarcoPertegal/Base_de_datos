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

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 15000