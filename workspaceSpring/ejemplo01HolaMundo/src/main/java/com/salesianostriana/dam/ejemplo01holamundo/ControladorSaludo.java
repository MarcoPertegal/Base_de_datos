package com.salesianostriana.dam.ejemplo01holamundo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

//esta clase va a tener los controladores de las peticiones del navegador
//los controladores son metodos que van a atender peticiones 

@Controller
public class ControladorSaludo {
	
	//hay que decirle que tipo de peticion va a atender, la url, lo que se pone en el getmapping, indica
	//que el metodo de abajo atendera peticiones tipo welcome
	//se le están pasando dos parámetros, String y Model
	//lo que va entre comillas "nombre" es el nombre identificador que va a tener esa varible en el html
	//nombre sin comillas es el nombre de la variable en el la clase
	//es logico que se llamen igual para saber cual son en ambos lados
	//este metodo se dedica ha hacer algo cuando llegue la peticioon welcome
	//al controlador no se le llama con el nombre del metodo sino que con el nomnre de getMapping
	//los parametros no se declaran 
	@GetMapping ({"/", "welcome"})
	public String welcome(@RequestParam(name="nombre", required=false, defaultValue= "Mundo") String
			nombre, Model model) {
		model.addAttribute("nombre", nombre);//se le pasan las cosas dinamicas con los datos que va a mostrar la web
		
		return "index"; //devuelve el nombre la página web que va apintar, ese html lo creamos en la carpeta templates
	}
	
	//como solo hay una no hacen falta los corchetes
	//siempre le pasamos model al metodo
	//no tiene request param porque no levamos a pasar parametros
	//lo que va primero entrcommillas del addAtributo lo primero que aparece es el nombre de la variable que está en el html
	@GetMapping ("/saludo2")
	public String welcome2(Model model) {
		model.addAttribute("persona", new Persona("Felipe", "Naranjo"));
		return "SaludoPersonalizado";//hay que crear un criterio para estos nombres lo nombro como variables
	}
	
	//saludo y mensaje se tieien que llamar igual aqui y en el html
	@GetMapping ("/saludo3")
	public String welcome3(Model model) {
		model.addAttribute("saludo", "Hola Mundo");
		model.addAttribute("mensaje", "!Se me hace largo el proyect");
		model.addAttribute("url", "http://triana.salesianos.edu");
		
		return "SaludoYEnlace";
	}
}
