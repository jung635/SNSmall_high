package web.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentDAO;

public class PayDeliveryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String num = request.getParameter("num");
		
		PaymentDAO pdao = new PaymentDAO();
		pdao.PayDeliveryAction(num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("PayList.pa");
		forward.setRedirect(true);
		return forward;
	}

}
