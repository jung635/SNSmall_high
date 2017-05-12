package web.client.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientBean;
import web.client.db.ClientDAO;

public class clientView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ClientDAO cldao = new ClientDAO();
		ClientBean clb = cldao.getMember(id);
		String postcode = clb.getAddress().split("/")[0];
		System.out.println(postcode);
		String address = clb.getAddress().split("/")[1];
		System.out.println(address);
		String address2 = clb.getAddress().split("/")[2];
		System.out.println(address2);
		
		request.setAttribute("postcode", postcode);
		request.setAttribute("address", address);
		request.setAttribute("address2", address2);
		request.setAttribute("clb", clb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/client/clientView.jsp");
		forward.setRedirect(false);			
		return forward;
	}
}