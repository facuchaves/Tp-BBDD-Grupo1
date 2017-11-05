package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Unidad {
	int id_categoria
	String nombre
	String descripcion
	
	new(String nombre,String descripcion){
		this.nombre=nombre
		this.descripcion=descripcion
	}
}