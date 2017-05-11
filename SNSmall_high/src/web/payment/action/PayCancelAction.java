package web.payment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		int payNum = Integer.parseInt(request.getParameter("num"));
		PaymentDAO pdao = new PaymentDAO();
		PaymentBean pb = pdao.getPaymentByNum(payNum);
		ProductDAO prodao = new ProductDAO();
		ProductBean prob = prodao.getProduct(pb.getProduct_num());
		if (pb.getState().equals("cancel")) {
			out.println("<script>");
			out.println("alert('이미 취소 신청하신 상품입니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			if (pb.getUsedPoint() > 0) {
				out.println("<script>");
				out.println("alert('포인트를 사용한 배송은 해당 상품 퍼센트에 해당하는 포인트만 돌려받을 수 있습니다.');");
				out.println("location.href='PayPointCancel.pa?merchant_uid=" + pb.getOrder_num() + "&num="+pb.getProduct_num()+"';");
				out.println("</script>");
			} else {
				pdao.deletePayRequest(pb.getNum());
				out.println("<script>");
				out.println("alert('취소 신청이 완료되었습니다.');");
				out.println("location.href='PayList.pa';");
				out.println("</script>");
			}
		}

		return null;
	}

}
