--Seleccionar los empleados qie cobren mas que el empleado 145
--solo se ponen alias a las subvconsultas uqe haga,mpos en el frokm 
SELECT first_name, last_name, salary
FROM employees
WHERE salary < (
				SELECT salary
				FROM employees
				WHERE employee_id = 145
);

--Seleccionar los datos de quellos empleados que cobren lo mismo y esten en el mismo departamento
--que el empleado 101(sin que salga el mismo)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE (salary, department_id) = 
		(
			SELECT salary, department_id
			FROM employees
			WHERE employee_id = 101
		)
	AND employee_id != 101;
	
	
--Seleccionar los datos de aquellos empleados que cobren mas que todos los emplemados 
--del departmento de Purchasing 
SELECT *
FROM employees
WHERE salary > ALL(
					SELECT salary
					FROM employees JOIN departments USING (department_id)
					WHERE department_name = 'Purchasing'
					);

--Seleccionar los datos de aquellos empleados qe cobren más que la media de salarios
-- de los empleados del departamento de purchasing.
--No hace falta usar all pq avg ya devuelve un valor unico
--con ALL hace uqe la condicion se refiera a todas las filas que salen en la consultza

SELECT *
FROM employees
WHERE salary >	(
				SELECT AVG(salary)
				FROM employees JOIN departments USING (department_id)
				WHERE department_name = 'Purchasing'
				);
				
				
--seleccionar los empleados que tiene los mismos salariosque los empleados
--del departamento de purchasing 


SELECT *
FROM employees
WHERE salary > IN(
					SELECT salary
					FROM employees JOIN departments USING (department_id)
					WHERE department_name = 'Purchasing'
					);
-- equibalente a salary IN(2500, 2600, 2800, 2900, 3100, 11000)


--Seleccionar aquellos departamentos donde TODOS los epleados se contrataron en el 1994
SELECT department_id
FROM employees JOIN departments USING (department_id)
WHERE EXTRACT (year FROM hire_date) = 1994;
--esta de arriva no vale porque saldria todos los departamentos donde halla almemnos un empleado 
--que halla sido contratado en el 94
SELECT department_name
FROM employees JOIN departments USING (department_id)
WHERE department_id NOT IN 
					(SELECT department_id
					 FROM employees JOIN departments USING (department_id)
					 WHERE EXTRACT (year FROM hire_date) != 1994
					);
