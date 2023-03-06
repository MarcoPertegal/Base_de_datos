DROP TABLE IF EXISTS usuario CASCADE; 
DROP TABLE IF EXISTS estacion CASCADE;
DROP TABLE IF EXISTS bicicleta CASCADE;
DROP TABLE IF EXISTS uso CASCADE; 

CREATE TABLE usuario(
	dni					VARCHAR,
	nombre				VARCHAR NOT NULL,
	apellidos			VARCHAR	NOT NULL,
	direccion			VARCHAR,
	telefono			SMALLINT NOT NULL,
	email				VARCHAR NOT NULL,
	passw				VARCHAR ,
	saldo_disponible 	numeric NOT NULL DEFAULT 0,
	CONSTRAINT pk_usuario PRIMARY KEY (dni),
	CONSTRAINT ck_usuarios_sin_espacios CHECK (passw NOT LIKE '% %'),
	CONSTRAINT ck_de_4_a_8 CHECK (LENGTH (passw) BETWEEN 4 AND 8)
);

CREATE TABLE estacion(
	cod_estacion		VARCHAR,
	num_estacion 		SERIAL NOT NULL,
	direccion			VARCHAR	NOT NULL,
	latitud 			NUMERIC NOT NULL,
	longitud			NUMERIC NOT NULL,
	CONSTRAINT pk_estacion PRIMARY KEY (cod_estacion),
	CONSTRAINT ck_estaciones_pore CHECK (cod_estacion ILIKE 'e%')
);

CREATE TABLE bicicleta(
	cod_bicicleta		SERIAL,
	marca		 		VARCHAR NOT NULL,
	modelo				VARCHAR	NOT NULL,
	fecha_alta 			date NOT NULL,
	CONSTRAINT pk_bicicleta PRIMARY KEY (cod_bicicleta)
);

CREATE TABLE uso(
	estacion_salida		VARCHAR,
	fecha_salida		DATE,
	dni_usuario			VARCHAR(10)	NOT NULL,
	cod_bicicleta 		INTEGER NOT NULL,
	estacion_llegada	VARCHAR,
	fecha_llegada		DATE NOT NULL,
	CONSTRAINT pk_uso PRIMARY KEY (estacion_salida, fecha_salida, cod_bicicleta, estacion_llegada)
);

ALTER TABLE uso
ADD CONSTRAINT fk_uso_estacion FOREIGN KEY (estacion_salida) REFERENCES estacion ON DELETE CASCADE,
ADD CONSTRAINT fk_uso_usuario FOREIGN KEY (dni_usuario) REFERENCES usuario ON DELETE CASCADE,
ADD CONSTRAINT fk_uso_bicicleta FOREIGN KEY (cod_bicicleta) REFERENCES bicicleta ON DELETE CASCADE,
ADD CONSTRAINT fk_uso_estacion FOREIGN KEY (estacion_llegada) REFERENCES estacion ON DELETE CASCADE;

ALTER TABLE usuario
ADD COLUMN fecha_baja DATE;



