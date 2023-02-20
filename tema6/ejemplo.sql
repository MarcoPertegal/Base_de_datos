


--Crear un tabla para guardar alumnos
--Por ahora
--nombre, apellidos, nuemro de asignaturas y nota media, fehca nacieminto, fecha matricula y la edad.
DROP TABLE IF EXISTS alumno;
CREATE TABLE alumno(
	nombre 					varchar(100),
	apellido1				varchar(200),
	apellido2				varchar(200),
	numero_asignaturas		smallint,
	nota_media 				numeric (4,2),
	fecha_nacimiento		date,
	fecha_matricula 		date,
	edad					smallint GENERATED ALWAYS AS TO_CHAR('32/12/2023', 'dd/mm/yyyy') - fecha_nacimiento --nosale
);

DROP TABLE IF EXISTS productos;
CREATE TABLE productos(
	num_producto	serial,--es un número que va cambiando asi no hace falta darselo al introducir los datos
	nombre			text,
	precio 			numeric(6,2) DEFAULT 9.99,--valor por defecto así no hace falta poner el precio
	fecha_creacion 	timestamp DEFAULT CURRENT_TIMESTAMP,
	descuento 		numeric DEFAULT 0,
	precio_desc 	numeric GENERATED ALWAYS AS (precio * (1-descuento)) STORED
);

INSERT INTO
	productos (nombre, precio)
VALUES ('PC', 499.9);

INSERT INTO
	productos (nombre)
VALUES ('Auriculares');

SELECT *
FROM productos;

SELECT * 
FROM alumno;

	