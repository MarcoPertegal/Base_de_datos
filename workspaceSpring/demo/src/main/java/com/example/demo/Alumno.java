package com.example.demo;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
//todo esto con lombok
//data genera gettes y setters
//en el recuadro de la derecha aparece todo lo generado
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Alumno {
	
	private int edad;
	private String nombre;
	private String apellido;
	private double nota;
}
