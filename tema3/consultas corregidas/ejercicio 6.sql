--EJeercico6 
--1
SELECT ROUND(AVG (temperatura_media),2)
FROM climatologia
WHERE provincia IN ('Jaén', 'Córdoba', 'Sevilla', 'Málaga', 'Granada', 'Huelva', 'Cádiz', 'Almería')
	AND STARTS_WITH (UPPER(estacion), 'AL')
	--AND fecha::text LIKE '2019-05-%'; formas de hacerlo
	AND fecha BETWEEN '2019-05-01'::date AND
		'2019-05-31'::date;
		
--2