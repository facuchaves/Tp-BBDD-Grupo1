package repos

import java.util.List
import domain.Articulo

class ArticulosRepo {
	List<Articulo> articulos=newArrayList()
	
	new(){
		articulos=#[
			new Articulo("Carne", 200, null, 1, 5)
		]
	}
}



//	this.nombre=nombre
//		this.cant_stock=cant_stock
//		this.descripcion=descripcion
//		this.fk_categoria=fk_categoria
//		this.fk_unidad=fk_unidad