package svc;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.http.HttpServletRequest;

import structure.Operation;
import vo.ActionForward;

public class MachineInputService implements MachineAction {
	public ActionForward execute(HttpServletRequest request, String text, int count, int value, Operation op,String memory) throws Exception {
		ActionForward forward = new ActionForward();
		
		Map<String,String> m = new HashMap<>(); 
	    JsonBuilderFactory factory = Json.createBuilderFactory(m);
	    JsonObjectBuilder ob_1 = factory.createObjectBuilder();
	
		if(!(value ==-99999 || value < -9999 || value > 9999)) {
		
			String t = memory.substring(1,memory.length()-1);
			System.out.println(t);
			String[] memoryArr =  t.split(", ");
			
			System.out.println(Arrays.toString(memoryArr));
			
			int[] memoryInt = new int[100];
			
			System.out.println(Arrays.toString(memoryArr));
			
			for(int i = 0; i < memoryArr.length; i++){
				memoryInt[i] = Integer.parseInt(memoryArr[i]);
	    	}
			
			memoryInt[count] = value;
			
			ob_1.add("memory", Arrays.toString(memoryInt));
	        ob_1.add("text", text  + "\r\n"+ op.outputForm(count++) + op.addForm(value));
	        ob_1.add("count", count);
						
		}else {
			ob_1.add("memory", memory);
	        ob_1.add("text", text  + "\r\n"+ op.outputForm(count++) + value + op.inputEnd);
	        ob_1.add("count", -count);
		}
		
		String jsonStr = ob_1.build().toString();
		request.setAttribute("jsonStr",jsonStr);
		forward.setPath("/board/machine.jsp");
		return forward;
	}		
}