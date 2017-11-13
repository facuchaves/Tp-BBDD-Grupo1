package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Receta {
	var int id_receta
	var String titulo
	var String descripcion
	var String pasos
	
	new(int id_receta,String titulo,String descripcion,String pasos){
		this.id_receta=id_receta
		this.titulo=titulo
		this.descripcion=descripcion
		this.pasos=pasos
	}
	
	new(String titulo,String descripcion,String pasos){
		this.titulo=titulo
		this.descripcion=descripcion
		this.pasos=pasos
	}
}