SELECT first_name, last_name, email
FROM employees JOIN departments USING (department_id)
			   JOIN locations USING (location_id)
		       JOIN countries USING (country_id)
WHERE country_name = 'United Kingdom';

/*Seleccionar el nombre de aquellos departamentos en los que trabaja un empleado 
que fue contratado a lo largo del año 1993.
*/
SELECT department_name
FROM departments JOIN employees USING (department_id)
WHERE hire_date::text ILIKE '1993-%';

/*Seleccionar la región de los empleados con un salario inferior a 10000$*/
SELECT DISTINCT region_name
FROM employees JOIN departments USING (department_id)
				JOIN locations USING (location_id)
				JOIN countries USING (country_id)
				JOIN regions USING (region_id)
WHERE salary < 10000

/*Seleccionar el nombre de aquellos empleados cuyo jefe directo tenga un apellido 
que empiece por D, H o S.*/
SELECT e.first_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.last_name LIKE 'D%' OR m.last_name LIKE 'H%' OR m.last_name LIKE 'S%'

/*Seleccionar el número de familiares (dependents) que son hijos de algún 
miembro de los departamentos  de Marketing, Administration e IT.*/
SELECT COUNT(*)
FROM dependents JOIN employees USING (employee_id)
	JOIN departments USING (department_id)
WHERE department_name IN('Marketing','Administration','IT')

