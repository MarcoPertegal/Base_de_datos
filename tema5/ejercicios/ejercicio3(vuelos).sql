--1
SELECT a.nombre, count (id_cliente) AS "cantidad"
FROM reserva JOIN vuelo USING (id_vuelo)
			JOIN aeropuerto a ON (hasta = id_aeropuerto)
WHERE TO_CHAR(llegada, 'mm') IN('1','2','3')
GROUP BY a.nombre
ORDER BY cantidad ASC
LIMIT 3;

--4
SELECT a1.nombre, a2.nombre
FROM vuelo JOIN aeropuerto a1 ON (desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON (hasta = a2.id_aeropuerto)
WHERE 
LIMIT 10;

--5
SELECT id_vuelo
FROM vuelo 
WHERE TO_CHAR(salida, 'id') IN('5', '6', '7')
		AND TO_CHAR(salida, 'mm') IN('07/08')
