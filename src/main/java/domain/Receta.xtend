package domain

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
}