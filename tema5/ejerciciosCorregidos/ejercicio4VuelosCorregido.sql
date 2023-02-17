--1
--Consulta parecida pero mal
SELECT TO_CHAR(salida, 'ID'), 
		MAX(age(llegada, salida))
FROM vuelo JOIN aeropuerto d 
		ON (d.id_aeropuerto = vuelo.desde)
	JOIN aeropuerto h 
		ON (h.id_aeropuerto = vuelo.hasta)
GROUP BY TO_CHAR(salida, 'ID');

--consutla correcta
SELECT d.ciudad, h.ciudad, salida, llegada,
		TO_CHAR(salida, 'TMDay'),
		age(llegada, salida)
FROM vuelo v JOIN aeropuerto d 
		ON (d.id_aeropuerto = v.desde)
	JOIN aeropuerto h 
		ON (h.id_aeropuerto = v.hasta)
WHERE age(llegada, salida) >= ALL
			(
				SELECT age(llegada, salida)
				FROM vuelo v2
				WHERE TO_CHAR(v.salida, 'ID')
						= TO_CHAR(v2.salida, 'ID')			
			)
ORDER BY TO_CHAR(v.salida, 'ID');

--2
SELECT c.nombre, apellido1, apellido2,
		d.nombre, d.ciudad, 
		SUM(
			COALESCE(precio * 
					 (1 - (descuento::numeric/100)),
						precio)
			) as "gasto_por_cliente"
FROM cliente c JOIN reserva USING (id_cliente)
		JOIN vuelo v USING (id_vuelo)
		JOIN aeropuerto d 
			ON (d.id_aeropuerto = desde)
GROUP BY c.id_cliente,c.nombre, apellido1, apellido2,
		v.desde, d.nombre, d.ciudad
HAVING SUM(
			COALESCE(precio * 
					 (1 - (descuento::numeric/100)),
						precio)
			) >= ALL (
						SELECT SUM(
							COALESCE(precio * 
									 (1 - (descuento::numeric/100)),
										precio)
							)
						FROM vuelo v2 JOIN
							reserva USING (id_vuelo)
						WHERE v.desde = v2.desde
						GROUP BY id_cliente, v2.desde
			)
ORDER BY gasto_por_cliente DESC;


				 
--2

						