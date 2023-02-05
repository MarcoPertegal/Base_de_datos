/*
Seleciona todos los datos de aquellas casas que nya hayan sido alquiladas en la provincia de 
SEvillao Jaén en el año 2021
*/
SELECT *
FROM inmueble JOIN tipo ON (tipo_inmueble = id_tipo)
		JOIN operacion USING (id_inmueble)
WHERE fecha_operacion::text ILIKE '2021-%'
	AND provincia IN('Sevilla', 'Jaén')
	AND nombre = 'Casa'
	AND tipo_operacion = 'Alquiler';