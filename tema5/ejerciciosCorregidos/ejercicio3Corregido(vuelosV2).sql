--1
SELECT nombre, COUNT(id_reserva) as "trafico"
FROM vuelo JOIN reserva using (id_vuelo)
			JOIN aeropuerto ON (hasta = id_aeropuerto)
WHERE TO_CHAR(llegada, 'mm') IN('01','02','03')
GROUP BY nombre
ORDER BY trafico
LIMIT 3;

--2
SELECT 
FROM cliente JOIN operacion USING (id_cliente)
			JOIN inmueble USING (id_inmueble)
			JOIN tipo ON (id_tipo = tipo_inmueble)
WHERE precio_final 
--4
SELECT s.nombre, l.nombre, age(vuelo.l, vuelo.s)
FROM vuelo JOIN aeropuerto s ON(vuelo.desde = s.id_aeropuerto)
			JOIN aeropuerto l ON(vuelo.hasta = l.id_aeropuerto)
WHERE id_vuelo IN(
				SELECT id_vuelo
				FROM vuelo
				ORDER BY age(llegada, salida)
				LIMIT 10
				)
				
	