 --Ejercicio 5
--3
SELECT AVG(precipitacion_total)
FROM climatologia
WHERE provincia = 'Sevilla'
	AND fecha::text ILIKE '2019-04%';
	--AND fecha BETWEEN  '2019-04-01'::date
			--AND '2019-04-30'::date;
--5
--SELECT fecha , estacion, provincia, precipitacion_total, 
--		ROUND (precipitacion_0_A_6 / precipitacion_total)*100,2) || '%' AS "% de 0 a 6",
	---	(precipitacion_6_A_12 / precipitacion_total)*100,
		--(precipitacion_12_A_18 / precipitacion_total)*100,
		--(precipitacion_18_A_24 / precipitacion_total)*100
--FROM climatologia
--WHERE provincia IN ('Albacete', 'Ciudad Real', 'Toledo', 'Cuenca', 'Guadalajara')
--	AND fecha BETWEEN '2019-03-21'::date
--				AND '2019-06-20'::date;
--6
SELECT *
FROM climatologia
WHERE precipitacion_total > 50
	AND precipitacion_6_a_12 BETWEEN 
			precipitacion_total * 0.6 --esto es 60 entre 100 para hacer una regla de tres
			AND
			precipitacion_total * 0.8
ORDER BY precipitacion_total DESC, fecha;