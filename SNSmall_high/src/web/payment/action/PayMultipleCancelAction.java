package web.payment.action;

import java.io.PrintWriter;
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		PaymentDAO pdao = new PaymentDAO();
		String order_num = request.getParameter("order_num");
		List<PaymentBean> pb_list = pdao.getPayment(order_num);
		PaymentBean pb = null;
		boolean isCancel = false;
		boolean isPointUsed = false;
		int cancel_point=0;
		int price = 0;
		int usedPoint = 0;
		List<Integer> cancel_num = new ArrayList<>();
		ProductDAO prodao = new ProductDAO();
		ActionForward forward = new ActionForward();

		for (int i = 0; i < pb_list.size(); i++) {
			pb = pb_list.get(i);
			ProductBean prob = prodao.getProduct(pb.getProduct_num());
			price += prob.getPrice()*pb.getAmount();
			usedPoint += pb.getUsedPoint();
			System.out.println(pb.getState());
			if (pb.getState().equals("cancel")||pb.getState().equals("cancelHold")||pb.getState().equals("w_cancelHold")) {
				isCancel = true;
			}else{
				cancel_num.add(pb.getProduct_num());
				cancel_point += pb.getUsedPoint();
			}

			if (pb.getUsedPoint() > 0) {
				isPointUsed = true;
			}
		}
		
		if (isCancel) {
			System.out.println("test");
			out.println("<script>");
			out.println("alert('이미 취소신청을 하거나 취소된 상품은 취소신청이 불가능 합니다.');");
			if (cancel_num.size() == pb_list.size()) {
				out.println("history.back();");
			}
			out.println("</script>");
		}

		if (isPointUsed) {
			out.println("<script>");
			out.println("alert('포인트를 사용한 배송은 해당 상품 퍼센트에 해당하는 포인트만 돌려받을 수 있습니다.');");
			out.println("</script>");
			forward.setPath("./pay/payCancel.jsp");
			request.setAttribute("pb_list", pb_list);
			request.setAttribute("cancel_num", cancel_num);
			request.setAttribute("cancel_point", cancel_point);
			request.setAttribute("price", price);
			request.setAttribute("usedPoint", usedPoint);
			
			forward.setPath("./pay/payCancel.jsp");
			forward.setRedirect(false);
			/*out.println("location.href='PayPointCancel.pa?merchant_uid=" + pb.getOrder_num() + "&num="
					+ pb.getProduct_num() + "';");*/
			
		}else{
			for (int i = 0; i < pb_list.size(); i++) {
				pb = pb_list.get(i);
				if (pb.getState().equals("waiting")) {
					pdao.deletePayRequestWaiting(pb.getNum());
				} else if (pb.getState().equals("cancel")) {

				} else {
					pdao.deletePayRequest(pb.getNum());
				}
			}

			out.println("<script>");
			out.println("alert('취소 신청이 완료되었습니다.');");
			//out.println("location.href='PayList.pa';");
			out.println("</script>");
			forward.setPath("PayList.pa");
			forward.setRedirect(true);
		}

		return forward;
	}

}
