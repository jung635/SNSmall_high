package web.vendor.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayCancelPointAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int payNum = Integer.parseInt(request.getParameter("num"));
		String merchant_uid = request.getParameter("merchant_uid");
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		int price = 0;
		List<PaymentBean> pb_all_list = pdao.getPayment(merchant_uid);
		PaymentBean pb_all = null;
		for(int i=0; i<pb_all_list.size(); i++){
			pb_all = pb_all_list.get(i);
			ProductBean prob = prodao.getProduct(pb_all.getProduct_num());
			price += prob.getPrice()*pb_all.getAmount();
		}
		PaymentBean pb = pdao.getPaymentByNum(payNum);
		ProductBean prob = prodao.getProduct(pb.getProduct_num());
		int cancel_price = prob.getPrice()*pb.getAmount();
		int cancel_point = (int)(((double)cancel_price/(double)price)*pb.getUsedPoint());
		pdao.subSnsPay(prob.getPrice(), pb.getSns_id());
		pdao.subVendorProfit(prob.getPrice(), pb.getVendor_id());
		pdao.subAmount(pb.getAmount(), pb.getProduct_num());
		pdao.deletePay(payNum);
		pdao.addPoint(cancel_point, pb.getClient_id());
		out.println("<script>");
		out.println("alert('취소가 완료되었습니다.');");
		out.println("location.href='CancelList.ve';");
		out.println("</script>");
		
		return null;
	}

}
