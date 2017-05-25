package web.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO pdao = new ProductDAO();
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./mypage/payDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
