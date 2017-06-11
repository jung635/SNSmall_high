package web.cart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.cart.db.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String client_id = (String)session.getAttribute("id");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(client_id==null){
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		CartDAO cdao = new CartDAO();
		cdao.cartDelete(client_id, num);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./CartList.ca");
		
		return forward;
	}

}
