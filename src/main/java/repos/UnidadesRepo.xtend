package repos

import java.util.List
import domain.Unidad

class UnidadesRepo {
	List<Unidad> unidades = newArrayList
	
	new(){
		unidades=#[
			new Unidad("Kilo", null),
			new Unidad("Unidad", null),
			new Unidad("Gramos", null),
			new Unidad("Litros", null)
		]
	}
}

//String nombre,String descripcion