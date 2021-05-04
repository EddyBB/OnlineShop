package presentacion;

import java.util.Scanner;

import servicios.UserService;
import servicios.impl.UserServiceIMPL;

public class Main {

	private static UserService servicio = new UserServiceIMPL();
	
	public static void main(String[] args) {
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("Introduce username: ");
		String username = teclado.nextLine();
		
		System.out.println("Introduce password: ");
		String password = teclado.nextLine();
		
		if(servicio.login(username, password)) {
			System.out.println("Bienvenido: " + username);
		} else {
			System.out.println("La contraseña o el usuario son incorrectos");
		}
	}
}
		
