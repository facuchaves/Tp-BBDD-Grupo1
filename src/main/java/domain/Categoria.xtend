package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Categoria {
	int id_categoria
	String nombre
	String descripcion
	int fk_configuracion
	
	new(int id_categoria,String nombre,String descripcion,int fk_configuracion){
		this.id_categoria=id_categoria
		this.nombre=nombre
		this.descripcion=descripcion
		this.fk_configuracion=fk_configuracion
	}
	
	new(String nombre,String descripcion,int fk_configuracion){
		this.nombre=nombre
		this.descripcion=descripcion
		this.fk_configuracion=fk_configuracion
	}
	
	override toString(){
		this.nombre
	}
}