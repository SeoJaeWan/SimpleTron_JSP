package action;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonBuilderFactory;
import javax.json.JsonObjectBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;

 public class Machine implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward= new ActionForward();
		
		int[] memoryData = new int[100];
		
	    Map<String,String> m = new HashMap<>(); 
	    JsonBuilderFactory factory = Json.createBuilderFactory(m);
	    
	    JsonObjectBuilder ob_1 = factory.createObjectBuilder();
        
        ob_1.add("memory", Arrays.toString(memoryData));
        ob_1.add("text", " ");
        ob_1.add("count", 0);
        
        String jsonStr = ob_1.build().toString();
        
		request.setAttribute("jsonStr",jsonStr);
   		forward.setPath("/board/machine.jsp");
   		return forward;
   		
	 }
	 
 }