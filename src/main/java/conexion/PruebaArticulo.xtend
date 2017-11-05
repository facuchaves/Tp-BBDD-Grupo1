package conexion

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PruebaArticulo {
	int id_articulo
	String nombre
	int stock
	
	new(int id, String nombre, int stock){
		this.id_articulo=id
		this.nombre=nombre
		this.stock=stock
	}
		
	new(String nombre, int stock){
		this.nombre=nombre
		this.stock=stock
	}
}