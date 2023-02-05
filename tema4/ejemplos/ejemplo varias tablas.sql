--selecciona el nombre, los apellidos, y nombre de departamento 
--y el salario de aquelos empledados que cobren más de 10000$

SELECT first_name, last_name, department_name, salary
FROM employees, departments
WHERE employees.department_id =
		departments.department_id
	AND salary >10000
ORDER BY salary DESC;

--

SELECT first_name, last_name, department_name, salary, job_title
FROM employees, departments, jobs
WHERE employees.department_id =
		departments.department_id
	AND employees.job_id = jobs.job_id
	AND salary >10000
ORDER BY salary DESC;

-- esto es equivalente
SELECT *
FROM employees, departments;

SELECT *
FROM employees CROSS JOIN departments;

SELECT *
FROM employees NATURAL JOIN departments;

--equivalentes
SELECT *
FROM employees
	JOIN departments USING (department_id);

SELECT *
FROM employees, departments
WHERE employees.department_id = departments.department_id;

--

SELECT e1.first_name, e1.last_name,
		e2.first_name, e2.last_name
FROM employees e1 JOIN employees e2
	ON (e1.manager_id = e2.employee_id);
	
-- Seleccionar todos los datos de aquellos empleados que pertenezcan
--al departamento Executive
SELECT *
FROM employees JOIN departments USING (department_id)
WHERE department_name = 'Executive';

--Selecciona el nombre de aquellos departamentos que tengan empleados que cobren entre
-- 8 y 10 mil dólares (incluidos)
SELECT DISTINCT department_name
FROM departments JOIN employees USING(department_id)
WHERE salary BETWEEN 8000 AND 10000;


--Seleccionar el nombre y apellidos de aquellos empleados que no trabajan en 
--oficinas situadas en Oxford
SELECT first_name, last_name
FROM employees JOIN departments 
		USING (department_id)
	JOIN locations
		USING (location_id)
WHERE city !='Oxford';

--Seleccionar el nº de empleados de la región Europe
SELECT COUNT (*)
FROM employees JOIN departments 
		USING (department_id)
	JOIN locations 
		USING (location_id)
	JOIN countries
		USING (country_id)
	JOIN regions
		USING (region_id)
WHERE region_name = 'Europe';
	