DROP TABLE IF EXISTS usuario CASCADE; 
DROP TABLE IF EXISTS estaciones CASCADE;
DROP TABLE IF EXISTS bicicleta CASCADE;
DROP TABLE IF EXISTS uso CASCADE; 

CREATE TABLE usuario(
	dni					VARCHAR,
	nombre				VARCHAR NOT NULL,
	apellidos			VARCHAR	NOT NULL,
	direccion			VARCHAR,
	telefono			SMALLINT NOT NULL,
	email				VARCHAR NOT NULL,
	passw				VARCHAR(8),
	saldo_disponible 	numeric NOT NULL CONSTRAINT SET DEFAULT 0,
	CONSTRAINT pk_usuario PRIMARY KEY (dni)
);

CREATE TABLE estacion(
	cod_estacion		VARCHAR CHECK ('e%'),
	num_estacion 		SERIAL NOT NULL,
	direccion			VARCHAR	NOT NULL,
	latitud 			NUMERIC NOT NULL,
	longitud			NUMERIC NOT NULL,
	CONSTRAINT pk_estacion PRIMARY KEY (cod_estacion)
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



