package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Unidad {
	int id_unidad
	String nombre
	String descripcion
	
	new(int id_unidad, String nombre,String descripcion){
		this.id_unidad=id_unidad
		this.nombre=nombre
		this.descripcion=descripcion
	}
	new(String nombre,String descripcion){
		this.nombre=nombre
		this.descripcion=descripcion
	}
	
	override toString(){
		this.nombre
	}
}