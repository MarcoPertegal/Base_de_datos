--1
SELECT department_name, MAX(salary)
FROM employees JOIN departments USING (department_id)
GROUP BY department_name;

--2
SELECT department_name, MIN(salary) 
FROM employees JOIN departments USING (department_id)
GROUP BY department_name
HAVING MIN(salary) < 5000;

--3
SELECT street_address, COUNT(employee_id)
FROM employees JOIN departments USING (department_id)
				JOIN locations USING (location_id)
GROUP BY street_address;

--4
SELECT street_address
FROM employees JOIN departments USING (department_id)
				JOIN locations USING (location_id)
WHERE employee_id IS NULL;

--5
SELECT salary,COUNT(*) as "total"
FROM employees
GROUP BY salary
ORDER BY total DESC
LIMIT 1;

--6
SELECT TO_CHAR(hire_date, 'yyyy') as "anio", COUNT(employee_id) 
FROM employees
GROUP BY anio
ORDER BY anio ASC;

SELECT *
FROM employees

