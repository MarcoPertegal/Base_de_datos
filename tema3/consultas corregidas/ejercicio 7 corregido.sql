--Ejercicio 7
--1
SELECT *
FROM vuelos;

SELECT COUNT(*)
FROM vuelos
WHERE desde = 'Berlín'
AND hasta = ' Londres'
AND llegada BETWEEN 
		'2020-10-01'::date AND '2020-12-31'::date;
		
--2
SELECT vuelos.*, 
	COALESCE(ROUND(precio - (descuento/100),2), precio)
FROM vuelos
WHERE desde IN ('Sevilla', 'Málaga')
	AND hasta IN('Madrid', 'Barcelona')
	AND salida::text ILIKE '2020-12%';