package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;
import structure.Operation;
import svc.MachineInputService;

import org.codehaus.jettison.json.JSONObject;

 public class MachineProAction implements Action {
	
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		Operation op = new Operation();
		ActionForward forward= new ActionForward();
		String text = "";
		try {
		String jsonStr = request.getParameter("jsonStr");
		String rowValue = request.getParameter("code");
		
		JSONObject js = new JSONObject(jsonStr);
		
		String memory = js.getString("memory");
		text = js.getString("text");
		int count = js.getInt("count");

		int value = 0;
		
		if(!rowValue.equals("")){
			value = Integer.parseInt(rowValue);
		}
		
		forward = new MachineInputService().execute(request, text, count, value, op,memory);
		return forward;
		
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("text",text + "\r\n *** Simpletron execution abnomally terminated ***");
		
	 		forward.setPath("/board/machineEnd.jsp");
	   		return forward;
		}
	 }
	 
 }
 
 