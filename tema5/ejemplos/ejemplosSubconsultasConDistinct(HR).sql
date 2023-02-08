--Selecciobar los 5 empleados que mas cobran
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

--Seleccionar los empleados que cbran los 5 salarios mas altos
--Se selecciona todos los salarios mas altos sin que se repitan con distinct y despues se seleecionan
--los empleados que tengan esos salarios
SELECT *
FROM employees
WHERE salary IN(
				SELECT DISTINCT salary
				FROM employees
				ORDER BY salary DESC
				LIMIT 5);
				
--Seleccionar los 3 departamentos con empleados con salarios más altos.
--Debe aparecer el nombre del departamento y el salario más alto de dicho departamento
SELECT department_name, MAX(salary) as "max_salary"
FROM employees JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY max_salary DESC
LIMIT 3;



--Seleccionar los 3 departamentos con empleados con salarios más altos.
--Debe aparecer los 5 salarios mas altos. el resultado debe ser el nombre del departamento
--y el salrio más alto de dicho departamento.
SELECT department_name, MAX(salary) as "max_salary"
FROM employees JOIN departments USING(department_id)
GROUP BY department_name
HAVING MAX(salary) IN (
						SELECT DISTINCT MAX(salary) as "max_salary"
						FROM employees JOIN departments USING(department_id)
						GROUP BY department_name
						ORDER BY max_salary DESC 
						LIMIT 5)
ORDER BY max_salary DESC;
							