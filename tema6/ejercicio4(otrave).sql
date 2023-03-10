DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS estacion CASCADE;
DROP TABLE IF EXISTS bicicleta CASCADE;
DROP TABLE IF EXISTS uso CASCADE;

CREATE TABLE usuario(
	dni					VARCHAR,
	nombre				VARCHAR NOT NULL,
	apellidos			VARCHAR NOT NULL,
	direccion			VARCHAR,
	telefono			VARCHAR NOT NULL,
	email				VARCHAR NOT NULL,
	passw				VARCHAR,
	saldo_disponible	numeric(9,2) NOT NULL DEFAULT 0,
	CONSTRAINT pk_usuario PRIMARY KEY (dni),
	CONSTRAINT ck_usuario_no_espacios CHECK(passw NOT LIKE '% %'),
	CONSTRAINT ck_usuario_entre_8_y_4 CHECK(LENGTH (passw) BETWEEN 4 AND 8)
);

CREATE TABLE estacion(
	cod_estacion		VARCHAR,
	num_estacion		SERIAL NOT NULL,
	direccion			VARCHAR NOT NULL,
	latitud				NUMERIC NOT NULL,
	longitud			NUMERIC NOT NULL,
	CONSTRAINT pk_estacion PRIMARY KEY (cod_estacion),
	CONSTRAINT ck_estacion_comenzar_E CHECK (cod_estacion LIKE 'e%')
);

CREATE TABLE bicicleta(
	cod_bicicleta		SERIAL,	
	marca				VARCHAR,
	modelo				VARCHAR,
	fecha_alta			date,
	CONSTRAINT pk_bicicleta PRIMARY KEY (cod_bicicleta)
);

CREATE TABLE uso(
	estacion_salida		VARCHAR,
	fecha_salida		TIMESTAMP,
	dni_usuario			VARCHAR,
	cod_bicicleta		INTEGER,
	estacion_llegada	VARCHAR,
	fecha_llegada		TIMESTAMP NOT NULL,
	CONSTRAINT pk_uso PRIMARY KEY (estacion_salida, fecha_salida, dni_usuario, cod_bicicleta, estacion_llegada, fecha_llegada)
);

ALTER TABLE uso
ADD CONSTRAINT fk_uso_usuario FOREIGN KEY (dni_usuario) REFERENCES usuario,
ADD CONSTRAINT fk_uso_estacion FOREIGN KEY (estacion_salida) REFERENCES estacion,
ADD CONSTRAINT fk_uso_estacion2 FOREIGN KEY (estacion_llegada) REFERENCES estacion,
ADD CONSTRAINT fk_uso_bicicleta FOREIGN KEY (cod_bicicleta) REFERENCES bicicleta;

ALTER TABLE usuario
ADD COLUMN prueba VARCHAR;

ALTER TABLE usuario
DROP COLUMN prueba;

INSERT INTO usuario(dni, nombre, apellidos, direccion, telefono, email, passw, saldo_disponible) VALUES
	('1234f', 'Rafa', 'Martinez', 'calle algo', '1234543', 'algo@algo.com', 'asf21', 3005),
	('1543d', 'Juan', 'Nuñez', 'calle raraa', '345324', 'algoo@algo.com', '324asd', 3015);

UPDATE usuario
SET saldo_disponible = saldo_disponible*2
WHERE saldo_disponible > 3010;

DELETE FROM usuario
WHERE apellidos = 'Nuñez'
RETURNING *;