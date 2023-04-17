package com.example.demo;

import org.springframework.context.annotation.Bean;

//esta clase se usa para seguridad en el caso de contraseñas, se usa cuando no tenemos acceso al código fuente
//y queremos crear un bean a partir de esa clase 
public class Configuracion {
	
	@Bean
	public AlmacenAlumnos almacenAlumnos() {
		return new AlmacenAlumnosEnMemoria();
	}
}
