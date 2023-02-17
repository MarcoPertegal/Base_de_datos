--1
SELECT v.nombre, provincia, AVG(precio_final)
FROM inmueble JOIN operacion USING (id_inmueble)
				JOIN tipo t ON (tipo_inmueble = id_tipo)
				JOIN vendedor v USING (id_vendedor)
WHERE t.nombre IN ('Piso', 'Casa')
	AND tipo_operacion = 'Venta'
GROUP BY v.nombre, provincia;

--2
--esto es el precio por metro cuadrado de los locales por provincia
SELECT provincia, AVG(precio_final/superficie)
FROM inmueble JOIN tipo ON(tipo_inmueble = id_tipo)
				JOIN operacion USING (id_inmueble)
GROUP BY provincia;
-----------------------------
--no se puede usar with no merece la pena
SELECT i1.provincia, SUM(precio_final)
FROM inmueble i1 JOIN tipo ON (tipo_inmueble = id_tipo)
		JOIN operacion USING (id_inmueble)
WHERE tipo.nombre = 'Local'
  AND tipo_operacion = 'Venta'
  AND precio_final > i1.superficie * (
		SELECT AVG(precio_final/superficie)
		FROM inmueble i2 JOIN tipo ON (tipo_inmueble = id_tipo)
				JOIN operacion USING (id_inmueble)
		WHERE tipo.nombre = 'Local'
		  AND tipo_operacion = 'Venta'
		  AND i1.provincia = i2.provincia
		)
GROUP BY i1.provincia

--3
--Join de ponemos tochar en el select para mostrar el dia de la semana 
--numval ca catidad que cuenta se le hace la media pq ese numero cuenta los pisos vendidos al dia
--la media por provincia es la segunda 
WITH pisos_vendidos_provincia_dia AS (
	SELECT provincia, TO_CHAR(fecha_operacion,'TMDay'),COUNT(id_inmueble) as "numval"
	FROM inmueble JOIN operacion USING (id_inmueble)
					JOIN tipo ON (tipo_inmueble = id_tipo)
	WHERE tipo_operacion = 'Venta'
	  		AND tipo.nombre = 'Piso'
	GROUP BY provincia, TO_CHAR(fecha_operacion,'TMDay')
)
SELECT provincia, ROUND(AVG(numval),2)
FROM pisos_vendidos_provincia_dia
GROUP BY provincia; 

--4
--No se puede usar with cuando hay una coorelacionanda
--UNA IGUAL ENTRA SEGURO
--Para cada fila se ejecuta la subconsulta 
--se compara cada inmueble en venta como para todos los tipos precios finales de la conslta de fuera con los de dentro 
-- el all esta porque la subconculta va a fdevolver mas de una fila para que no de error 
SELECT co.nombre, provincia, fecha_operacion,precio_final, t.nombre
FROM inmueble JOIN operacion USING (id_inmueble)
				JOIN tipo t ON (tipo_inmueble = id_tipo)
				JOIN comprador co USING (id_cliente)
WHERE tipo_operacion = 'Venta' 
  		AND precio_final <= ALL (
								SELECT precio_final
								FROM inmueble i2 JOIN operacion USING (id_inmueble)
													JOIN tipo t2 ON (tipo_inmueble = id_tipo)
								WHERE tipo_operacion = 'Venta' 
      									AND t.id_tipo = t2.id_tipo
								);
--Forma con la pregunta
SELECT  c.nombre , i.provincia , o.fecha_operacion, o.precio_final , t.nombre 
FROM inmueble i JOIN tipo t ON (t.id_tipo=i.tipo_inmueble)
				JOIN operacion o USING (id_inmueble)
				JOIN comprador c USING (id_cliente)
WHERE o.precio_final IN (
						SELECT DISTINCT o.precio_final
						FROM inmueble i JOIN tipo t2 ON (t2.id_tipo=i.tipo_inmueble)
										JOIN operacion o USING (id_inmueble)
						WHERE t2.nombre =t.nombre 
								AND tipo_operacion = 'Venta'
						ORDER BY o.precio_final ASC  
						LIMIT 3
						)
AND tipo_operacion = 'Venta'
ORDER BY t.nombre;

--5
--CLientes que hayan comprado piso en sevilla y a eso restarle lo mismo pero que no han realizado 
--nunguna el findesemana
--hace falta la subocnsulta en el where porque ventas_lunes_viernes es una tabla por lo que sino petaria
--primero hemos calculao todos los que han comprao piso en sevilla
--despues sobre eso los que han comrao de lunes a viernes 
WITH ventas_sevilla AS (
	SELECT *
	FROM inmueble JOIN operacion USING (id_inmueble)
					JOIN tipo ON (tipo_inmueble = id_tipo)
	WHERE tipo_operacion = 'Venta'
	  	AND tipo.nombre = 'Piso'
	  	AND provincia = 'Sevilla'
), ventas_lunes_viernes AS (
	SELECT *
	FROM ventas_sevilla
	WHERE TO_CHAR(fecha_operacion, 'id') IN('1', '2', '3', '4', '5') 
), ventas_finde AS (
	SELECT id_cliente
	FROM ventas_sevilla
	WHERE id_cliente NOT IN (
		SELECT id_cliente
		FROM ventas_lunes_viernes
	)
)
SELECT nombre
FROM comprador
WHERE id_cliente IN (
	SELECT id_cliente
	FROM ventas_finde
);

--6
--Fumada

