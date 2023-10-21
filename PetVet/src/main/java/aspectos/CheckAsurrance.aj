import java.util.Scanner;
import main.PetStore;
import main.User;

public aspect CheckAsurrance{
	
	pointcut verifyAssurance():execution(void PetStore.makeAppointment(..));
	before(): verifyAssurance(){
		System.out.println("Verifying assurance...");
	    Scanner sc = new Scanner(System.in);
	    System.out.print("Name of your pet: ");
	    String nombre = sc.nextLine();
	    boolean check = false;

	    for (User u : PetStore.users) {
	        if (u.getPetName().equals(nombre)) {
	            check = true;
	            break;
	        }
	    }

	    if (check) { 
	        System.out.println("Welcome " + nombre);
	        System.out.println("You are able to use this service");
	    } else {
	        System.out.println("Unvalid user");
	        throw new RuntimeException();
	    }

			
	} after(): verifyAssurance(){
		System.out.println("Operation completed");
	}
}