SELECT COUNT(*)
FROM departments;

--SE usa para que aparezcan en la consulta aquellos datos que no se ven reflejkados
--en alguna de las tablas del join
-- no sale ninguna fila extra porque todas tienen relacion
SELECT *
FROM employees RIGHT JOIN departments USING (department_id);

SELECT *
FROM employees LEFT JOIN departments USING (department_id);
