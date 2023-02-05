--Mostar el aeropuesto de salido, el aeropueto de llegada y llegada de los vuelos que
--han salido desde sevilla hacia londres en un Martes de Noviembre, no sale ninguno

SELECT a1.nombre, salida, a2.nombre, llegada
FROM vuelo JOIN aeropuerto a1 ON (desde = a1.id_aeropuerto)
			JOIN aeropuerto a2 ON (hasta = a2.id_aeropuerto)
WHERE a1.ciudad = 'Sevilla'
	AND a2.ciudad = 'Londres'
	AND TO_CHAR(salida, 'id/mm') = '2/11';
	
--Seleccionar el precio final de cada vuelo

SELECT vuelo.*, COALESCE(precio *(descuento::numeric/100), precio)
FROM vuelo;

--EX
--Seleccionar el importe total gastado por todos los cliente sque reservarton un vuelo que 
--salio (en pasoado) desde berlin un martes o miercole, y donde la reserva se hiciera entre 30 y 45 
--dias amnes de la salida del vuelo.

SELECT SUM(COALESCE(precio*(1-(descuento::numeric/100)), precio))
--SELECT *
FROM vuelo JOIN reserva USING(id_vuelo)
		   	JOIN aeropuerto ON (desde = id_aeropuerto)
WHERE salida < CURRENT_TIMESTAMP
		   AND ciudad = 'Berlín'
		   AND TO_CHAR(salida, 'ID') IN ('2', '3')
		   AND salida - fecha_reserva --se pone interval porque esta operacion devuvle un inervalo de tiempo
		   	BETWEEN '30 day'::interval AND 
		   		'45 day'::interval;