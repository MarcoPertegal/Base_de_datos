DROP TABLE IF EXISTS invitados;
DROP TABLE IF EXISTS teatros;
DROP TABLE IF EXISTS obras;
DROP TABLE IF EXISTS exhibe;
DROP TABLE IF EXISTS tipos_asientos;
DROP TABLE IF EXISTS asiento_tipos;
DROP TABLE IF EXISTS precio;
DROP TABLE IF EXISTS entradas;

CREATE TABLE invitados(
	nro_invitados		serial,
	nombre				varchar(100),
	categoria			varchar(50),
	origen				varchar(50),
	CONSTRAINT pk_nro_invitados PRIMARY KEY (nro_invitados)
);

CREATE TABLE teatros(
	cod_teatro			smallint,
	nombre				varchar(50),
	direccion			smallint,
	cant_asientos		smallint,
	CONSTRAINT pk_cod_teatro PRIMARY KEY (cod_teatro)
);

CREATE TABLE exhibe(
	cod_obra			smallint,
	nombre_obra			varchar(50),
	autor				varchar(50),
	CONSTRAINT pk_cod_obra PRIMARY KEY (cod_obra)
);

CREATE TABLE exhibe(
	cod_teatro			smallint,
	fecha				date,
	cod_obra			smallint,
	CONSTRAINT pk_exhibe PRIMARY KEY (cod_teatro, fecha)
);

CREATE TABLE tipos_asientos(
	tipo				smallint,
	nombre				varchar(50),
	Descripcion			text,
	CONSTRAINT pk_tipo PRIMARY KEY (tipo)
);

CREATE TABLE asiento_tipos(
	nro_asiento			smallint,
	tipo				smallint,
	CONSTRAINT pk_nro_asiento PRIMARY KEY (nro_asiento)
);

CREATE TABLE precio(
	cod_teatro			smallint,
	fecha				date,
	tipo				smallint,
	precio				int,
	CONSTRAINT pk_precio PRIMARY KEY (cod_teatro,fecha,tipo)
);

CREATE TABLE entradas(
	cod_teatro			smallint,
	fecha				date,
	nro_asiento			smallint,
	nro_invitado		smallint,
	CONSTRAINT pk_entradas PRIMARY KEY (cod_teatro,fecha,nro_asiento)
);

ALTER TABLE exhibe
ADD CONSTRAINT fk_cod_teatro FOREIGN KEY (cod_teatro) REFERENCES teatros,
ADD CONSTRAINT fk_cod_obra FOREIGN KEY (cod_obra) REFERENCES obras;

ALTER TABLE asiento_tipos
ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES tipos_asientos;

ALTER TABLE precio
ADD CONSTRAINT fk_exhibe FOREIGN KEY (cod_teatro, fecha) REFERENCES exhibe,
ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES tipos_asientos;

ALTER TABLE entradas
ADD CONSTRAINT fk_exhibe FOREIGN KEY (cod_teatro, fecha) REFERENCES exhibe,
ADD CONSTRAINT fk_asiento_tipos FOREIGN KEY (nro_asiento) REFERENCES asiento_tipos,
ADD CONSTRAINT fk_invitados FOREIGN KEY (nro_invitado) REFERENCES invitados;


