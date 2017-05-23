package web.payment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;

public class PayCancelPointAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		int payNum = Integer.parseInt(request.getParameter("num"));
		PaymentDAO pdao = new PaymentDAO();
		PaymentBean pb = pdao.getPaymentByNum(payNum);
		
		if(pb.getState().equals("waiting")){
			pdao.deletePayRequestWaiting(pb.getNum());
		}else{
			pdao.deletePayRequest(pb.getNum());
		}
		out.println("<script>");
		out.println("alert('취소 신청이 완료되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		
		return null;
	}
	
}
