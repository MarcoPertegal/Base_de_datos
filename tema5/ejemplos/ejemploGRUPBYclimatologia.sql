/*seleccionar el numero de registros meteorologicos que hay para cada estacion*/

SELECT estacion,COUNT(*)
FROM climatologia
--que cuente para cada valor diferente de estacion cuantas filas hay
GROUP BY estacion;

--temperatura media agrupada por estacion y provincia, de las zonas mas calidas
--En el gruop by debe aparecer todo lo del select menos las funciones de resumen (AVG....)
SELECT estacion, provincia, ROUND(AVG(temperatura_media),2) "media"
FROM climatologia
GROUP BY estacion, provincia
ORDER BY media DESC;

--temperatura media agrupada por estacion y provincia de las estaciones meteorologicas de cádiz
SELECT estacion, provincia, ROUND(AVG(temperatura_media),2) "media"
FROM climatologia
WHERE provincia IN('Cádiz')
GROUP BY estacion, provincia
ORDER BY media DESC;