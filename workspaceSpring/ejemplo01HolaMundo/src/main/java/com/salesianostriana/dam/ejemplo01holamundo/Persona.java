package com.salesianostriana.dam.ejemplo01holamundo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Persona {
	//esta clase deverñia ir en su propio paquete demoemnnto lo haremos asíe
	private String nombre;
	private String apellidos;
	
}
