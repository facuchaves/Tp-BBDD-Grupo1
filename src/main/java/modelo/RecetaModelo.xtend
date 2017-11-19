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
	Articulo articuloSeleccionado=null
	Double stock=0d
	List<Articulo> articulosAgregados=newArrayList
	List<Articulo> articulosListados=newArrayList
	int flag = 0

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
				while(idMaxRs.next()){
					idMax=idMaxRs.getInt("maxId");
				}
			}catch(Exception e){
				println('No se pudo conseguir el máximo id_articulo ' + idMaxRs)
			}
			
			try{
				resultSet = statement.executeQuery("SELECT id_articulo,nombre,cant_stock,descripcion,categoria_id_categoria,unidad_id_unidad FROM articulo;");
				while(resultSet.next()){
					this.articulosListados.add(new Articulo(resultSet.getInt("id_articulo"),resultSet.getString("nombre"),
								resultSet.getDouble("cant_stock"),resultSet.getString("descripcion"),
								resultSet.getInt("categoria_id_categoria"),resultSet.getInt("unidad_id_unidad")))
				}
			}catch(Exception e){
				println('No se pudo agregar el artículo ' + resultSet.getString("nombre"))
				e.printStackTrace()
			}
		}catch(Exception e){
			println('ERROR: No se pudieron obtener los artículos')
			e.printStackTrace()
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
				println("Receta insertada correctamente")				
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
				var int i=0
				
				try{
					rs = seleccion.executeQuery("SELECT MAX(id_receta) as maxRec FROM receta;");
				}catch(Exception e){
					println('No se pudo capturar el id_receta')
				}
				
				if(rs.next()){
					var int nroReceta = rs.getInt(1)
					try{
						for(i=0; i<articulosAgregados.size;i++){
							if(articulosAgregados.get(i).cant_stock>0){
								insercion.executeUpdate(
									"INSERT INTO receta_has_articulo 
										(receta_id_receta, articulo_id_articulo, cantidad_necesaria) 
									VALUES ('" + 
										nroReceta + "', '" + 
										articulosAgregados.get(i).id_articulo + "', '" + 
										articulosAgregados.get(i).cant_stock + "');"
								);
								println("Inertado correctamente " +  articulosAgregados.get(i) + ": " + rs.getInt(1) + ", " +
										articulosAgregados.get(i).id_articulo + ", " + articulosAgregados.get(i).cant_stock)					
							}
							else{
								println('No se pudo ingresar el artículo: ' + articulosAgregados.get(i) + ". Stock nulo")
							}
						}
					}catch(Exception e){
						e.printStackTrace()
						println('No se pudo ingresar el artículo: ' + articulosAgregados.get(i))
					}
				conexion.close()
				}
			}catch(Exception e){
				println('ERROR: No se pudieron ingresar los artículos de la receta')
			}
		}
		this.articulosAgregados = #[]
		sumarFlag()
	}

	def agregarArticulo(){
		articuloSeleccionado.cant_stock=stock
		println("se setea el stock de: " + articuloSeleccionado)
		articulosAgregados.add(articuloSeleccionado)
		println("se agregó " + articuloSeleccionado + " a la lista de seleccionados")
		stock=0d
		articuloSeleccionado=null
		sumarFlag()
		println(articulosAgregados.size)
	}	
	@Dependencies("flag")
	def getArticulosAgregados(){
		this.articulosAgregados
		
	}
	def sumarFlag(){
		flag++
	}
}