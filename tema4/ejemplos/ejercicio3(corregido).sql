--1
SELECT TO_CHAR(fecha_operacion, 'dy/mon')
FROM operacion;
SELECT TO_CHAR(fecha_operacion, 'tmdy/tmmon')
FROM operacion;


SELECT inmueble.*
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN vendedor USING (id_vendedor) 
--WHERE TO_CHAR(fecha_operacion, 'tmdy/tmmon') --tm  es para que salga en español, el punto se escribe pq con la 
--		IN ('lu./feb.', 'vi./mar.')				-- traducción se crea un punto aparece arriva traducido y no
WHERE TO_CHAR(fecha_operacion, 'id/mm')	--esa es la segunda forma mas simple		
		IN ('1/02', '5/03')
		AND superficie > 200
		AND nombre ILIKE '%A%';

--2
SELECT ROUND(AVG(precio_final/superficie),2)
FROM inmueble JOIN tipo ON (tipo_inmueble = id_tipo)
				JOIN operacion USING (id_inmueble)
WHERE tipo.nombre IN('Casa', 'Piso')
				AND EXTRACT (month FROM fecha_operacion) IN (3,4)
				AND tipo_operacion = 'Alquiler'
				AND provincia IN ('Huelva', 'Cádiz', 'Málaga', 'Granada', 'Almería');

--3
SELECT AVG((precio - precio_final)/ precio::numeric*100)
FROM inmueble JOIN operacion USING (id_inmueble)
				JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE tipo_operacion = 'Alquiler'
	AND EXTRACT (month FROM fecha_operacion) = 1
	AND tipo.nombre IN ('Oficina', 'Local', 'Suelo');

--4
SELECT DISTINCT comprador.nombre
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN comprador USING (id_cliente)
			JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE precio_final BETWEEN 150000 AND 200000
	AND tipo_operacion = 'Venta'
	AND tipo.nombre IN ('Casa', 'Piso')
	AND provincia IN ('Jaén', 'Córdoba')
	AND age(fecha_operacion, fecha_alta)
		BETWEEN '3 mon'::interval AND '4 mon'::interval;
		
--5
--sale nulo porque no hay nadie que la halla alquilado más de un año, vamos a pònerlo que hallan tardado
--un año o menos en alquilarse pq sino no devilve nada
SELECT AVG(precio), AVG(precio_final), (AVG(precio)-AVG(precio_final))/AVG(precio)*100
FROM inmueble JOIN tipo ON (tipo_inmueble = id_tipo)
				JOIN operacion USING (id_inmueble)
WHERE tipo.nombre IN ('Casa', 'Piso')
	AND superficie < 100
	AND fecha_operacion <= fecha_alta + '1 year'::interval--se puede hacer con age
	AND tipo_operacion = 'Alquiler';
	
--6
SELECT max(precio_final)
FROM inmueble JOIN operacion USING (id_inmueble)
			JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE tipo.nombre IN ('Casa', 'Piso')
	AND date_part('month', fecha_operacion) IN (7,8)
	AND provincia = 'Huelva'
	AND tipo_operacion = 'Alquiler';