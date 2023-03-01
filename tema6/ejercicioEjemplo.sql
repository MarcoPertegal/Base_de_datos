
DROP TABLE IF EXISTS libro;
CREATE TABLE libro(
	isbn 			varchar(100),--a los caracteres que son fijos ponerle siempre uno o dos caracteres de más porsicacaso
	título 			text,
	dni_autor		varchar(10),
	cod_genero		smallint,
	cod_editorial	smallint,
	CONSTRAINT pk_isbn PRIMARY KEY (isbn)
);

DROP TABLE IF EXISTS autor;
CREATE TABLE autor(
	dni				varchar(10),
	Nombre 			text,
	Nacionalidad 	text
);

DROP TABLE IF EXISTS editorial;
CREATE TABLE editorial(
	cod_editorial	serial,
	nombre 			text,
	direccion 		text,
	poblacion		text
);

DROP TABLE IF EXISTS genero;
CREATE TABLE genero(
	id_genero		smallserial,
	nombre			varchar,
	descripción 	text
);

DROP TABLE IF EXISTS edicion;
CREATE TABLE edicion(
	isbn				varchar(15),
	fecha_publicacion	date,
	cantidad 			int,
	CONSTRAINT pk_isbn_and_pk_fecha_publicacion PRIMARY KEY (isbn, fecha_publicacion),
	CONSTRAINT fk_isbn FOREIGN KEY (isbn) REFERENCES libro
	
	--usamos siempre el mismo tipo de dato menos cuando usamos serial y cosas así es decir en la clave primaria
	--que es serial si pero en la clave externa suya int.
);

