--BASE DE DATOS HR
--Seleccionar aquellos empleados que fueron contratados en la misma fecha que a los empleados
--que trabajan de programador
SELECT *
FROM employees
WHERE hire_date IN
					(SELECT hire_date
					 FROM employees JOIN jobs USING(job_id)
					 WHERE job_title = 'Programmer'
					);

--Selecciona los tres puestos de trabajo con los que se puede llegar a tener un mayor salario maximo, 
--sin contar aquellos salarios que pueden llegar a coincidir
SELECT job_title, MAX(max_salary) as "max_salary"
FROM jobs 
GROUP BY job_title
HAVING MAX(max_salary) IN (
						SELECT DISTINCT MAX(max_salary)as "max_salary"
						FROM jobs
						GROUP BY job_title
						ORDER BY max_salary DESC
						LIMIT 3)
ORDER BY max_salary DESC;

--Selecciona los tres departamentos que tienen una media de salario más alto
SELECT department_name, ROUND(AVG(salary),2) as "media"
FROM employees JOIN departments USING (department_id)
GROUP BY department_name
ORDER BY media DESC
LIMIT 3;


