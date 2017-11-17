package modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.sql.DriverManager
import java.sql.Connection
import java.sql.Statement
import java.util.List
import domain.Articulo
import java.sql.ResultSet
import org.uqbar.commons.model.annotations.Dependencies

//import java.sql.ResultSet

@Accessors
@Observable
class RecetaModelo {
	String titulo
	String descripcion
	String pasos
	List<Articulo> articulosAgregados
	Articulo articuloSeleccionado
	Articulo articulo
	int flag = 0
	
	new(){
	}
	
	def instanciarReceta(){
		if(this.titulo===null || this.titulo==""){
			println('No tiene titulo')
		}else if(pasos===null || pasos==""){
			println('No tiene pasos')
		}else{
			try{
				
			// Abrimos la conexión ahora que la vamos a usar
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
			var Statement statement = conexion.createStatement();
			
			statement.executeUpdate("INSERT INTO receta (titulo, descripcion, pasos) values ('"
				+ this.titulo + "', '" + this.descripcion + "', '" + this.pasos + "');"
			);
			
			conexion.close();
			}catch(Exception e){
				println('No se puede ingresar la receta')
			}
		}
	}
	
	def getArticulosListados(){
		var List<Articulo> articulosListados
		try{
				
			// Abrimos la conexión ahora que la vamos a usar
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
			var Statement statement = conexion.createStatement();
			
			var ResultSet resultSet = statement.executeQuery("SELECT * FROM articulo");
			
			while(resultSet.next()){
				articulosListados.add(new Articulo(resultSet.getInt("id_articulo"),resultSet.getString("nombre"),resultSet.getInt("cant_stock"),resultSet.getString("descripcion"),resultSet.getInt("categoria_id_categoria"),resultSet.getInt("unidad_id_unidad")))
			}
			
			conexion.close();
			
		}catch(Exception e){
			println('No se pueden obtener los artículos')
		}
		
		articulosListados
	}
	
	@Dependencies("flag")
	def agregarArticulo(){
		articulosAgregados.add(articulo)
	}
	
	def sumaFlag(){
		flag+=1
	}
}