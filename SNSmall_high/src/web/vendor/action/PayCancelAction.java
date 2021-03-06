package web.vendor.action;

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

		pdao.subSnsPay(prob.getPrice(), pb.getSns_id());
		pdao.subVendorProfit(prob.getPrice(), pb.getVendor_id());
		pdao.subAmount(pb.getAmount(), pb.getProduct_num());
		pdao.deletePay(payNum);
		pdao.addPoint(pb.getUsedPoint(), pb.getClient_id());
		out.println("<script>");
		out.println("alert('취소가 완료되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		return null;
	}

}
