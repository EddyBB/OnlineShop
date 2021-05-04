package servicios.impl;

import persistencia.UserDAO;
import persistencia.impl.UserDaoImpl;
import servicios.UserService;

public class UserServiceIMPL implements UserService {
	
	private UserDAO userDAO = new UserDaoImpl();

	public boolean login(String username, String password) {
		return userDAO.login(username, password);
	}
	
}
