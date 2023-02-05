--Selecionar ,mostrando la provincia, estacion y temperatura maxima más alta de cada
--provicia para el mes de enero de 2019
SELECT provincia, estacion, temperatura_maxima
FROM climatologia c1
WHERE TO_CHAR(fecha, 'mm/yyyy') = '08/2019'
	AND temperatura_maxima >= ALL ( --el all es para que no devuelva más de una fila
									SELECT temperatura_maxima
									FROM climatologia c2
									WHERE TO_CHAR(fecha, 'mm/yyyy') = '08/2019'
									AND c1.provincia = c2.provincia
									)
ORDER BY provincia;

--Selecionar ,mostrando la provincia, estacion y temperatura maxima más baja de cada
--provicia para el mes de enero de 2019
SELECT provincia, estacion, temperatura_minima
FROM climatologia c1
WHERE TO_CHAR(fecha, 'mm/yyyy') = '01/2019'
	AND temperatura_maxima <= ALL ( --el all es para que no devuelva más de una fila
									SELECT temperatura_minima
									FROM climatologia c2
									WHERE TO_CHAR(fecha, 'mm/yyyy') = '01/2019'
									AND c1.provincia = c2.provincia
									)
ORDER BY provincia;