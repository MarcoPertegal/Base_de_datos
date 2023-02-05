SELECT '2022-01-13 09:25:37 -8:00'::timestamptz;

/*2.1 valores especiales*/
/*epoch representa 1970*/
SELECT 'epoch'::timestamptz;

SELECT 'tomorrow'::date;

SELECT 'now'::timestamptz;

/*2.2 Intervalos*/
SELECT 'now'::timestamp + '1 decade 1 day 1 hours'::interval;

SELECT '35 month'::interval;

--seleccionar los inmuebles que se han alquilado o vendido en menos de 15 dias
SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE fecha_operacion BETWEEN fecha_alta AND fecha_alta + 15;

--seleccionar los inmuebles que se han alquilado o vendido en menos de 3 mese
SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE fecha_operacion BETWEEN fecha_alta AND fecha_alta + '3 mons'::interval;

--seleccionar, además de todos los datos del inmuble, la diferencia en dias entre la fehca 
--de alta y la fecha de operacion
SELECT inmueble.*, fecha_operacion-fecha_alta
FROM inmueble JOIN operacion USING(id_inmueble);

SELECT age(fecha_operacion, fecha_alta)
FROM inmueble JOIN operacion USING(id_inmueble);

SELECT age('1982-09-18'::date);

SELECT date_part('mons', current_date);

SELECT date_trunc('day', current_timestamp);

/*seleccionar modo de salida*/
SELECT TO_CHAR (fecha_alta, 'dd/mm/yyyy')
FROM inmueble;