--2
SELECT jefes.first_name, jefes.last_name
FROM employees subordinados JOIN departments USING (department_id)
			JOIN employees jefes ON (subordinados.manager_id = jefes.employee_id)
WHERE department_name = 'Administration';
--No se que falla la verda

--5
SELECT * 
FROM dependents d JOIN employees e USING (employee_id)
				JOIN departments USING (department_id)
				JOIN locations USING (location_id)
				JOIN countries USING (country_id)
				JOIN regions USING (region_id)
WHERE region 
	