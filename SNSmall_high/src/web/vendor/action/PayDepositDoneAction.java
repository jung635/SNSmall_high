package web.vendor.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayDepositDoneAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		PaymentBean pb = pdao.getPaymentByNum(num);
		
		pdao.depositPay(num);
		pdao.subPoint(pb.getUsedPoint(), pb.getClient_id());
		ProductBean prob = prodao.getProduct(pb.getProduct_num());
		pdao.addSnsPay((int)((double)prob.getPrice()*((double)pb.getAmount()+0.01)), pb.getSns_id());
		pdao.addVendorProfit((int)((double)prob.getPrice()*((double)pb.getAmount()+0.01)), pb.getVendor_id());
		pdao.subAmount(pb.getAmount(), pb.getProduct_num());
		pdao.addPoint((int)(prob.getPrice()*0.01), pb.getClient_id());
		
		ActionForward forward = new ActionForward();
		forward.setPath("DepositList.ve");
		forward.setRedirect(false);
		return forward;
	}
	

}
