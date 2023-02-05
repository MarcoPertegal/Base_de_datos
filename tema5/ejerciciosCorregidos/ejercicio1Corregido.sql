--1
SELECT department_name, MAX(salary)
FROM employees JOIN departments USING (department_id)
GROUP BY department_name;

--2
SELECT department_name, MIN(salary) 
FROM employees JOIN departments USING (department_id)
GROUP BY department_name
HAVING MIN(salary) < 5000;

--4
SELECT street_address, COUNT(employee_id) AS "num"
FROM employees RIGHT JOIN departments USING (department_id)
				JOIN locations USING (location_id)
GROUP BY street_address
ORDER BY num DESC;

select department_name, COUNT(employee_id)
FROM employyes RIGHT JOIN departments USING (department_id)
				LEFT JOIN locations USING (location_id)
GROUP BY street_address;

--5
SELECT salary, COUNT(*)
FROM employees
GROUP BY salary
ORDER BY COUNT(*) DESC
LIMIT 1;
--como se haría para seleccionar todos si coinciden
SELECT salary, COUNT(*)
FROM employees
GROUP BY salary
ORDER BY COUNT(*) = (SELECT MAX(val)
					FROM (SELECT salary, COUNT(*) AS "val"
							FROM employees
							GROUP BY salary)
					) d;
--6           
SELECT TO_CHAR(hire_date, 'YYYY') as "anio", COUNT(*)
FROM employees
GROUP BY anio
ORDER BY anio;