--2
SELECT ROUND(AVG(precio),2)
FROM inmueble
WHERE provincia = 'Málaga'
	AND TO_CHAR(fecha_alta, 'mm') IN('07', '08')

--3
SELECT *
FROM inmueble
WHERE tipo_operacion = 'Venta'
	AND provincia IN('Jaén', 'Córdoba')
	AND TO_CHAR(fecha_alta, 'mm') IN ('10', '11', '12')
	AND TO_CHAR(fecha_alta, 'yy') IN ('19', '20')

--4
SELECT ROUND(AVG (precio),2)
FROM inmueble JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE tipo_operacion = 'Venta'
	AND nombre = 'Parking'
	AND provincia = 'Huelva'
	AND TO_CHAR(fecha_alta, 'id') IN('1', '2', '3', '4', '5')

--5
SELECT *
FROM inmueble JOIN tipo ON (tipo_inmueble = id_tipo)
WHERE tipo_operacion = 'Venta'
	AND nombre = 'Piso'
	AND provincia = 'Granada'
	AND fecha_alta - fecha_operacion BETWEEN '3 month'::interval OR '6 month'::interval


SELECT * 
FROM operacion
