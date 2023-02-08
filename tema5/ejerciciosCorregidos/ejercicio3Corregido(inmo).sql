--2
SELECT comprador.*
FROM comprador JOIN operacion USING (id_cliente)
			JOIN inmueble USING (id_inmueble)
			JOIN tipo ON (id_tipo = tipo_inmueble)
WHERE precio_final >(
					SELECT AVG(precio_final)
					FROM operacion JOIN inmueble USING(id_inmueble) 
									JOIN tipo ON (id_tipo = tipo_inmueble)
					WHERE tipo.nombre = 'Casa'
						AND provincia = 'Almería'
						AND tipo_operacion = 'Venta'
					)
AND tipo.nombre = 'Casa'
AND provincia = 'Almería'
AND tipo_operacion = 'Venta';