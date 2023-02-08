--Seleccionarel numero de vuelos de media cada dia de la semana (lin, mar, ..) 
--agrupando por aeropuerto de salida
SELECT ciudad, TO_CHAR(salida, 'TMDay') AS dia, count(*)
FROM vuelo JOIN aeropuerto ON (desde = id_aeropuerto)
GROUP BY ciudad, TO_CHAR(salida, 'TMDay')
ORDER BY ciudad, dia;

--aqui seria completa
SELECT ciudad, AVG(numval)
FROM (
	--esto calcula el numero de vuelos cumpliendo las restriccines del enunciado
	--numval es el alias que se le da al resultado del conteo para usarlo en la consulta de fuera
	SELECT ciudad, TO_CHAR(salida, 'TMDay') AS "dia", count(*) AS "numval"
	FROM vuelo JOIN aeropuerto ON (desde = id_aeropuerto)
	GROUP BY ciudad, TO_CHAR(salida, 'TMDay')
	ORDER BY ciudad, dia
) d
GROUP BY ciudad;
