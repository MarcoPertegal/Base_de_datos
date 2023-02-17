--1
SELECT inmueble.*
FROM inmueble 
WHERE tipo_operacion = 'Alquiler'
	AND precio >= (
				SELECT AVG(precio) as "Precio_Medio"
				FROM tipo JOIN inmueble ON (id_tipo = tipo_inmueble)
							JOIN operacion USING (id_inmueble)
				WHERE tipo_operacion = 'Alquiler'
				)
	AND id_inmueble NOT IN(
							SELECT id_inmueble
							FROM operacion
							);
				
--2
SELECT ROUND(AVG(precio_final),2) AS "Precio_medio", AVG(superficie/precio_final) AS "Precio_medio_superficie", 
		TO_CHAR(fecha_operacion, 'YYYY') AS "anio", TO_CHAR(fecha_operacion, 'Mon') AS "mes"
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE tipo_operacion = 'Venta'
GROUP BY TO_CHAR(fecha_operacion, 'YYYY'), TO_CHAR(fecha_operacion, 'Mon');

--3
SELECT DISTINCT v.nombre
FROM vendedor v JOIN operacion USING (id_vendedor)
				JOIN inmueble USING (id_inmueble)
WHERE tipo_operacion = 'Venta'
	AND provincia IN ('Málaga', 'Sevilla');
	
--4
WITH total_ventas AS(
	SELECT id_vendedor, COUNT(id_inmueble) AS "total"
	FROM operacion
	GROUP BY id_vendedor
)
SELECT v.nombre, total, SUM(precio_final*total) AS "cuantia"
FROM  total_ventas JOIN operacion USING (id_vendedor)
					JOIN vendedor v USING (id_vendedor)
GROUP BY v.nombre, total
ORDER BY cuantia DESC
LIMIT 3;

--5
SELECT i1.provincia, co1.nombre, SUM(precio_final*cantidad) AS "total", COUNT(id_inmueble) AS "cantidad"
FROM inmueble i1 JOIN operacion USING (id_inmueble)
					JOIN comprador co1 USING (id_cliente)
WHERE total >= ALL(
					SELECT id_vendedor, SUM(precio_final*cantidad) AS "total", COUNT(id_inmueble) AS "cantidad"
					FROM inmueble i2 JOIN operacion USING (id_inmueble)
									JOIN comprador co2 USING (id_cliente)
					WHERE i1.provincia = i2.provincia
					GROUP BY co2.nombre
					ORDER BY total ASC
					LIMIT 1
					)
GROUP BY i1.provincia;

--6
WITH inmuebles_totales_vendidos AS(
	SELECT id_vendedor, COUNT(id_inmueble) AS "total_vendidos"
	FROM operacion
	WHERE tipo_operacion = 'Venta'
	GROUP BY id_vendedor
), ingresos_totales AS(
	SELECT SUM(precio_final*total_vendidos) AS "total_ingresos"
	FROM inmuebles_totales_vendidos JOIN operacion USING (id_vendedor)
	WHERE tipo_operacion = 'Venta'
), inmuebles_vendidos_por_vendedor AS(
	SELECT id_vendedor, COUNT(id_inmueble) AS "total_vendidos_por_vendedor"
	FROM operacion
	WHERE tipo_operacion = 'Venta'
	GROUP BY id_vendedor
), ingresos_totales_de_cada_vendedor AS (
	SELECT SUM(precio_final*total_vendidos) AS "total_ingresos_por_vendedor"
	FROM inmuebles_totales_vendidos JOIN operacion USING (id_vendedor)
	WHERE tipo_operacion = 'Venta'
	GROUP BY id_vendedor
)
SELECT provincia, v.nombre, total_ingresos, SUM(total_ingresos_por_vendedor*(total_ingresos/100)) AS "porcent_vendedor"
FROM ingresos_totales JOIN operacion USING (id_vendedor)
						JOIN vendedor v USING (id_vendedor)
						JOIN ingresos_totales_de_cada_vendedor USING (id_vendedor)
WHERE tipo_operacion = 'Venta'
GROUP BY v.nombre, provincia;