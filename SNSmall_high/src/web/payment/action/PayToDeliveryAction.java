package web.payment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentDAO;

public class PayToDeliveryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String num = request.getParameter("num");
		
		PaymentDAO pdao = new PaymentDAO();
		pdao.PayTodeliveryAction(num);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('배송하였습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("PayList.pa");
		forward.setRedirect(true);
		return forward;
	}
	

}
