/*EJERCICIO 1, apartado 2,3,4,5*/
/*Seleccionar el nombre de aquellos departamentos en los que trabaja un empleado 
que fue contratado a lo largo del año 1993.*/
SELECT DISTINCT department_name
FROM departments JOIN employees USING (department_id)
WHERE hire_date::text ILIKE '1993-%';

/*Seleccionar la región de los empleados con un salario inferior a 10000$*/
SELECT DISTINCT region_name
FROM employees JOIN departments USING (department_id)
				JOIN locations USING (location_id)
				JOIN countries USING (country_id)
				JOIN regions USING (region_id)
WHERE salary < 10000;

/*Seleccionar el nombre de aquellos empleados cuyo jefe directo tenga un apellido 
que empiece por D, H o S.*/
/*en esta si el employee_id coincide con el manager_id siguinfica que el empleado es un jefe*/
/*Se le da el em1 para que al duplicar la misma tabla se pueda diferenciar en el ON*/
/*se selecciona em2 en el left porque es donde estan los jefes, no los empleados*/
SELECT em1.first_name, em1.last_name
FROM employees em1 JOIN employees em2 ON(em1.manager_id = em2.employee_id)
WHERE UPPER(LEFT(em2.last_name,1)) IN('D','H','S');

/*Seleccionar el número de familiares (dependents) que son hijos de algún 
miembro de los departamentos  de Marketing, Administration e IT.*/
SELECT COUNT(*)
FROM dependents JOIN employees USING (employee_id)
	JOIN departments USING (department_id)
WHERE department_name IN('Marketing','Administration','IT')
	AND relationship = 'Child';

