package web.client.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientBean;
import web.client.db.ClientDAO;

public class clientUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		ClientDAO cldao = new ClientDAO();
		response.setContentType("text/html; charset=UTF-8");
		
		ClientBean clb = new ClientBean();
		clb.setClient_id(id);
		clb.setPass(request.getParameter("pass"));
		clb.setName(request.getParameter("name"));
		clb.setPhone(request.getParameter("phone"));
		String addre = request.getParameter("postcode")+"/"+request.getParameter("address")+"/"+request.getParameter("address2");
		clb.setAddress(addre);
		cldao.updateClient(clb);
		
		HttpSession session = request.getSession();
		session.setAttribute("name", clb.getName());
		
		ActionForward forward = new ActionForward();
		forward.setPath("./clientView.cl");
		forward.setRedirect(true);
		return forward;
	}
		
}
