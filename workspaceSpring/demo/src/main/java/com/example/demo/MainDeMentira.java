package com.example.demo;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class MainDeMentira {
	
	ApplicationContext ctx;//¿que es?
	@Autowired
	private ServicioAlumnos servicioAlumnos;
	
	@PostConstruct
	public void ejecutar() {
		servicioAlumnos.alumnosMayoresEdad()
		.forEach(a -> System.out.println(a+"es mayor"));
	}

}
