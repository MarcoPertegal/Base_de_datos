DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS venta CASCADE;
DROP TABLE IF EXISTS lineaDeVenta CASCADE;
DROP TABLE IF EXISTS vehiculo CASCADE;
DROP TABLE IF EXISTS coche CASCADE;
DROP TABLE IF EXISTS motocicleta CASCADE;

CREATE TABLE cliente(
	codCliente			SERIAL,
	nombre				VARCHAR,
	esPremium			BOOLEAN
	CONSTRAINT pk_cliente PRIMARY KEY (codCliente)
);

CREATE TABLE venta(
	codVenta			SERIAL,
	fecha				DATE,
	codCliente			INTEGER,
	CONSTRAINT pk_venta PRIMARY KEY (codVenta)
);

CREATE TABLE lineaDeVenta(
	codVenta 			INTEGER,
	lineaCod			INTEGER,
	pvp					NUMERIC(9,2),
	numBastidor			INTEGER,
	CONSTRAINT pk_lienaDeVenta PRIMARY KEY (codVenta, lineaCod)
);

CREATE TABLE vehiculo(
	numBastidor			VARCHAR,
	fechaFabricacion 	DATE,
	matricula			VARCHAR,
	CONSTRAINT pk_vehiculo PRIMARY KEY (numBastidor)
);

CREATE TABLE coche(
	numBastidor			VARCHAR,
	numPuertas			INTEGER,
	CONSTRAINT pk_coche PRIMARY KEY (numBastidor)
);

CREATE TABLE motocicleta(
	numBastidor			VARCHAR,
	cilindrada			NUMERIC,
	CONSTRAINT pk_motocicleta PRIMARY KEY (numbastidor)
);

ALTER TABLE venta
ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (codCliente) REFERENCES cliente ON DELETE SET NULL;

AlTER TABLE lineaDeVenta
ADD CONSTRAINT fk_lineaDeVenta_venta FOREIGN KEY (codVenta) REFERENCES venta ON DELETE CASCADE;

AlTER TABLE vehiculo
ADD CONSTRAINT fk_vehiculo_lineaDeVenta FOREIGN KEY (numeroBastidor) REFERENCES lineaDeVenta;

AlTER TABLE coche
ADD CONSTRAINT fk_coche_vehiculo FOREIGN KEY (numeroBastidor) REFERENCES vehiculo ON DELETE CASCADE;

AlTER TABLE motocicleta
ADD CONSTRAINT fk_motocicleta_vehiculo FOREIGN KEY (numeroBastidor) REFERENCES vehiculo ON DELETE CASCADE;


INSERT INTO cliente(nombre, esPremium)VALUES
	('Juan', true);
	
INSERT INTO venta( fecha)VALUES
	('18/03/2018');

INSERT INTO lineaDeVenta(lineaCod, pvp, numeroBastidor)VALUES
	(111111, 23000, '132414adc');