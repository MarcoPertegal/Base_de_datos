--TIPO A
--1 Seleccionar la ciudad de origen , la ciudad de destino, la fecha y hora de salida y la fecha y
--hora de llegada de aquellos vuelos que salieron desde el aeropuerto de la ciuad de sevilla en el mes de 
--Junio de 2022 en un avión de la compañia Airbus
SELECT a1.ciudad, a2.ciudad, salida, llegada
FROM vuelo JOIN aeropuerto a1 ON(desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON(hasta = a2.id_aeropuerto)
			JOIN avion a3 USING (id_avion)
WHERE a1.ciudad ='Sevilla'
	AND TO_CHAR (salida, 'mm/yy')IN('06/22')
	AND a3.nombre IN('Airbus A380-800', 'Airbus A340-600', 'Airbus A320');
			
--2 Seleccionar el nombre y los dos apellidos de aquellos clientes que reservaron un vuelo que
--salió en el mes de Sepriembre de 2022 con exactamente un me sde antelación (despreciando la hora)
--y que tengan nombre compuesto, la salida del nombre no debe ser totalmente en mayusctula, solo la primera
--letra.
SELECT initcap(nombre), apellido1, apellido2
FROM cliente JOIN reserva USING(id_cliente)
			JOIN vuelo USING(id_vuelo)
WHERE TO_CHAR (salida, 'mm/yy') IN('09/22')
	AND (fecha_reserva - salida) < '30'::interval
	AND nombre ILIKE '% %';

--3 
SELECT COUNT(apellido1)
FROM cliente JOIN reserva USING (id_cliente)
			JOIN vuelo USING (id_vuelo)
			JOIN aeropuerto a1 ON(desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON(hasta = a2.id_aeropuerto)
WHERE a1.nombre = 'Barajas'
	AND a2.nombre= 'Berlín-Tegel'
	AND descuento IS NOT NULL;
	
--4
SELECT c1.nombre, apellido1, apellido2
FROM cliente c1 JOIN reserva USING (id_cliente)
			JOIN vuelo USING (id_vuelo)
			JOIN aeropuerto a1 ON(desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON(hasta = a2.id_aeropuerto)
WHERE TO_CHAR(fecha_reserva, 'id') IN('5', '6', '7')
	AND a2.ciudad = 'Barcelona';

--5
SELECT c1.nombre, apellido1, apellido2, ROUND(((precio-(precio*descuento)/100)),2)
FROM cliente c1 JOIN reserva USING (id_cliente)
			JOIN vuelo USING (id_vuelo)
			JOIN aeropuerto a1 ON(desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON(hasta = a2.id_aeropuerto)
WHERE a1.nombre = 'Pablo Picasso'
	AND TO_CHAR(salida, 'id/mm')IN('2/08', '5/10')
	
	
--TIPO B
--2 Seleccionar el nombre y apellidos de aquellos diferentes clientes que hicieran reservas en el inicio de semana
--(hasta miercoles) para algún vuelo que haya salide desde Berlín, ya debe haber salido
SELECT DISTINCT c.nombre, c.apellido1, c.apellido2
FROM cliente c JOIN reserva USING (id_cliente)
				JOIN vuelo USING (id_vuelo)
				JOIN aeropuerto ae ON (desde = id_aeropuerto)
WHERE salida < CURRENT_TIMESTAMP
	AND ae.ciudad = 'Berlín'
	AND TO_CHAR(fecha_reserva, 'ID') IN('1', '2', '3');