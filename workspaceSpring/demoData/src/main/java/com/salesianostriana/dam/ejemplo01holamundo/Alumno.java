package com.salesianostriana.dam.ejemplo01holamundo;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Alumno {
	
	@Id
	private Long id;
	
	private String nombre;
	private String apellidos;
	private String email;
	private LocalDate fechaNacimeinto;
	
}
