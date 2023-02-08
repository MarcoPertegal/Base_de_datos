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


				 
--2
SELECT c1.nombre, a1.nombre, cuidad, SUM(precio) as "cantidad"
FROM cliente JOIN reserva USING(id_cliente)
			JOIN vuelo USING (id_vuelo)
			JOIN aeropuerto a1 ON (desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON (hasta = a2.id_aeropuerto)
WHERE cantidad >= ALL(SELECT MAX(cantidad)
						FROM cliente JOIN reserva USING(id_cliente)
						JOIN vuelo USING (id_vuelo)
						JOIN aeropuerto a1 ON (desde = a1.id_aeropuerto)
						JOIN aeropuerto a2 ON (hasta = a2.id_aeropuerto)
					 	WHERE a1.nombre)
						