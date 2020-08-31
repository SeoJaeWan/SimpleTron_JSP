package structure;

public class OpCode {
	
	private int operationCode;
	private int operand;
	
	public OpCode() {
		operationCode = 00;
		operand = 00;
	}
	
	public int getOperationCode() {
		return operationCode;
	}
	public void setOperationCode(int operationCode) {
		this.operationCode = operationCode;
	}
	public int getOperand() {
		return operand;
	}
	public void setOperand(int operand) {
		this.operand = operand;
	}

	public String printOperand() {
		String data = operand + "";
		
		if(data.length() < 2);
			for(int i = 0; i < 2 - data.length(); i++) {
				data = 0+data;
			}
			
		return  data;
	}
	
	public String printOc() {
		String data = operationCode + "";
		
		if(data.length() < 2);
			for(int i = 0; i < 2 - data.length(); i++) {
				data = 0+data;
			}
			
		return  data;
	}
}
