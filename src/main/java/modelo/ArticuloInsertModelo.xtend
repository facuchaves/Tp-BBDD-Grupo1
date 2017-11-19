package modelo

import domain.Articulo
import domain.Categoria
import domain.Unidad
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.sql.DriverManager
import java.sql.Connection
import java.sql.Statement
import java.sql.ResultSet
import java.util.List
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class ArticuloInsertModelo {
	Articulo articulo
	String nombre
	double cant_stock=0
	String descripcion
	Categoria categoriaSeleccionada
	Unidad unidadSeleccionada
	List<Unidad> unidadesListadas=newArrayList
	List<Categoria> categoriasListadas=newArrayList
	int flag = 0
	
	new(){
		try{
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
			var Statement statement = conexion.createStatement();
			var ResultSet resultSet 
			
			try{
				resultSet = statement.executeQuery("SELECT id_unidad,nombre,descripcion FROM unidad;");
				while(resultSet.next()){
					this.unidadesListadas.add(new Unidad(resultSet.getInt("id_unidad"),
								resultSet.getString("nombre"),
								resultSet.getString("descripcion")))
				}
			}catch(Exception e){
				println('No se pudo agregar la unidad ' + resultSet.getString("nombre"))
				e.printStackTrace()
			}
			conexion.close
		}catch(Exception e){
			println('ERROR: No se pudieron obtener las unidades')
			e.printStackTrace()
		}
		try{
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
			var Statement statement = conexion.createStatement();
			var ResultSet resultSet 
			
			try{
				resultSet = statement.executeQuery("SELECT id_categoria,nombre,descripcion,configuracion_id_configuracion FROM categoria;");
				while(resultSet.next()){
					this.categoriasListadas.add(new Categoria(resultSet.getInt("id_categoria"),
								resultSet.getString("nombre"),
								resultSet.getString("descripcion"),
								resultSet.getInt("configuracion_id_configuracion")))
				}
			}catch(Exception e){
				println('No se pudo agregar la catergoria ' + resultSet.getString("nombre"))
				e.printStackTrace()
			}
			conexion.close
		}catch(Exception e){
			println('ERROR: No se pudieron obtener las categorias')
			e.printStackTrace()
		}
	}
	
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
	
	@Dependencies("flag")
	def getCategorias(){
		this.categoriasListadas
	}
	
	@Dependencies("flag")
	def getUnidades(){
		this.unidadesListadas
	}

	def sumarFlag(){
		flag++
	}
}