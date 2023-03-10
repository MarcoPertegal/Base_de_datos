DROP TABLE IF EXISTS empresa CASCADE;
DROP TABLE IF EXISTS alumno CASCADE;
DROP TABLE IF EXISTS alumnos_asisten CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS profesor CASCADE;
DROP TABLE IF EXISTS tipos_curso CASCADE;

CREATE TABLE empresa(
	cif 			VARCHAR(10), 
	nombre			VARCHAR,
	direccion		VARCHAR,
	telefono		VARCHAR(12),
	CONSTRAINT pk_empresa PRIMARY KEY (cif)
);

CREATE TABLE alumno(
	dni 			VARCHAR(10),
	nombre			VARCHAR,
	direccion		VARCHAR,
	telefono		VARCHAR(12),
	edad			SMALLINT,
	empresa			VARCHAR,
	CONSTRAINT pk_alumno PRIMARY KEY (dni)
);

CREATE TABLE alumnos_asisten(
	dni				VARCHAR,
	n_concreto		SMALLINT,
	CONSTRAINT pk_alumos_asisten PRIMARY KEY (dni, n_concreto)
);

CREATE TABLE curso(
	n_concreto		SMALLINT,
	fecha_inicio 	DATE,
	fecha_fin		DATE,
	dni_profesor	VARCHAR(10),
	tipo_curso		SMALLINT,
	CONSTRAINT pk_curso PRIMARY KEY (n_concreto)
);

CREATE TABLE profesor(
	dni				VARCHAR(10),
	nombre			VARCHAR,
	apellidos		VARCHAR,
	telefono		VARCHAR(12),
	direccion		VARCHAR,
	CONSTRAINT pk_profesor PRIMARY KEY (dni)
);

CREATE TABLE tipos_curso(
	cod_curso		SMALLSERIAL,
	duracion		DATE,
	programa		VARCHAR,
	titulo			VARCHAR,
	CONSTRAINT pk_tipos_curso PRIMARY KEY (cod_curso)
);

ALTER TABLE alumno
ADD CONSTRAINT fk_empresa FOREIGN KEY (empresa) REFERENCES empresa ON DELETE SET NULL;

ALTER TABLE alumnos_asisten
ADD CONSTRAINT fk_alumno FOREIGN KEY (dni) REFERENCES alumno ON DELETE CASCADE,
ADD CONSTRAINT fk_n_concreto FOREIGN KEY (n_concreto) REFERENCES curso;

ALTER TABLE curso
ADD CONSTRAINT fk_profesor FOREIGN KEY (dni_profesor) REFERENCES profesor,
ADD CONSTRAINT fk_tipos_curso FOREIGN KEY (tipo_curso) REFERENCES tipos_curso;


INSERT INTO 
	empresa(cif, nombre)
VALUES('1234d', 'juan');

DELETE FROM alumno
WHERE nombre = 'Juan'
RETURNING *;


SELECT *
FROM empresa