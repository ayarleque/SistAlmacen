package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion {
    private static String bd="almacenbd";
    private static String USER = "root";
    private static String PASSWORD = "triangulo2018";
    private static String url = "jdbc:mysql://localhost/"+bd+ "?user=" + USER + "&password=" + PASSWORD+"&useSSL=false";
    private static Connection con;
    
    public static Connection geconnection (){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,USER,PASSWORD);
            
        }catch (Exception e) {
            JOptionPane.showMessageDialog(null,"error" +e.getMessage());
        }
        return con;
    }
    /*public static void main(String[] args) {
        Connection con;
        con= geconnection();
        System.out.println("estado: "+con);
    }*/
}
