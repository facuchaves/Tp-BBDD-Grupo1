package modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.sql.DriverManager
import java.sql.Connection
import java.sql.Statement
//import java.sql.ResultSet

@Accessors
@Observable
class RecetaModelo {
	String titulo
	String descripcion
	String pasos
	
	def instanciarReceta(){
		if(this.titulo===null || this.titulo==""){
			//crear ventana que contenga este mensaje
			println('No tiene titulo')
		}else if(pasos===null || pasos==""){
			//crear ventana que contenga este mensaje
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
				e.printStackTrace();
			}
		}
	}
}