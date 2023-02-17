--1
--usa el resultado del with de arriba en el join de abajo
--en el with de arriba esta contando las reservas que van en cada id_vuelo
WITH ocupacion_por_vuelo AS (
	SELECT id_vuelo, COUNT(*) as "num_pasajeros"
	FROM reserva
	GROUP BY id_vuelo
), porcentaje_ocupacion_por_vuelo AS (
	SELECT id_vuelo, desde, (num_pasajeros::numeric / max_pasajeros) * 100 as "porcentaje_ocupacion"
	FROM vuelo JOIN avion USING (id_avion) 
	JOIN ocupacion_por_vuelo USING (id_vuelo)
)
SELECT nombre, 
		ROUND(AVG(porcentaje_ocupacion),2)
FROM porcentaje_ocupacion_por_vuelo
		JOIN aeropuerto ON (desde = id_aeropuerto)
GROUP BY nombre;

--2
(SELECT nombre, TO_CHAR(salida, 'TMMonth'),
		COUNT(id_reserva), 'salida'
FROM aeropuerto JOIN vuelo ON (desde = id_aeropuerto)
		JOIN reserva USING (id_vuelo)
GROUP BY nombre, TO_CHAR(salida, 'TMMonth'))		
UNION
(SELECT nombre, TO_CHAR(llegada, 'TMMonth'),
		COUNT(id_reserva), 'llegada'
FROM aeropuerto JOIN vuelo ON (hasta = id_aeropuerto)
		JOIN reserva USING (id_vuelo)
GROUP BY nombre, TO_CHAR(llegada, 'TMMonth'));

--forma 2 de hacerlo
WITH trafico_salida AS (
	SELECT nombre, TO_CHAR(salida, 'TMMonth') as "mes",
		EXTRACT(month FROM salida) as "nmes",
		COUNT(id_reserva) "num_personas", 
		'salida' as "tipo_trafico"
	FROM aeropuerto JOIN vuelo ON (desde = id_aeropuerto)
			JOIN reserva USING (id_vuelo)
	GROUP BY nombre, TO_CHAR(salida, 'TMMonth'),
	 EXTRACT(month FROM salida)
), trafico_llegada AS (
	SELECT nombre, TO_CHAR(llegada, 'TMMonth') as "mes",
		EXTRACT(month FROM llegada) as "nmes",
		COUNT(id_reserva) "num_personas", 
		'llegada' as "tipo_trafico"
	FROM aeropuerto JOIN vuelo ON (hasta = id_aeropuerto)
			JOIN reserva USING (id_vuelo)
	GROUP BY nombre, TO_CHAR(llegada, 'TMMonth'),
		EXTRACT(month FROM llegada)
), trafico AS (
	SELECT *
	FROM trafico_salida 
	UNION 
	SELECT *
	FROM trafico_llegada
)
SELECT nombre, mes, num_personas, tipo_trafico
FROM trafico
ORDER BY nombre, nmes;

--3
--0.3 es lo del 30% del billete, beneficio de cada vuelo por el numero de pasajeros que han viajado
--primero se crea una tabla auxiliar con todos los vuelos y sus rentabilidades
--despues de esa tabla seleccionamos el mayor y el menor y para mostrarlos dos resultados juntos se usan UNION
WITH beneficio_por_trayecto AS (
	SELECT d.ciudad as "desde", h.ciudad as "hasta",
			SUM(COALESCE(
			precio * (1-(descuento::numeric/100)),
			precio
			) * 0.3) as "beneficio"
	FROM vuelo JOIN reserva USING (id_vuelo)
		JOIN aeropuerto d ON (desde = d.id_aeropuerto)
		JOIN aeropuerto h ON (hasta = h.id_aeropuerto)
	GROUP BY d.ciudad, h.ciudad
), beneficio_maximo AS (
	SELECT MAX(beneficio) as "maximo"
	FROM beneficio_por_trayecto
), beneficio_minimo AS (
	SELECT MIN(beneficio) as "minimo"
	FROM beneficio_por_trayecto
), trayecto_beneficio_maximo AS (
	SELECT *, 'max'
	FROM beneficio_por_trayecto
	WHERE beneficio = (
					SELECT maximo
					FROM beneficio_maximo
					)
), trayecto_beneficio_minimo AS (
	SELECT *, 'min'
	FROM beneficio_por_trayecto
	WHERE beneficio = (
					SELECT minimo
					FROM beneficio_minimo
					)	
)
SELECT *
FROM trayecto_beneficio_maximo
UNION
SELECT *
FROM trayecto_beneficio_minimo;

--4
--esta es inversa sellecionar lo contrario a lo que pide y despues restarselo, seleccionar a todos
--y despues restarselo a lo contrario de lo que pide
--Todos los que han hecho alguna reserva
--	NOT IN (
-- 			Los que si tienen una reserva que sale desde sevilla en el 3º tr)

WITH reservas_sevilla_3trim AS (
	SELECT id_cliente
	FROM reserva JOIN vuelo USING (id_vuelo)
			JOIN aeropuerto ON (desde = id_aeropuerto)
	WHERE ciudad = 'Sevilla'
	  AND TO_CHAR(salida, 'Q') = '3'
)
SELECT DISTINCT nombre, apellido1, apellido2
FROM cliente JOIN reserva USING (id_cliente) 
WHERE id_cliente NOT IN 
			(
			 SELECT id_cliente
			 FROM reservas_sevilla_3trim
			);
			
--5
--La operacion es gasto por cliente, aprender a usarla
WITH gasto_por_cliente_fuera_espana AS (
	SELECT id_cliente, SUM(COALESCE(precio * (1-(descuento::numeric/100)),precio)) as "gasto"
	FROM reserva JOIN vuelo USING (id_vuelo)
					JOIN aeropuerto ON (desde = id_aeropuerto)
	WHERE ciudad NOT IN ('Sevilla', 'Málaga','Madrid', 'Bilbao', 'Barcelona')
	GROUP BY id_cliente
	
), media_gasto_por_cliente_fuera_espana AS (
	SELECT AVG(gasto) as "media_gasto" 
	FROM gasto_por_cliente_fuera_espana
	
), gasto_por_cliente_desde_espana AS (
	SELECT id_cliente, SUM(COALESCE(precio * (1-(descuento::numeric/100)),precio)) as "gasto"
	FROM reserva JOIN vuelo USING (id_vuelo)
					JOIN aeropuerto ON (desde = id_aeropuerto)
	WHERE ciudad IN ('Sevilla', 'Málaga', 'Madrid', 'Bilbao', 'Barcelona')
	GROUP BY id_cliente

), cliente_con_gasto_superior_media AS (
	SELECT *
	FROM gasto_por_cliente_desde_espana
	WHERE gasto > (
					SELECT media_gasto
					FROM media_gasto_por_cliente_fuera_espana
					)
)

SELECT nombre, apellido1, apellido2, gasto
FROM cliente JOIN cliente_con_gasto_superior_media USING (id_cliente);

/*WHERE id_cliente IN 

		(

			SELECT id_cliente

			FROM cliente_con_gasto_superior_media

		);*/