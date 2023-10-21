import java.util.Scanner;
import main.User;
public aspect CheckAssurance {
	pointcut verifyAssurance():execution(void main.PetStore.makeAppointment(..));
	before():verifyAssurance(){
		System.out.println("INFO: Verifying assurance\nName of your pet:");
		Scanner input = new Scanner(System.in);
		String ingresado = input.nextLine();
		boolean existe=false;
		for (User user: main.PetStore.users) {
			if (user.getPetName().equals(ingresado) && user.isActive) {
				existe=true;
				break;
			}
		}
		if (existe) {
			System.out.println("INFO: Welcome "+ingresado+". You can use this service!");
		} else {
			System.out.println("INFO: You can't use this service!, either assurance is not active or pet does not exist");
			throw new RuntimeException();
		}
	}
	after():verifyAssurance(){
		System.out.println("INFO: Assurance Verification Complete!");
	}
}
