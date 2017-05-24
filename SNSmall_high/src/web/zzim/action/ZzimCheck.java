package web.zzim.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ZzimCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int product_num = Integer.parseInt((String)request.getAttribute("product_num"));
		
		
		return null;
	}
	

}
