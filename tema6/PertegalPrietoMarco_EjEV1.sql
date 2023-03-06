DROP TABLE IF EXISTS docente DROP ON CASCADE;
DROP TABLE IF EXISTS actividades DROP ON CASCADE;
DROP TABLE IF EXISTS alumno DROP ON CASCADE;
DROP TABLE IF EXISTS asignacion_act DROP ON CASCADE;
DROP TABLE IF EXISTS asistencia_act DROP ON CASCADE;

CREATE TABLE docente(
	dni 			VARCHAR,
	nombre			VARCHAR,
	telefono		VARCHAR,
	anioIngreso		VARCHAR,
	CONSTRAINT pk_docente PRIMARY KEY (dni)
);

CREATE TABLE actividades(
	idAct			INT,
	nombre			VARCHAR,
	duracion		INT,
	CONSTRAINT pk_actividades PRIMARY KEY (idAct)
);

CREATE TABLE alumno(
	cod_alumno		INT,
	nombre			VARCHAR,
	telefono		VARCHAR,
	nivel			VARCHAR,
	CONSTRAINT pk_alumno PRIMARY KEY (cod_alumno)
);

CREATE TABLE asignacion_act(
	idDoc			VARCHAR,
	idAct			INT,
	diaSemana		VARCHAR,
	hora			INT,
	CONSTRAINT pk_asignacion_act PRIMARY KEY (idDoc, idAct, diaSemana, hora)
);

CREATE TABLE asistencia_act(
	idAlum			INT,
	idAct			INT,
	idDoc 			VARCHAR,
	CONSTRAINT pk_asistencia_act PRIMARY KEY (idAlum, idAct)
);

ALTER TABLE asignacion_act
ADD CONSTRAINT fk_asignacion_act FOREIGN KEY (idAct) REFERENCES actividades ON DELETE CASCADE;

ALTER TABLE asistencia_act
ADD CONSTRAINT fk_asistencia_act FOREIGN KEY (idAct) REFERENCES actividades ON DELETE CASCADE,
ADD CONSTRAINT fk_asistencia_act FOREIGN KEY (idAlum) REFERENCES actividades ON DELETE CASCADE;



