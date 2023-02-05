--1
SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN vendedor USING (id_vendedor)
WHERE fecha_operacion::text BETWEEN '%-02-%' AND '%-03-%'
	AND superficie > 200
	AND nombre ILIKE '%A%';

--2
SELECT ROUND (AVG(precio),2)
FROM inmueble
WHERE tipo_operacion = 'Alquiler'
	AND fecha_alta::text BETWEEN '%-03-%' AND '%-04-%'
	AND provincia IN('Cádiz', 'Málaga', 'Huelva', 'Almeria', 'Granada');

--3
SELECT
FROM 
WHERE 

--4
SELECT nombre
FROM comprador JOIN operacion USING(id_cliente)
				JOIN inmueble USING (id_inmueble)
				JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE nombre IN('Casa', 'Piso')
	AND provincia IN ('Jaén', 'Córdoba')
	AND precio BETWEEN 150000 AND 200000;
	
--5

SELECT AVG(precio), AVG (precio_final)
FROM inmueble JOIN operacion USING (id_inmueble)

--6

SELECT max(precio)
FROM inmueble
WHERE fecha_alta::text BETWEEN '%-07-01' AND '%-08-31'
	AND provincia = 'Huelva';

/*Selecciona aquellos precios finales de oficinas superiores a 200000 euros, cuya 
fecha de operación halla sido realizada cualquier 
día de julio o agosto, ordenando
la salida de mayor a menor precio
*/
SELECT precio_final
FROM  operacion JOIN inmueble USING (id_inmueble)
			JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE nombre = 'Oficina'
	AND precio_final > 200000
	AND (EXTRACT (month FROM fecha_operacion) = 7
					OR EXTRACT (month FROM fecha_operacion) = 8)
ORDER BY precio_final ASC;