package svc;

import javax.servlet.http.HttpServletRequest;

import structure.Operation;
import vo.ActionForward;

public interface MachineAction {
	public ActionForward execute(HttpServletRequest request,String old, int count, int value, Operation op,String memory) throws Exception;
}
