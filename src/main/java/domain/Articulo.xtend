package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Articulo {
	int id_articulo
	String nombre
	int cant_stock
	String descripcion
	int fk_categoria
	int fk_unidad
	
	new(String nombre,int cant_stock,String descripcion,int fk_categoria,int fk_unidad){
		this.nombre=nombre
		this.cant_stock=cant_stock
		this.descripcion=descripcion
		this.fk_categoria=fk_categoria
		this.fk_unidad=fk_unidad
	}
}