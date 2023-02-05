--SEleccionar la percipitacion media del mes de marzo agrupando
--por estacion

SELECT estacion, AVG(precipitacion_total)
FROM climatologia
--WHERE EXTRACT(month FROM fecha)= 3
WHERE TO_CHAR(fecha, 'mm') = '03'
GROUP BY estacion;

--Seleccioanr la media de temperatura media
--agrupando por provincia y mes.
--Ordena los resultados por provincia ASC y cronologicamente (Enero, Febrero,..)

SELECT provincia, TO_CHAR(fecha, 'TMMonth'), ROUND(AVG(temperatura_media),2)
FROM climatologia
GROUP BY provincia, TO_CHAR(fecha, 'TMMonth'), EXTRACT(month FROM fecha)
ORDER BY provincia, EXTRACT(month FROM fecha);
--tochar para mostrar y extrac para ordenar

