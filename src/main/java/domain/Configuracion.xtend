package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Configuracion {
	var int id_configuracion
	var int maximo
	var int minimo
	var boolean defolt
	var boolean vigente
	
	new(int id_configuracion,int maximo,int minimo,boolean defolt,boolean vigente){
		this.id_configuracion=id_configuracion
		this.maximo=maximo
		this.minimo=minimo
		this.defolt=defolt
		this.vigente=vigente
	}
}