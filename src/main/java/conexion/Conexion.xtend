package conexion

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



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
           var ResultSet rs = s.executeQuery ("select * from cliente");
     //		var List<Cliente> clientes = new ArrayList<Cliente>();
            // Se recorre el ResultSet, mostrando por pantalla los resultados.
            while (rs.next())
            {
   	//		clientes.add(new Cliente(rs.getInt ("idCliente"),rs.getString (2),rs.getString(3)));
            }
         
            // Se cierra la conexión con la base de datos.
    //		System.out.println(clientes.size());
            conexion.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
		
		
	}
}