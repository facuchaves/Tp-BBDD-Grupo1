package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Sector {
	int id_sector
	String nombre
	String descripcion
	int fk_configuracion
	new(String nombre,String descripcion,int fk_configuracion){
		this.nombre=nombre
		this.descripcion=descripcion
		this.fk_configuracion=fk_configuracion
	}
}