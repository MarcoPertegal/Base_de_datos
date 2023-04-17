DROP TABLE IF EXISTS alumno CASCADE; 
DROP TABLE IF EXISTS empresa CASCADE;
DROP TABLE IF EXISTS alumnos_asisten CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS profesor CASCADE; 
DROP TABLE IF EXISTS tipo_curso CASCADE; 

CREATE TABLE alumno(
	dni					VARCHAR(9),
	nombre				VARCHAR,
	direccion			VARCHAR,
	telefono			VARCHAR,
	edad				SMALLINT,
	empresa				VARCHAR,
	CONSTRAINT pk_alumno PRIMARY KEY (dni)
);

CREATE TABLE empresa(
	cif					VARCHAR,
	nombre				VARCHAR,
	direccion			VARCHAR,
<<<<<<< HEAD
	telefono			SMALLINT,
=======
	telefono			VARCHAR(12),
>>>>>>> 8871ac3ef26f8187689ed3350e6c82966af70096
	CONSTRAINT pk_empresa PRIMARY KEY (cif)
);

CREATE TABLE alumnos_asisten(
	dni					VARCHAR(9),
<<<<<<< HEAD
	n_concreto			VARCHAR,
=======
	n_concreto			INTEGER,
>>>>>>> 8871ac3ef26f8187689ed3350e6c82966af70096
	CONSTRAINT pk_alumnos_asisten PRIMARY KEY (dni, n_concreto)
);

CREATE TABLE curso(
<<<<<<< HEAD
	n_concreto			VARCHAR,
	fecha_inicio		DATE,
	fecha_fin			DATE,
	dni_profesor		VARCHAR,
	tipo_curso			INT,
=======
	n_concreto			INTEGER,
	fecha_inicio		DATE,
	fecha_fin			DATE,
	dni_profesor		VARCHAR,
	tipo_curso			SMALLINT,
>>>>>>> 8871ac3ef26f8187689ed3350e6c82966af70096
	CONSTRAINT pk_curso PRIMARY KEY (n_concreto)
);

CREATE TABLE profesor(
	dni					VARCHAR(9),
	nombre				VARCHAR,
	apellido			VARCHAR,
<<<<<<< HEAD
	telefono			SMALLINT,
=======
	telefono			VARCHAR,
>>>>>>> 8871ac3ef26f8187689ed3350e6c82966af70096
	direccion			SMALLINT,
	CONSTRAINT pk_profesor PRIMARY KEY (dni)
);

CREATE TABLE tipo_curso(
	cod_curso			SMALLINT,
	duracion			SMALLINT,
	programa			VARCHAR,
	titulo				VARCHAR,
	CONSTRAINT pk_tipo_curso PRIMARY KEY (cod_curso)
);


ALTER TABLE alumno
ADD CONSTRAINT fk_empresa_alumno FOREIGN KEY (empresa) REFERENCES empresa ON DELETE SET NULL;

ALTER TABLE alumnos_asisten
ADD CONSTRAINT fk_alumnos_asisten_alumno FOREIGN KEY (dni) REFERENCES alumno ON DELETE CASCADE,
ADD CONSTRAINT fk_alumnos_asisten_curso FOREIGN KEY (n_concreto) REFERENCES curso ON DELETE CASCADE;

ALTER TABLE curso
ADD CONSTRAINT fk_curso_profesor FOREIGN KEY (dni_profesor) REFERENCES profesor ON DELETE SET NULL,--si desapare un profesor no desaparen sus cursos
ADD CONSTRAINT fk_curso_tipo_curso FOREIGN KEY (tipo_curso) REFERENCES tipo_curso ON DELETE CASCADE;

INSERT INTO alumno(dni, nombre, direccion, edad) VALUES 
	('495838F', 'Juan', 'Calle Hijuela de Villahoracia', 60);

SELECT *
FROM alumno;

UPDATE alumno
SET edad = edad*1.25; --esto es como aumentar la edad un 25%

DELETE FROM alumno
WHERE nombre = 'Juan'
RETURNING *;
--para borrar siempre usamos el where para no eliminar muchas cosas
--para borrar se forra siempre una fila entera
--si quiero eliminar una clumna o solo un dato es con update

SELECT *
FROM alumno;