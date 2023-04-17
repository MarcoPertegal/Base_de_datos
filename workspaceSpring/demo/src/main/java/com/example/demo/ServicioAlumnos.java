package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ServicioAlumnos {
	
	private final AlmacenAlumnos almacenAlumnos;
	
	/**
	 * Método que devuelve un listado con los nombres de alumnos mayotes de edad
	 * @return lista d enombres, lista vacia si nohay
	 */
	public List<String> alumnosMayoresEdad(){
		List<String> result = new ArrayList<>();
		
		result = almacenAlumnos.findAll().stream() //!!!Me daba error porque no había guardado esto en el result =
			.filter(a-> a.getEdad()>18)
			.map(a -> a.getNombre() + " "+ a.getApellido())
			.toList();
		
		return result;
	
	}
}
