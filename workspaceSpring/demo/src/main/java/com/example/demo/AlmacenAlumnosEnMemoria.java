package com.example.demo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

@Repository
@Primary
public class AlmacenAlumnosEnMemoria implements AlmacenAlumnos {
	List <Alumno> lista;
	
	@PostConstruct
	public void init() {
		lista = new ArrayList<>();
		
		lista.add(Alumno.builder()	// es una forma de crear un objeto sabiendo a que hace referencia cada dato
				.nombre("Juan")
				.apellido("Carmona")//evitando el scrol horizontal y si hay algun atributo null no hay que darle null
				.edad(32)
				.nota(5.9)			//tampoco importa el orden
				.build()
				);
		lista.add(new Alumno(34, "Felipe", "Campos", 2.6));
		
		lista.add(Alumno.builder()
				.nombre("Roberto")
				.apellido("Pérez")
				.edad(17)
				.nota(8.9)			
				.build()
				);
	}
	
	@Override
	public List<Alumno> findAll(){
		return Collections.unmodifiableList(lista);
	}
}
