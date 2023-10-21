
public aspect CheckAssurance {
	pointcut verifyAssurance():execution(void main.PetStore.makeAppointment(..));
	
	before():verifyAssurance(){
		System.out.println("INFO: VERIFYING ASSURANCE");
	}
	after():verifyAssurance(){
		System.out.println("INFO: ASSURANCE VERIFICATION COMPLETE");
	}

}
