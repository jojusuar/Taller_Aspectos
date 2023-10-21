import main.User;
import java.util.Scanner;

public aspect CheckAssurance {
    pointcut verifyAssurance(): execution(void main.PetStore.makeAppointment());

    before(): verifyAssurance() {
        System.out.println("INFO: VERIFYING ASSURANCE");
        boolean estaRegistrado = false;
        Scanner sc=new Scanner(System.in);
        System.out.println("Name of your pet:");
        String nombreMascota=sc.nextLine();
        for (User user : main.PetStore.users) {
            if (user.getPetName().equals(nombreMascota) && user.isActive) {
                estaRegistrado = true;
                break;
            }
        }
        
        if (estaRegistrado) {
        	System.out.println("Welcome "+nombreMascota);
            System.out.println("INFO: You are able to use this service. Pet found and active");
        } else {
            System.out.println("INFO: You are unable to use this service. Pet not found or is not active");
            throw new RuntimeException("Pet not found. Appointment cannot be made.");
        }
    }
    
    after(): verifyAssurance() {
        System.out.println("INFO: ASSURANCE VERIFICATION COMPLETE");
    }
}
