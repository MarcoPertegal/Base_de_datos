--3
SELECT *
FROM vuelos
WHERE (descuento IS NULL OR descuento = 0)
	AND hasta = 'Nueva York'
	AND llegada BETWEEN '2020-10-01'::date
			AND '2020-10-15'::date;

--4
SELECT *
FROM vuelos
WHERE salida::text ILIKE '2021-01%'
	AND desde = 'Ámsterdam'
	AND llegada::text ILIKE '% 09%'
	--
	AND LEFT(RIGHT(llegada::text,5),2)::int
		BETWEEN 0 AND 59;
--La parte de abajo no haría falta, está escrita porque en algunos casos hace falta 

--5
--con solo el asterisco vale pero cuando tengamos mas de una 
--tabla en el from havbrá que usarlo así para acostumbrarnos
SELECT vuelos.*, COALESCE(ROUND(precio * (1 - (descuento/100)),2), precio) AS "precio_final",
		CASE
			WHEN COALESCE(ROUND(precio * (1 - (descuento/100)),2), precio)< 60 THEN '¡OFERTÓN'
			WHEN COALESCE(ROUND(precio * (1 - (descuento/100)),2), precio)< 120 THEN '¡ECONÓMICO'
			WHEN COALESCE(ROUND(precio * (1 - (descuento/100)),2), precio)< 200 THEN '¡NORMAL'
			WHEN COALESCE(ROUND(precio * (1 - (descuento/100)),2), precio)>= 200 AND 
			COALESCE(ROUND(precio * (1 - (descuento/100)),2), precio)< 300 THEN 'CARO'
		ELSE 'MUY CARO'
		END AS "mensaje precio"
FROM vuelos
WHERE desde = 'Sevilla'
	AND salida::text ILIKE '2021%';

SELECT *, 
	COALESCE(ROUND (precio-(precio*descuento/100),2), 0) AS "Precio Final",
	CASE 
		WHEN COALESCE(ROUND (precio-(precio*descuento/100),2),0)< 60 THEN 'Ofertón'
		WHEN COALESCE(ROUND (precio-(precio*descuento/100),2),0)>= 120 THEN 'Económico'
	END AS "Mensaje texto"
FROM vuelos
WHERE  desde ='Sevilla'
	AND salida::text ILIKE '2020-%';