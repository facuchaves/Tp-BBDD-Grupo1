package modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.sql.DriverManager
import java.sql.Connection
import java.sql.Statement
import java.util.List
import domain.Articulo
import org.uqbar.commons.model.annotations.Dependencies
import java.sql.ResultSet

//import java.sql.ResultSet

@Accessors
@Observable
class RecetaModelo {
	String titulo
	String descripcion
	String pasos
	Articulo articuloSeleccionado
	Double stock
	List<Articulo> articulosAgregados=newArrayList
	int flag = 0
	List<Articulo> articulosListados=newArrayList
	
	new(){
		try{
			// Abrimos la conexión ahora que la vamos a usar
			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
			var Statement idMaxSt = conexion.createStatement();
			var ResultSet idMaxRs
			var Statement statement = conexion.createStatement();
			var ResultSet resultSet 
			var int idMax
			try{
				idMaxRs = idMaxSt.executeQuery("SELECT MAX(id_articulo) as maxId FROM articulo;");
				idMax=idMaxRs.getInt("maxId");
			}catch(Exception e){
				println('No se pudo conseguir el máximo id_articulo ' + idMaxRs)
			}
			
			try{
				resultSet = statement.executeQuery("SELECT id_articulo,nombre,cant_stock,descripcion,categoria_id_categoria,unidad_id_unidad FROM articulo;");
				while(resultSet.next()){
					this.articulosListados.add(new Articulo(resultSet.getInt("id_articulo"),resultSet.getString("nombre"),
								resultSet.getInt("cant_stock"),resultSet.getString("descripcion"),
								resultSet.getInt("categoria_id_categoria"),resultSet.getInt("unidad_id_unidad")))
				}				
			}catch(Exception e){
				println('No se pudo agregar el artículo ' + resultSet.getString("nombre"))
			}
		}catch(Exception e){
			e.printStackTrace()
			println('ERROR: No se pudieron obtener los artículos')
		}
		
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
				conexion.close()
			}catch(Exception e){
				println('ERROR: No se pudo ingresar la receta')
			}
			
			try{
				// Abrimos la conexión ahora que la vamos a usar
				DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
				var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
				var Statement insercion= conexion.createStatement();
				var Statement seleccion= conexion.createStatement();
				var ResultSet rs
				var int i
				
				try{
					rs = seleccion.executeQuery("SELECT MAX(id_receta) FROM receta;")					
				}catch(Exception e){
					println('No se pudo capturar el id_receta')
				}
				
				for(i=0; i<articulosAgregados.size;i++){
					try{
						insercion.executeUpdate("INSERT INTO receta_has_articulo (receta_id_receta, articulo_id_articulo, cantidad_necesaria) 
						values ('" + rs.getInt(1) + "', '" + articulosAgregados.get(1).id_articulo + "', '" + stock + "');");
						println(rs.getInt(1) + "', '" + articulosAgregados.get(1).id_articulo + "', '" + stock)						
					}catch(Exception e){
						println('No se pudo ingresar el artículo: ' + articulosAgregados.get(i))
					}	
				}
				
				conexion.close()
			}catch(Exception e){
				println('ERROR: No se pudieron ingresar los artículos de la receta')
			}
		}
	}
	
//	def getArticulosListados(){
//		try{
//			// Abrimos la conexión ahora que la vamos a usar
//			DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
//			var Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/heladera", "root","root");
//			var Statement idMaxSt = conexion.createStatement();
//			var ResultSet idMaxRs
//			var Statement statement = conexion.createStatement();
//			var ResultSet resultSet 
//			var int idMax
//			
//			try{
//				idMaxRs = idMaxSt.executeQuery("SELECT MAX(id_articulo) FROM articulo;")
//				idMax=idMaxRs.getInt(1)
//			}catch(Exception e){
//				println('No se pudo conseguir el máximo id_articulo')
//			}
//			
//			try{
//				resultSet = statement.executeQuery("SELECT id_articulo,nombre,cant_stock,descripcion,categoria_id_categoria,unidad_id_unidad FROM articulo;");
//				while(resultSet.next()){
//					this.articulosListados.add(new Articulo(resultSet.getInt("id_articulo"),resultSet.getString("nombre"),
//								resultSet.getInt("cant_stock"),resultSet.getString("descripcion"),
//								resultSet.getInt("categoria_id_categoria"),resultSet.getInt("unidad_id_unidad")))
//				}				
//			}catch(Exception e){
//				println('No se pudo agregar el artículo ' + resultSet.getString("nombre"))
//			}
//		}catch(Exception e){
//			e.printStackTrace()
//			println('ERROR: No se pudieron obtener los artículos')
//		}
//		articulosListados
//	}

	def agregarArticulo(){
		articulosAgregados.add(articuloSeleccionado)
		sumarFlag()
	}
	@Dependencies("flag")
	def getArticulosAgregados(){
		this.articulosAgregados
	}
	def sumarFlag(){
		flag++
	}
}