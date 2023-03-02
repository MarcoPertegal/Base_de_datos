DROP TABLE IF EXISTS libro CASCADE;
DROP TABLE IF EXISTS autor;
DROP TABLE IF EXISTS editorial;
DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS edicion;

CREATE TABLE autor(
	dni 			VARCHAR(10),
	nombre 			TEXT NOT NULL,
	nacionalidad 	TEXT,
	CONSTRAINT pk_dni PRIMARY KEY (dni)
);


CREATE TABLE editorial (
	cod_editorial 		SERIAL,
	nombre				VARCHAR NOT NULL,
	direccion			VARCHAR,
	poblacion			VARCHAR,
	CONSTRAINT pk_editorial PRIMARY KEY (cod_editorial)
);


CREATE TABLE genero (
	id_genero		SMALLSERIAL,
	nombre			VARCHAR NOT NULL,
	descripcion		TEXT,

	CONSTRAINT pk_genero PRIMARY KEY (id_genero)
);

CREATE TABLE libro(
	CREATE TABLE libro(
	isbn 			varchar(15),--a los caracteres que son fijos ponerle siempre uno o dos caracteres de más porsicacaso
	titulo 			TEXT NOT NULL,
	dni_autor 		VARCHAR(10) NOT NULL,
	cod_genero 		INT NOT NULL,
	cod_editorial 	INT NOT NULL,
	
	CONSTRAINT pk_libro PRIMARY KEY (isbn)
);


CREATE TABLE edicion(
	isbn				varchar(15),
	fecha_publicacion	date,
	cantidad 			int ,
	CONSTRAINT pk_edicion PRIMARY KEY (isbn, fecha_publicacion),
	CONSTRAINT ck_cantidad CHECK (cantidad > 0)
	--usamos siempre el mismo tipo de dato menos cuando usamos serial y cosas así es decir en la clave primaria
	--que es serial si pero en la clave externa suya int.
);
--Si quiero eliminar una restricción de una tabla corto el trozo de código que hace que se cree esa 
--restriccion y lo pego aqui
ALTER TABLE edicion
ADD CONSTRAINT fk_edicion_libro FOREIGN KEY (isbn) REFERENCES libro ON DELETE CASCADE;

--esta es la mejor forma primero se crean las tablas y despues se le añaden las restricciones
--aqui en alter table solo se añaden posteriormente las restricciones de clave externa 
ALTER TABLE libro
ADD CONSTRAINT fk_dni_autor FOREIGN KEY (dni_autor) REFERENCES autor,
ADD CONSTRAINT fk_cod_genero FOREIGN KEY (cod_genero) REFERENCES genero,
ADD CONSTRAINT fk_cod_editorial FOREIGN KEY (cod_editorial) REFERENCES editorial;

