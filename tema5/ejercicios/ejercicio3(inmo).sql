--2
SELECT c.nombre
FROM comprador c JOIN operacion USING (id_cliente)
				JOIN inmueble USING (id_inmueble)
				JOIN tipo t ON (tipo_inmueble = id_tipo)
WHERE provincia IN('Almería')
	AND tipo_operacion = 'Venta'
	AND t.nombre = 'Casa'
	AND precio_final > (SELECT AVG(precio)
						FROM inmueble JOIN tipo t ON (tipo_inmueble = id_tipo)
						WHERE tipo_operacion = 'Venta'
							AND provincia IN('Almería')
						);
--3
SELECT v.nombre
from vendedor v JOIN operacion USING (id_vendedor)
			JOIN inmueble USING (id_inmueble)
			JOIN tipo t ON (tipo_inmueble = id_tipo)
WHERE tipo_operacion = 'Venta'
	AND t.nombre = 'Parking'
