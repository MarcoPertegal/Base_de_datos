--RA03.a, RA03.b, RA03.c)
--Selecciona la temperatura_media máxima y la precipitación total máxima para aquellas estaciones 
--meteorológicas de Aragón (Huesca, Zaragoza y Teruel) para algún día del intervalo 15/06/2019 - 15/07/2019 
--(ambos inclusive), para aquellas filas donde la estación contenga alguna vocal acentuada (puede ser en mayúsculas 
--o minúsculas
SELECT max(temperatura_media), max(precipitacion_total)
FROM climatologia
WHERE provincia IN('Huesca', 'Zaragoza', 'Teruel')
	AND fecha BETWEEN '2019-06-15'::date
			AND '2019-07-15'::date
	AND (
		estacion ILIKE '%á%' OR 
		estacion ILIKE'%é%' OR
		estacion ILIKE'%í%' OR
		estacion ILIKE'%ó%' OR
		estacion ILIKE'%ú%');