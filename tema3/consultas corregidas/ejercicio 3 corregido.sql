--para ver las bases de datos disponibles, darle apublic, esquemas, tablas
--Ejericio 3
-- 2
SELECT*
FROM countries;

SELECT * 
FROM countries
WHERE country_name ILIKE '_a%';
-- para cualquier posicion %a%;

--4
SELECT *
FROM departments
WHERE department_name ILIKE '%t%t%';

--5
SELECT *
FROM locations
WHERE --city = 'Toronto' 
	city IN ('Toronto','Oxford')
	--OR city = 'Oxford'
	OR state_province = 'California';
