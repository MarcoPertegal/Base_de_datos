--EJERCICO 4
-- 4
SELECT*
FROM demografia_avanzada
WHERE anio = 2018
	AND sexo = 'M'
-- AND rango_edad IN ('De 20 a 24 años','De 25 a 29 años');
	AND ((edad_menor = 20 AND edad_mayor = 24)
		OR
		(edad_menor = 25 AND edad_mayor = 29))
	AND provincia IN ('Jaén', 'Córdoba', 'Sevilla', 'Huelva', 'Cádiz', 'Málaga', 'Granada', 'Almería')
ORDER BY numero_habitantes;

--5
SELECT *
FROM demografia_avanzada
WHERE provincia = 'Madrid'
	AND anio BETWEEN 2010 AND 2015
	AND sexo = 'H'
	AND (edad_menor < 20 OR edad_mayor > 65)
ORDER BY anio, numero_habitantes DESC, edad_menor;