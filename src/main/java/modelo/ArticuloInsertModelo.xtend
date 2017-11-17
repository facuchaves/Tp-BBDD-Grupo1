package modelo

import domain.Articulo
import domain.Categoria
import domain.Unidad
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.sql.DriverManager
import java.sql.Connection
import java.sql.Statement

@Accessors
@Observable
class ArticuloInsertModelo {
	Articulo articulo
	String nombre
	double cant_stock=0
	String descripcion
	Categoria categoriaSeleccionada
	Unidad unidadSeleccionada
	
	def insertarArticulo(){
		if(this.nombre===null || this.nombre==""){
			//crear ventana que contenga este mensaje
			println('No tiene nombre')
		}else{
			try{
				
			// Abrimos la conexión ahora que la vamos a usar
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
			var Statement statement = conexion.createStatement();
			
			statement.executeUpdate("INSERT INTO articulo (nombre, cant_stock, descripcion, categoria_id_categoria, unidad_id_unidad) values ('"
				+ this.nombre + "', '" + this.cant_stock + "', '" + this.descripcion  + "', '" + this.categoriaSeleccionada.id_categoria  + "', '" + this.unidadSeleccionada.id_unidad + "');"
			);
			
			println('Artículo insertado correctamente')
			
			conexion.close();
			
			}catch(Exception e){
				println('No se puede insertar el artículo')
			}
		}
	}
	
	def getCategorias(){
		var categorias=#[
			new Categoria(1,"Carnes", null,1),
			new Categoria(2,"Lacteos", null,2),
			new Categoria(3,"Bebidas", null,3),
			new Categoria(4,"Otros", null,4)
		]
		return categorias
	}
	
	def getUnidades(){
		var unidades=#[
			new Unidad(1,"Kilo", null),
			new Unidad(2,"Unidad", null),
			new Unidad(3,"Gramos", null),
			new Unidad(4,"Litros", null)
		]
		return unidades
	}
	
}