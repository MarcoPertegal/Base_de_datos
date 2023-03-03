DROP TABLE IF EXISTS invitado CASCADE; --tablas en singular
DROP TABLE IF EXISTS teatro CASCADE;
DROP TABLE IF EXISTS obra CASCADE;
DROP TABLE IF EXISTS exhibe CASCADE;
DROP TABLE IF EXISTS tipo_asiento CASCADE;
DROP TABLE IF EXISTS asiento_tipo CASCADE;
DROP TABLE IF EXISTS precio CASCADE;
DROP TABLE IF EXISTS entrada CASCADE;

CREATE TABLE invitado(
	nro_invitado		serial,
	nombre				varchar,
	categoria			varchar,
	origen				varchar,
	CONSTRAINT pk_invitado PRIMARY KEY (nro_invitado)
);

CREATE TABLE teatro(
	cod_teatro			smallint,
	nombre				varchar,
	direccion			varchar,
	cant_asientos		smallint,
	CONSTRAINT pk_teatro PRIMARY KEY (cod_teatro)
);

CREATE TABLE obra(
	cod_obra			SMALLSERIAL,
	nombre_obra			VARCHAR,
	autor				VARCHAR,
	CONSTRAINT pk_obra PRIMARY KEY (cod_obra)
);

CREATE TABLE exhibe(
	cod_teatro			SMALLINT,--clave externa nunca puede ser serial pq tiene que tener los mismos datos que su clave primaria
	fecha				TIMESTAMP,
	cod_obra			INTEGER,
	CONSTRAINT pk_exhibe PRIMARY KEY (cod_teatro, fecha)
);

CREATE TABLE tipo_asiento(
	tipo				SMALLINT,
	nombre				VARCHAR,
	descripcion			TEXT,
	CONSTRAINT pk_tipo PRIMARY KEY (tipo)
);

CREATE TABLE asiento_tipo(
	nro_asiento			SERIAL,
	tipo				SMALLINT,
	CONSTRAINT pk_asiento_tipo PRIMARY KEY (nro_asiento)
);

CREATE TABLE precio(
	cod_teatro			SMALLINT,
	fecha				DATE,
	tipo				SMALLINT,
	precio				NUMERIC(6,2),
	CONSTRAINT pk_precio PRIMARY KEY (cod_teatro,fecha,tipo)
);

CREATE TABLE entrada(
	cod_teatro			SMALLINT,
	fecha				TIMESTAMP,
	nro_asiento			INTEGER,
	nro_invitado		INTEGER,
	CONSTRAINT pk_entradas PRIMARY KEY (cod_teatro,fecha,nro_asiento)
);

ALTER TABLE exhibe
ADD CONSTRAINT fk_exhibe_teatro FOREIGN KEY (cod_teatro) REFERENCES teatro ON DELETE CASCADE,
ADD CONSTRAINT fk_exhibe_obra FOREIGN KEY (cod_obra) REFERENCES obra ON DELETE CASCADE;

ALTER TABLE asiento_tipo
ADD CONSTRAINT fk_asientoTipo_tipoAsientos FOREIGN KEY (tipo) REFERENCES tipo_asiento ON DELETE SET NULL;

ALTER TABLE precio
ADD CONSTRAINT fk_precio_exhibe FOREIGN KEY (cod_teatro, fecha) REFERENCES exhibe ON DELETE CASCADE,
ADD CONSTRAINT fk_precio_tipoAsiento FOREIGN KEY (tipo) REFERENCES tipo_asiento;

ALTER TABLE entrada
ADD CONSTRAINT fk_entrada_exhibe FOREIGN KEY (cod_teatro, fecha) REFERENCES exhibe ON DELETE CASCADE,
ADD CONSTRAINT fk_asiento_tipo FOREIGN KEY (nro_asiento) REFERENCES asiento_tipo ,
ADD CONSTRAINT fk_entrada_invitado FOREIGN KEY (nro_invitado) REFERENCES invitado ON DELETE SET NULL;