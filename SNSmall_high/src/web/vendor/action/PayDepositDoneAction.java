package web.vendor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class PayDepositDoneAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		PaymentBean pb = pdao.getPaymentByNum(num);
		SnsDAO sdao = new SnsDAO();
		ProductBean prob = prodao.getProduct(pb.getProduct_num());
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		
		pdao.depositPay(num);
		
		SnsBean sb = sdao.getSnsDetail(pb.getSns_id());
		System.out.println(sb.getRank());
		if(sb.getRank().equals("basic")){
			sns_profit = (int)((double)prob.getPrice()*(double)pb.getAmount()*0.05);
		}else if(sb.getRank().equals("plus")){
			sns_profit = (int)((double)prob.getPrice()*(double)pb.getAmount()*0.1);
		}else{
			sns_profit = (int)((double)prob.getPrice()*(double)pb.getAmount()*0.2);
		}
		System.out.println("sns_profit"+sns_profit);
		add_point = (int)((double)prob.getPrice()*(double)(pb.getAmount()*0.01));
		company_profit = (int)((double)prob.getPrice()*(double)(pb.getAmount()*0.1));
		vendor_profit = (prob.getPrice()*pb.getAmount())-company_profit-sns_profit;
		System.out.println("vendor_profit: "+vendor_profit);
		System.out.println("company_profit: "+company_profit);
		System.out.println("add_point:" + add_point);
		pdao.addSnsPay(sns_profit, pb.getSns_id());
		pdao.addVendorProfit(vendor_profit, pb.getVendor_id());
		pdao.addPoint(add_point, id);
		pdao.subAmount(pb.getAmount(), pb.getProduct_num());
		out.println("<script>");
		out.println("alert('주문이 완료 되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		
		return null;
	}
	
	

}
