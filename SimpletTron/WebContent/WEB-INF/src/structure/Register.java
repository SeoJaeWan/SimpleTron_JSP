package structure;

public class Register {

	private int accumulator;
	private int instructionRegister;
	
	public Register(){
		accumulator = 0000;
		instructionRegister = 0000;
	}
	
	public int getAccumulator() {
		return accumulator;
	}

	public void setAccumulator(int accumulator) {
		this.accumulator = accumulator;
	}
	
	public void addAcc(int data) {
		accumulator+= data;
		
		if(accumulator > 9999 || accumulator < -9999) {
			System.out.println( "*** Attempt to wrong OverFlow ***\r\n" + 
								"*** Simpletron execution abnomally terminated ***");
			System.exit(0);
		}
	}
	
	public void subAcc(int data) {
		accumulator-= data;
		
		if(accumulator < -9999) {
			System.out.println( "*** Attempt to wrong OverFlow ***\r\n" + 
								"*** Simpletron execution abnomally terminated ***");
			System.exit(0);
		}
	}
	
	public void divAcc(int data) {
		if(data != 0)
			accumulator/= data;
		else {
			System.out.println( "*** Attempt to divide by zero ***\r\n" + 
								"*** Simpletron execution abnomally terminated ***");
			System.exit(0);
		}
	}
	public void multAcc(int data) {
		accumulator*= data;
		
		if(accumulator < -9999 || accumulator < -9999) {
			System.out.println( "*** Attempt to wrong OverFlow ***\r\n" + 
								"*** Simpletron execution abnomally terminated ***");
			System.exit(0);
		}
	}

	public int getInstructionRegister() {
		return instructionRegister;
	}

	public void setInstructionRegister(int instructionRegister) {
		this.instructionRegister = instructionRegister;
	}
	
	public String printIR() {
		String data;
		
		if(instructionRegister > 0)
			data = instructionRegister + "";
		else 
			data = instructionRegister*-1 + "";
		int count;
		
		if(data.length() < 4);
			count = 4-data.length();
		
			for(int i = 0; i < count; i++) {

				data = 0+data;
			}
			
		return  data;
	}
	
	public String printAcc() {
		String data = accumulator + "";
		int count;
		
		if(data.length() < 4);
			count = 4-data.length();
		
			for(int i = 0; i < count; i++) {

				data = 0+data;
			}
			
		return  data;
	}
}
