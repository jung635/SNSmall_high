package web.vendor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

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
		SnsDAO sdao = new SnsDAO();
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		
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
		

		//sns profit 빼기
		pdao.subSnsPay(sns_profit, pb.getSns_id());
		
		pdao.subVendorProfit(vendor_profit, pb.getVendor_id());
		pdao.subAmount(pb.getAmount(), pb.getProduct_num());
		pdao.deletePay(payNum);
		pdao.addPoint(pb.getUsedPoint(), pb.getClient_id());
		pdao.subPoint(add_point, pb.getClient_id());
		
		out.println("<script>");
		out.println("alert('취소가 완료되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		return null;
	}

}
