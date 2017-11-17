package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ArticuloHasReceta {
	int receta_id_receta
	int articulo_id_articulo
	Double cantidad_necesaria
	
	new(int receta_id_receta,int articulo_id_articulo,Double cantidad_necesaria){
		this.receta_id_receta=receta_id_receta
		this.articulo_id_articulo=articulo_id_articulo
		this.cantidad_necesaria=cantidad_necesaria	
	}
}