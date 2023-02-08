--Seleccionar todos los vuelos, indicando para cada uno de ellos si la duración 
--del vuelo es corta, normal o larga, en función de que dicha duración sea menor, igual o mayor 
--que la duración media de todos los vuelos.
SELECT d.ciudad, h.ciudad,
        age(llegada, salida) as "duracion",
        (
            SELECT AVG(AGE(llegada, salida))
            FROM vuelo
        ) as "media",
        CASE
            WHEN age(llegada, salida) <
                (SELECT AVG(AGE(llegada, salida))
                 FROM vuelo) THEN 'Corto'
            WHEN age(llegada, salida) =
                (SELECT AVG(AGE(llegada, salida))
                 FROM vuelo) THEN 'Normal'
            ELSE 'Largo'
        END
FROM vuelo JOIN aeropuerto d
            ON (d.id_aeropuerto = vuelo.desde)
        JOIN aeropuerto h
            ON (h.id_aeropuerto = vuelo.hasta);
			
--Nueva forma de hacerlo "Fácil"
WITH gasto_total_cliente AS (
	SELECT id_cliente,
	 SUM(
		COALESCE(precio * (1 - (descuento::numeric/100)),
			precio)
		) as "gasto_total"
		FROM reserva JOIN vuelo USING (id_vuelo)
		GROUP BY id_cliente
	
), gasto_total_medio AS (
	SELECT AVG(gasto_total) as "media"
	FROM gasto_total_cliente
)
SELECT nombre, apellido1, apellido2, 
		SUM(
				COALESCE(precio * (1 - (descuento::numeric/100)),
						precio)
			)
FROM cliente JOIN reserva USING (id_cliente)
		JOIN vuelo USING (id_vuelo)
GROUP BY nombre, apellido1, apellido2
HAVING SUM(
				COALESCE(precio * (1 - (descuento::numeric/100)),
						precio)
			) < (SELECT media
				 FROM gasto_total_medio);