package structure;

public class Operation {

	public Memory memory;
	public OpCode opCode;
	private Register register;
	
	public String inputEnd = "\r\n*** Program loading completed *** \r\n"+ 
						      "*** Program execution begins ***";
	
	public String inputError =  "*** Attempt to wrong OPCode ***\r\n" + 
								 "*** Simpletron execution abnomally terminated ***";
	
	public Operation() {
		memory = new Memory();
		opCode = new OpCode();
		register = new Register();
	}
	
	public void loadMemory(int[] value) { 
		
		memory.overMemory(value);
	}
	
	/*
	 * public int CheckMemory() { for(int i = 0; i< 100; i++) {
	 * 
	 * try { int code = Integer.parseInt(memory.getMemoryData(i));
	 * 
	 * if(code > 9999 || code < -9999) { System.out.println(code); return -1; }
	 * }catch (Exception e) { if(memory.getMemoryData(i) == null) return 1; return
	 * -1; } } return 1; }
	 */
	
	public String workThrough() {
		register.setInstructionRegister(memory.getMemoryData(memory.getInstructionCounter()));
		return extractCode(register.getInstructionRegister());
	}
	
	private String extractCode(int code) {
		opCode.setOperand(code%100);
		opCode.setOperationCode(code/100);
		return readCode();
	}
	
	private String readCode() {
		switch(opCode.getOperationCode()) {
		case 10:
			return "Read";
			
		case 11:
			return "Write";
			
		case 20:
			register.setAccumulator(memory.getMemoryData(opCode.getOperand()));
			break;
		case 21:
			memory.setMemoryData(register.getAccumulator(),opCode.getOperand());
			break;
			
		case 30:
			register.addAcc(memory.getMemoryData(opCode.getOperand()));
			break;
		
		case 31:
			register.subAcc(memory.getMemoryData(opCode.getOperand()));
			break;	
			
		case 32:
			register.divAcc(memory.getMemoryData(opCode.getOperand()));
			break;
			
		case 33:
			register.multAcc(memory.getMemoryData(opCode.getOperand()));
			break;
			
		case 40:
			memory.setInstructionCounter(opCode.getOperand());
			break;
			
		case 41:
			if(register.getAccumulator() < 0)
				memory.setInstructionCounter(opCode.getOperand());
			else
				memory.nextInstruction();
			break;
				
		case 42:
			if(register.getAccumulator() == 0) 
				memory.setInstructionCounter(opCode.getOperand());
			else
				memory.nextInstruction();
			break;
				
		case 43:
			return "End";
		
		default:
			return "Error";
		}
		if(opCode.getOperationCode() < 40) {
			memory.nextInstruction();
		}

		return "Pass";
	}
	
	public void Read(int data) {
		if(data > 100 || data < -99) {
			System.out.println( "*** Attempt to wrong Input Value ***\r\n" + 
					"*** Simpletron execution abnomally terminated ***");
			System.exit(0);
		}
		memory.setMemoryData(data, opCode.getOperand());
		memory.nextInstruction();
	}
	
	public int Write() {
		memory.nextInstruction();
		return memory.getMemoryData(opCode.getOperand());
	}
	
	public String printDump() {
		String form;
		String memoryForm = new String(String.format("%10d %7d %7d %7d %7d %7d %7d %7d %7d %7d\n 0", 0,1,2,3,4,5,6,7,8,9));
		
		form = String.format(
				      "REGISTERS : \n"
					+ "accumulator           +%s\n"
					+ "instructionCounter      +%s\n"
					+ "instructionRegister   +%s\n"
					+ "operationCode           +%s\n"
					+ "operand                 +%s\n\n"
					+ "MEMORY : \n", register.printAcc(), memory.printIC(), register.printIR(), opCode.printOc(), opCode.printOperand());
		
		for(int i = 0; i < 100; i++) {
			
			int data = memory.getMemoryData(i);
			
			if(i != 0&&i % 10 == 0) {
				memoryForm += "\n" +i;
			}
			
			if(data != 0)
				memoryForm += String.format("   %s", addData(data));
			else
				memoryForm += String.format("   +0000");
		}
		
		form += memoryForm;
		
		return form;
	}
	
	public String outputForm(int memoryLength) {
		String form;
		
		if(memoryLength <10)
			form = "0" + memoryLength + " ? ";
		else {
			form = memoryLength+" ? ";
		}
		
		return form;
	}
	
	private String addData(int data) {
		String dataForm ="";
		
		if( data >= 0) 
			dataForm = "+";
		else {
			dataForm = "-";
			data *= -1;
		}
		if(data / 10 == 0) 
			dataForm += "000";
		else if(data / 100 == 0) 
			dataForm += "00";
		else if(data / 1000 == 0) 
			dataForm += "0";
		else
			return dataForm + data + "";
		
		
		return dataForm + data;
	}
	public String addForm(int data) {
		String dataForm ="";
		

		if(data / 10 == 0) 
			dataForm += "000";
		else if(data / 100 == 0) 
			dataForm += "00";
		else if(data / 1000 == 0) 
			dataForm += "0";
		else
			return dataForm + data + "";
		
		
		return dataForm + data;
	}
}
