package persistencia.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import persistencia.UserDAO;

public class UserDaoImpl implements UserDAO{

	public boolean login(String username, String password) {

		boolean logincorrecto = false;
		
		Connection conexion = getConexion();
		
		String sql = "SELECT * FROM Users WHERE username=? AND password=?;";
		
		try {

			PreparedStatement sentencia = conexion.prepareStatement(sql);
			sentencia.setString(1, username);
			sentencia.setString(2, password);
			
			ResultSet rs = sentencia.executeQuery();
			logincorrecto = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return logincorrecto;
	}
	
	private Connection getConexion() {
		Connection conexion = null;
		try {
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:6033/onlineshop","developer","programaciondaw");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conexion;
	}
}
