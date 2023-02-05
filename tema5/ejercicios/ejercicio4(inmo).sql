--3
SELECT provincia, nombre, fecha_operacion, MAX(precio_final) as "cantidad"
FROM inmueble JOIN operacion USING(id_inmueble)
				JOIN comprador USING (id_cliente)
WHERE cantidad >= (SELECT MAX(precio_final) as "cantidad2"
				  FROM inmueble JOIN operacion USING(id_inmueble)
					JOIN comprador USING (id_cliente)
					WHERE cantidad = cantidad2)
GROUP BY provincia;

--4
SELECT provincia, fecha_operacion, imbueble.*, MIN(precio_final) as "nosequehago"
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE nosequehago <= ALL (
							SELECT MIN(precio_final) as "nosequehago"
							FROM inmueble JOIN operacion USING (id_inmueble)
							WHERE c1.provincia = c2.provincia
									)
ORDER BY provincia, mes;