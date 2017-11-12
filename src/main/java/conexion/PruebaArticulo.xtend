package conexion

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class PruebaArticulo {
	int id_articulo
	String nombre
	int stock
	String nombreCategoria
	String nombreUnidad
	
	new(String nombreCategoria,String nombre,int stock,String nombreUnidad){
		this.nombre=nombre
		this.nombreCategoria = nombreCategoria
		this.stock=stock
		this.nombreUnidad=nombreUnidad
	}
		
	new(int id, String nombre, int stock){
		this.id_articulo=id
		this.nombre=nombre
		this.stock=stock
	}
		
	new(String nombre, int stock){
		this.nombre=nombre
		this.stock=stock
	}
	
	new(){
		super()
	}
}