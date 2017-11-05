package conexion

import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager
import java.sql.Connection
import java.sql.Statement
import java.sql.ResultSet

class Conexion {	
	
		def static void main(String[] args){
		
		// Se mete todo en un try por los posibles errores de MySQL
        try
        {
            // Se registra el Driver de MySQL
            DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
            
            // Se obtiene una conexión con la base de datos. Hay que
            // cambiar el usuario "root" y la clave "la_clave" por las
            // adecuadas a la base de datos que estemos usando.
            var Connection conexion = DriverManager.getConnection ("jdbc:mysql://localhost:3306/heladera","root", "admin");
            
            // Se crea un Statement, para realizar la consulta
            var Statement s = conexion.createStatement();
            
            // Se realiza la consulta. Los resultados se guardan en el 
            // ResultSet rs
           var ResultSet rs = s.executeQuery ("select * from articulo");
     		var List<PruebaArticulo> articles = new ArrayList<PruebaArticulo>();
            // Se recorre el ResultSet, mostrando por pantalla los resultados.
            while (rs.next())
            {
            	var articulo = new PruebaArticulo(rs.getInt("id_articulo"), rs.getString(2), rs.getInt(3))
  				articles.add(articulo);
  				println("id: " + articulo.id_articulo + ", nombre: " + articulo.nombre + ", stock: " + articulo.stock)
            }
         
            // Se cierra la conexión con la base de datos.
    		System.out.println(articles.size());
            conexion.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
		
		
	}
}