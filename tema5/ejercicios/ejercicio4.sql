--1

SELECT a1.nombre, a2.nombre, salida, llegada, DATEDIFF(minute, salida, llegada) as "duracion"
FROM vuelo JOIN aeropuerto a1 ON (desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON (hasta = a2.id_aeropuerto)
WHERE duration >= (SELECT MAX (duration)
				 FROM vuelo 
				 WHERE TO_CHAR())
				 
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
						
