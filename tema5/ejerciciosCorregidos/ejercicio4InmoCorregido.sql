--3
SELECT c.nombre, id_inmueble, provincia, 
			fecha_operacion,  precio_final
FROM inmueble i JOIN tipo ON (tipo_inmueble = id_tipo)
		JOIN operacion USING (id_inmueble)
		JOIN comprador c USING (id_cliente)
WHERE tipo.nombre = 'Piso'
  AND tipo_operacion = 'Venta'
  AND precio_final >= ALL (
  							SELECT precio_final
	  						FROM inmueble i2 JOIN tipo ON (tipo_inmueble = id_tipo)
							JOIN operacion USING (id_inmueble)
  							WHERE tipo.nombre = 'Piso'
  							  AND tipo_operacion = 'Venta'		
	  						  AND i.provincia =
	  								i2.provincia
  							);

--4
SELECT i1.provincia, 
	TO_CHAR(o1.fecha_operacion, 'TMMonth'),
	i1.*, o1.precio_final
FROM inmueble i1 JOIN operacion o1 USING (id_inmueble)
WHERE tipo_operacion = 'Alquiler'
  AND precio_final <= ALL (
  	SELECT precio_final
	FROM inmueble i2 JOIN 
	  	operacion o2 USING (id_inmueble)
	WHERE tipo_operacion = 'Alquiler'
	  AND i1.provincia = i2.provincia
	  AND EXTRACT(month FROM o1.fecha_operacion) =
	  		EXTRACT(month FROM o2.fecha_operacion)  
  )
ORDER BY i1.provincia, 
	EXTRACT(month FROM o1.fecha_operacion);