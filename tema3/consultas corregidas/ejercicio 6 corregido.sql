--Ejercicio 6
--2
SELECT fecha, estacion, temperatura_media, precipitacion_total, 
		CASE
			WHEN precipitacion_total >= 50 THEN 'Chuzos'
			WHEN precipitacion_total >= 40 AND precipitacion_total < 50 THEN 'A cántaros'
			WHEN precipitacion_total >= 25 AND precipitacion_total < 40 THEN 'Mucha lluvia'
			WHEN precipitacion_total >= 10 AND precipitacion_total < 25 THEN 'Falta le hacía al campo'
			WHEN precipitacion_total > 0 AND precipitacion_total THEN 'Ha llovido poco'
			WHEN precipitacion_total = 0 OR precipitacion_total IS NULL THEN 'No ha llovido'
		END
FROM climatologia
WHERE provincia = 'Jaén'
	AND fecha::text ILIKE '2019-11%'
ORDER BY fecha, estacion;
--da error no se porqué

--3
--SELECT fecha, UPPER(estacion), UPPER(provincia), temperatura_maxima, --faltaria listar el resto de atributos de las colummnas
--FROM climatologia													-- no se puede hacer un uper que seleccione todo
--WHERE fecha::text ILIKE '2019-03-%'
--	AND provincia IN ('Asturias', 'Cantabria')
--	AND hora_temperatura_maxima = '14:00';