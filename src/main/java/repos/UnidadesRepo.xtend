package repos

import java.util.List
import domain.Unidad

class UnidadesRepo {
	List<Unidad> unidades = newArrayList
	
	new(){
		unidades=#[
			new Unidad("Kilo", null, 1),
			new Unidad("Unidad", null, 1),
			new Unidad("Gramos", null, 1),
			new Unidad("Litros", null, 1)
		]
	}
}

//String nombre,String descripcion,int fk_configuracion