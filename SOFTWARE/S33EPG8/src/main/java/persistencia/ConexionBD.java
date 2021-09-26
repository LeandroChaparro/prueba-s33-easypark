/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

/**
 *
 * @author Leandro
 */

import java.sql.*;

public class ConexionBD {

    private String url = "";
    private String DB_driver = "";
    private String host = "";
    private String db = "";
    private String username = "";
    private String password = "";
    private Connection con = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    private boolean local; //Se inicializa en false por defecto
//-------------------------Constructor de la clase-------------------------------------------------------------------------------
    public ConexionBD() {   

        local = false;
        DB_driver = "com.mysql.cj.jdbc.Driver";
        if (local) {

            host = "localhost:3306";
            db = "S33Grupo8";
            url = "jdbc:mysql://" + host + "/" + db;
            username = "root";
            password = "root";

        } else {
            host = "167.99.168.84:3306";
            db = "S33Grupo8";
            url = "jdbc:mysql://" + host + "/" + db;
            username = "mision";
            password = "tics";

        }

        try {
            Class.forName(DB_driver);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error en el driver de la base de datos: " + ex);
        }

        try {
            con = DriverManager.getConnection(url,username,password);
            if (con != null) {
                DatabaseMetaData meta = con.getMetaData();
                System.out.println("Base de datos conectada " + meta.getDriverName());
            }
        } catch (SQLException ex) {
            System.out.println("Error en la conexión a la base de datos" + ex.getMessage());
        }

    }
    
//-------------------------------Main para probar-----------------------------------------------------------------------------------------    
public static void main (String[] args){


    
   ConexionBD ejemplo= new ConexionBD();

    
}     
    
}
