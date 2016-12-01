package classes;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conection {

	private static final String URL = "jdbc:mysql://localhost:3306/doggos";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "n0m3l0";
        
	public static Connection getConnection() throws SQLException{
		try {
                    Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
                    System.out.println("No se encontro la Libreria de conexión");
                }
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
}