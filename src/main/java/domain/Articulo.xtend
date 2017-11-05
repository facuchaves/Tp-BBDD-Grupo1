package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Articulo {
	var int id_articulo
	var String nombre
	var int cant_stock
	var String descripcion
	var int fk_categoria
	var int fk_unidad
	new(int art, String name, int stock, String desc, int cat, int uni){
		this.id_articulo=art
		this.nombre=name
		this.cant_stock=stock
		this.descripcion=desc
		this.fk_categoria=cat
		this.fk_unidad=uni
	}
}