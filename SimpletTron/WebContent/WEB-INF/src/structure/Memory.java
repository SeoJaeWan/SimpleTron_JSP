package structure;

public class Memory {

	private int[] memoryData = new int[100];
	private int instructionCounter;
	
	public Memory() {
		instructionCounter = 0;
	}
	
	public int getMemoryData(int position) {
		return memoryData[position];
	}
	
	public void setMemoryData(int data, int position) {
		memoryData[position] = data;

	}
	
	public void overMemory(int[] data) {
		memoryData = data;
	}
	
	public int[] getMemory() {
		return memoryData;
	}
	
	public int getInstructionCounter() {
		return instructionCounter;
	}
	public void setInstructionCounter(int instructionCounter) {

		this.instructionCounter = instructionCounter;

	}
	
	public void nextInstruction() {
		this.instructionCounter++;
	}
	public String printIC() {
		String data = instructionCounter + "";
		
		if(data.length() < 2);
			for(int i = 0; i < 2 - data.length(); i++) {
				data = 0+data;
			}
			
		return  data;
	}
	
}
