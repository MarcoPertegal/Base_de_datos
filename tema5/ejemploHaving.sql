/*seleccionar el numero de empleados que trabajan emn cda país
siempre que el pais no este en la region de Asia, siendo el número de empleado sea mayor que 5 
y menor que 10*/

SELECT country_name, COUNT(employee_id) --se selecciona el employee id por si acaso hay employyes nulos
FROM employees JOIN departments USING (department_id)
				JOIN locations USING (location_id)
				JOIN countries USING (country_id)
				JOIN regions USING (region_id)
WHERE region_name != 'Asia'
GROUP BY country_name
HAVING COUNT(employee_id) BETWEEN 5 AND 10;--este nuevo "where" afecta a un función de grupo GROUP BY es un HAVING = teniendo
--Having solo afecta a los groups, y las condiciones del having tiene que ser una de las condiciones
--max, min, count, avg, sum
