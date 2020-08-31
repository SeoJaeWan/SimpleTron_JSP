package action;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONObject;

import structure.Operation;
import vo.ActionForward;


 public class MachineResultAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward= new ActionForward();
		Operation operation =new Operation();
		try {
			String jsonStr = request.getParameter("jsonStr");

			JSONObject js = new JSONObject(jsonStr);
			
			Map<String,String> m = new HashMap<>(); 
			JsonBuilderFactory factory = Json.createBuilderFactory(m);
			JsonObjectBuilder ob_1 = factory.createObjectBuilder();
			
			String memory = js.getString("memory");
			String text = js.getString("text");
			int count = js.getInt("count");
			String[] memoryValue = memory.substring(1, memory.length()-1).split(", ");
			
			int[] intMemory = new int[100];

	    	for(int i = 0; i < memoryValue.length; i++){
	    		intMemory[i] = Integer.parseInt(memoryValue[i]);
	    	}
	    	
	    	operation.loadMemory(intMemory);
	    	
	    	if(count == -200){
	    	   int value = Integer.parseInt(request.getParameter("code"));
			   int next = js.getInt("next");
			   int oper = js.getInt("oper");
    		   operation.memory.setInstructionCounter(next);
    		   operation.opCode.setOperand(oper);
	     	   operation.Read(value); 
	    	 }
			
	    	
	    	
	    	for(int i = 0; i< 100; i++) {
	    		if(operation.workThrough().equals("Read")) {
	    			ob_1.add("memory", Arrays.toString(operation.memory.getMemory()));
	    	    	ob_1.add("count", -200);
	    	    	ob_1.add("text", text);
	    	    	ob_1.add("next",operation.memory.getInstructionCounter());
	    	       	ob_1.add("oper",operation.opCode.getOperand());
	    	       	
	    	       	jsonStr = ob_1.build().toString();
	    	       	request.setAttribute("jsonStr", jsonStr);
	    	       	
	    	       	forward.setPath("/board/machine.jsp");
	    	   		return forward;
	    		}else if(operation.workThrough().equals("Write")){
	    			text = text + "\r\n\nResult : " + operation.Write() + "\r\n\n";
	    		}else if(operation.workThrough().equals("End")){
	    			request.setAttribute("text", text + operation.printDump());
	    			request.setAttribute("value", text);
	    			forward.setPath("/board/machineEnd.jsp");
	    			return forward;
	    		}else if(operation.workThrough().equals("Error")){
	    			request.setAttribute("text", text + operation.printDump()+ "\r\n" + operation.inputError);
	    			request.setAttribute("value", text);
	    			System.out.println(text);
	    			forward.setPath("/board/machineEnd.jsp");
	    			return forward;
	    		}
	    	}
			
			
	 		forward.setPath("/board/machine.jsp");
	   		return forward;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			request.setAttribute("old",request.getParameter("old") + "\r\n *** Simpletron execution abnomally terminated ***");
		
	 		forward.setPath("/board/machineEnd.jsp");
	   		return forward;
		}
	 }
	 
 }