package web.payment.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayMultipleCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PaymentDAO pdao = new PaymentDAO();
		String order_num = request.getParameter("order_num");
		List<PaymentBean> pb_list = pdao.getPayment(order_num);
		PaymentBean pb = null;
		int cancel_point = 0;
		int price = 0;
		int usedPoint = 0;
		List<Integer> cancel_num = new ArrayList<>();
		ActionForward forward = new ActionForward();

		for (int i = 0; i < pb_list.size(); i++) {
			pb = pb_list.get(i);
			price += pb.getPay_price();
			usedPoint += pb.getUsedPoint();
			
			if (pb.getState().equals("cancel") || pb.getState().equals("cancelHold")
					|| pb.getState().equals("w_cancelHold")) {
			} else {
				cancel_num.add(pb.getProduct_num());
				cancel_point += pb.getUsedPoint();
			}
		}

		request.setAttribute("pb_list", pb_list);
		request.setAttribute("cancel_num", cancel_num);
		request.setAttribute("cancel_point", cancel_point);
		request.setAttribute("price", price);
		request.setAttribute("usedPoint", usedPoint);
		forward.setPath("./pay/payCancel.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
