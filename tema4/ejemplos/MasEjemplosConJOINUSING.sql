/*
Seleccionar el nomnre, los apellidos y el email de los empleados que trabajen en una oficina
del reino Unido (United kindom)
*/
SELECT first_name, last_name, email
FROM employees JOIN departments USING (department_id)
			   JOIN locations USING (location_id)
		       JOIN countries USING (country_id)
WHERE country_name = 'United Kingdom';

/*
Seleccionar el número total de empleados que trabajan en las regiones de América y Asia
*/
SELECT COUNT(*)
FROM employees JOIN departments USING (department_id)
			   JOIN locations USING (location_id)
			   JOIN countries USING (country_id)
		       JOIN regions USING (region_id)
WHERE region_name IN('Americas','Asia');
		
