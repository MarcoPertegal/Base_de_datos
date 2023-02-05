--1
SELECT first_name, last_name
FROM employees JOIN departments USING (department_id)
WHERE department_name IN('IT','Finance')
	AND hire_date::text BETWEEN '%-05-%' AND '%-07-%';

--2
SELECT first_name, last_name
FROM employees JOIN departments USING (department_id)
WHERE manager_id IS NOT null AND department_name = 'Administration';

--3
SELECT country_name
FROM countries JOIN locations USING (country_id)
			JOIN departments USING (location_id)
WHERE department_name = 'Public Relations';

--4
SELECT first_name, last_name
FROM employees JOIN departments USING (department_id)
				JOIN locations USING (location_id)
				JOIN countries USING (country_id)
				JOIN regions USING (region_id)
WHERE region_name = 'Americas';

--5
SELECT d.first_name, d.last_name, e.first_name, e.last_name
FROM dependents d JOIN employees e USING (employee_id)
				JOIN departments USING (department_id)
				JOIN locations USING (location_id)
				JOIN countries USING (country_id)
				JOIN regions USING (region_id)
WHERE region_name = 'Americas'
	ORDER BY country_name ASC;
	
--6
--Seleccionar el nombre de aquellos empleados en los que el nombre de 
--su jefe empiece por 'A' que se localicen en la provincia 
--de 'Texas' o 'California', ordenando el nombre de manera descendente
SELECT e.first_name
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id)
				JOIN departments USING (department_id)
				JOIN locations USING (location_id)
WHERE region_name = 'Texas' OR 'California'
	ORDER BY e.first_name DESC;

