--Seleccionar el salario medio maximo agrupando por departamentos

SELECT MAX(media)--Aqi no puedo mostrar el department name es imposible
FROM(
	SELECT department_name, AVG(salary) as "media"
	FROM employees JOIN departments USING (department_id)
	GROUP BY department_name
) d;

--Salario medio max
SELECT department_name, AVG(salary) as "media"
	FROM employees JOIN departments USING (department_id)
	GROUP BY department_name
ORDER BY media DESC
LIMIT 1;