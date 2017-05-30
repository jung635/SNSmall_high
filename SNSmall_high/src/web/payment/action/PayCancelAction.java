package web.payment.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int payNum = Integer.parseInt(request.getParameter("num"));
		String order_num = request.getParameter("merchant_uid");
		System.out.println(order_num);
		PaymentDAO pdao = new PaymentDAO();
		PaymentBean pb = pdao.getPaymentByNum(payNum);
		ActionForward forward = new ActionForward();
		int cancel_point = pb.getUsedPoint();
		List<Integer> cancel_num = new ArrayList<>();
		cancel_num.add(pb.getNum());
		List<PaymentBean> pb_list = pdao.getPayment(order_num);

		request.setAttribute("cancel_num", cancel_num);
		request.setAttribute("cancel_point", cancel_point);
		request.setAttribute("pb_list", pb_list);
		request.setAttribute("price", pb.getPay_price());
		request.setAttribute("usedPoint", pb.getUsedPoint());
		forward.setPath("./pay/payCancel.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
