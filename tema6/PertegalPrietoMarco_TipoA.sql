DROP TABLE IF EXISTS empleado CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS venta CASCADE;
DROP TABLE IF EXISTS lineaVenta CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;

CREATE TABLE empleado(
	num_empleado		SERIAL,
	nombre				VARCHAR NOT NULL,
	apellidos 			VARCHAR NOT NULL,
	email				VARCHAR(320),
	cuenta_corriente	VARCHAR,
	pass				VARCHAR(8),
	CONSTRAINT pk_empleado PRIMARY KEY (num_empleado),
	CONSTRAINT ck_email_contener_arrova CHECK (email ILIKE '%@%'),
	CONSTRAINT ck_cuenta_corriente_24_caract CHECK(LENGTH (cuenta_corriente)=24),
	CONSTRAINT ck_cuenta_corriente_empieza_ES CHECK(cuenta_corriente ILIKE 'ES%'),
	CONSTRAINT ck_pass_no_espacios CHECK (pass ILIKE '% %')
);

CREATE TABLE cliente(
	dni					VARCHAR(10),
	nombre				VARCHAR NOT NULL,
	apellidos			VARCHAR NOT NULL,
	email				VARCHAR,
	direccion			VARCHAR(100),
	fecha_alta			DATE,
	CONSTRAINT pk_cliente PRIMARY KEY (dni),
	CONSTRAINT ck_email_320_caract CHECK (LENGTH (email) < 320),
	CONSTRAINT ck_email_contener_arrova CHECK (email ILIKE '%@%')
);

CREATE TABLE venta(
	id_venta			SMALLINT,
	fecha				DATE NOT NULL,
	empleado			INTEGER NOT NULL,
	cliente				VARCHAR NOT NULL,
	CONSTRAINT pk_venta PRIMARY KEY (id_venta)
);

CREATE TABLE lineaVenta(
	id_venta			SMALLINT,
	id_linea			SMALLINT,
	cantidad			INTEGER,
	producto			VARCHAR,
	precio				NUMERIC(9,2) NOT NULL DEFAULT 9.99,
	CONSTRAINT pk_lineaVenta PRIMARY KEY (id_venta, id_linea),
	CONSTRAINT ck_cantidad_mayor_0 CHECK (cantidad > 0)
);

CREATE TABLE producto(
	cup 				VARCHAR,
	nombre				VARCHAR NOT NULL,
	descripcion			TEXT,
	pvp					NUMERIC NOT NULL,
	categoria			INTEGER,
	CONSTRAINT pk_producto PRIMARY KEY (cup)
);

CREATE TABLE categoria(
	id_categoria		SERIAL,
	nombre				VARCHAR NOT NULL,
	descripcion			TEXT,
	CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

ALTER TABLE venta 
ADD CONSTRAINT fk_venta_empleado FOREIGN KEY (empleado) REFERENCES empleado,
ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (cliente) REFERENCES cliente ON DELETE CASCADE;

ALTER TABLE lineaVenta
ADD CONSTRAINT fk_lineaVenta_venta FOREIGN KEY (id_venta) REFERENCES venta ON DELETE CASCADE,
ADD CONSTRAINT fk_lineaVenta_producto FOREIGN KEY (producto) REFERENCES producto ON DELETE SET NULL;

ALTER TABLE producto 
ADD CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria) REFERENCES categoria;

INSERT INTO categoria(nombre)VALUES
	('apple');
	
INSERT INTO cliente(dni, nombre, apellidos, email)VALUES
	('23543D','Jesús', 'Casanova', 'jesus.casanova@mitienda.com');

INSERT INTO empleado(nombre, apellidos, email, cuenta_corriente)VALUES
	('Miguel', 'Campos', 'mCampos@mitienda.com', 'ES1200000000012355555555');

INSERT INTO venta(id_venta,fecha, empleado, cliente)VALUES
	(1,'09/03/2023', '1', '23543D');

INSERT INTO lineaVenta(id_venta, id_linea, cantidad, producto, precio) VALUES
	(1, 1, 1, 'Mac Mini', 799);
	


SELECT *
FROM lineaVenta