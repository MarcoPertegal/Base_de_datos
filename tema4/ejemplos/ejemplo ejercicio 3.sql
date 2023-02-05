/*Seleccionar las casas o pisos que han sido vendidas en un mes de marzo, mostrando
además de la información del inmueble en que % es diferente el precio inicial y el precio final 
*/
SELECT inmueble.*, ROUND(((precio - precio_final) / precio::numeric)*100,2)
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE tipo.nombre IN ('Casa', 'Piso')
	AND tipo_operacion = 'Venta'
	AND TO_CHAR(fecha_operacion, 'MM') = '03';--Esto se podria hacer con ILIKE pero ahora se hará asi
-- AND EXTRACT (month FROM fecha_operacion) = 3;
-- AND TO_CHAR(fecha_operacion, 'mon') = 'mar';
-- AND TO_CHAR(fecha_operacion, 'TMMonth') = 'Marzo';
--(todas estas hacen lo mismo)

--traducir a español 
SELECT DISTINCT TO_CHAR(fecha_alta, 'TMmon')
FROM inmueble;

/*
Seleccionar el precio final medio de aquellos pisos que se pusieron en alquiler en Almería o
Granada a partir de Julio de 2020 y que tardaron 5 meses o menos en ser alquilados 
*/

SELECT ROUND (AVG (precio_final), 2)
FROM operacion JOIN inmueble USING (id_inmueble)
			JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE tipo_operacion = 'Alquiler'
	AND inmueble.provincia IN('Almería', 'Granada')
	AND fecha_alta > TO_DATE ('01/07/2020', 'DD/MM/YYYY')
	AND tipo.nombre = 'Piso'
	--AND fecha_operacion - fecha_alta  No vale poque hay meses que tiene 30 y otros 31 dias
	AND fecha_operacion BETWEEN fecha_alta AND fecha_alta + '5 mon'::interval


SELECT *
FROM inmueble;