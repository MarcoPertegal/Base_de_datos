DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS visita CASCADE;
DROP TABLE IF EXISTS inmueble CASCADE;
DROP TABLE IF EXISTS propietario CASCADE;
DROP TABLE IF EXISTS vivienda CASCADE;
DROP TABLE IF EXISTS habitaciones CASCADE;
DROP TABLE IF EXISTS local CASCADE;
DROP TABLE IF EXISTS piso CASCADE;
DROP TABLE IF EXISTS casa CASCADE;
DROP TABLE IF EXISTS chalet CASCADE;

CREATE TABLE cliente(
	dni				VARCHAR(10),
	nombre			VARCHAR,
	CONSTRAINT pk_cliente PRIMARY KEY (dni)
);

CREATE TABLE visita(
	dni				VARCHAR(10),
	ref				VARCHAR,
	fecha			date,
	comentarios		text,
	CONSTRAINT pk_visita PRIMARY KEY (dni, ref, fecha)
);

CREATE TABLE inmueble(
	ref				VARCHAR,
	m2				VARCHAR,
	direccion		VARCHAR,
	tipoOperacion	VARCHAR,
	dni		VARCHAR,
	CONSTRAINT pk_inmueble PRIMARY KEY (ref)
);

CREATE TABLE propietario(
	dni				VARCHAR(10),
	telefono 		VARCHAR,
	nombre			VARCHAR,
	CONSTRAINT pk_propietario PRIMARY KEY (dni)
);

CREATE TABLE vivienda(
	ref				VARCHAR,
	descripcion		text,
	numBaños		SMALLINT,
	CONSTRAINT pk_vivienda PRIMARY KEY (ref)
);

CREATE TABLE habitaciones(
	tipo			VARCHAR,
	ref				VARCHAR,
	m2				VARCHAR,
	descripcion		text,
	foto			text,
	CONSTRAINT pk_habitaciones PRIMARY KEY (tipo)
);

CREATE TABLE local(
	ref				VARCHAR,
	zona			VARCHAR,
	caracteristicas	text,
	CONSTRAINT pk_local PRIMARY KEY (ref)
);

CREATE TABLE piso(
	ref				VARCHAR,
	zona			VARCHAR,
	esNuevo			BOOLEAN,
	CONSTRAINT pk_psio PRIMARY KEY (ref)
);

CREATE TABLE casa(
	ref				VARCHAR,
	zona			VARCHAR,
	CONSTRAINT pk_casa PRIMARY KEY (ref)
);

CREATE TABLE chalet(
	ref					VARCHAR,
	urbanizacion		VARCHAR,
	parcela				VARCHAR,
	CONSTRAINT pk_chalet PRIMARY KEY (ref)
);

ALTER TABLE visita
ADD CONSTRAINT fk_visita_cliente FOREIGN KEY (dni) REFERENCES cliente,
ADD CONSTRAINT fk_visita_inmueble FOREIGN KEY (ref) REFERENCES inmueble;

ALTER TABLE inmueble
ADD CONSTRAINT fk_inmueble_propietario FOREIGN KEY (dni) REFERENCES propietario ON DELETE CASCADE;

ALTER TABLE habitaciones
ADD CONSTRAINT fk_habitaciones_vivienda FOREIGN KEY (tipo) REFERENCES vivienda ON DELETE CASCADE;

ALTER TABLE vivienda
ADD CONSTRAINT fk_vivienda_inmueble FOREIGN KEY (ref) REFERENCES inmueble ON DELETE CASCADE;

ALTER TABLE local
ADD CONSTRAINT fk_local_inmueble FOREIGN KEY (ref) REFERENCES inmueble ON DELETE CASCADE;

ALTER TABLE piso
ADD CONSTRAINT fk_piso_vivienda FOREIGN KEY (ref) REFERENCES vivienda ON DELETE CASCADE;

ALTER TABLE casa
ADD CONSTRAINT fk_casa_vivienda FOREIGN KEY (ref) REFERENCES vivienda ON DELETE CASCADE;

ALTER TABLE chalet
ADD CONSTRAINT fk_chalet_vivienda FOREIGN KEY (ref) REFERENCES vivienda ON DELETE CASCADE;

INSERT INTO cliente(dni, nombre)VALUES
	('123432D','Juan');
	
INSERT INTO visita(dni, ref, fecha, comentarios)VALUES
	('123432D', '12413', '2023-03-20', 'Me encantan las bases de datos');
	
INSERT INTO inmueble(ref, m2, direccion, tipoOperacion, dni)VALUES
	('12413', '21412', 'Calle San Jacinto','Venta', '132424C');