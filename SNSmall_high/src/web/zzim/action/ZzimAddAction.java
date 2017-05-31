package web.zzim.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.zzim.db.ZzimBean;
import web.zzim.db.ZzimDAO;

public class ZzimAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
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
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int price = Integer.parseInt(request.getParameter("price"));
		String subject = request.getParameter("subject");
		ZzimBean zb = new ZzimBean();
		zb.setProduct_num(product_num);
		zb.setPrice(price);
		zb.setSubject(subject);
		zb.setClient_id(client_id);
		ZzimDAO zdao = new ZzimDAO();
		zdao.ZzimAddAction(zb);
		
		forward.setPath("./ZzimList.zz");
		forward.setRedirect(true);
		
		return forward;
	}

}
