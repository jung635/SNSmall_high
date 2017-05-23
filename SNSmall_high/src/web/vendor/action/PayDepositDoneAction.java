package web.vendor.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
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
		PaymentBean pb_sns = null;
		ProductBean prob_sns = null;
		SnsBean sb_sns = null;
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		long all_sns_sell = 0L;
		List<PaymentBean> list_pb = new ArrayList<>();
		List<PaymentBean> list_sns = new ArrayList<>();
		
		pdao.depositPay(num);
		double price_result = (double)prob.getPrice()*(double)pb.getAmount();
		
		SnsBean sb = sdao.getSnsDetail(pb.getSns_id());
		System.out.println(sb.getRank());
		if(sb.getRank().equals("basic")){
			sns_profit = (int)(price_result*0.05)/10*10;
		}else if(sb.getRank().equals("plus")){
			sns_profit = (int)(price_result*0.1)/10*10;
		}else{
			sns_profit = (int)(price_result*0.2/10*10);
		}
		System.out.println("sns_profit"+sns_profit);
		add_point = (int)(price_result*0.01)/10*10;
		company_profit = (int)(price_result*0.1)/100*100;
		vendor_profit = ((prob.getPrice()*pb.getAmount())-company_profit-sns_profit);
		System.out.println("vendor_profit: "+vendor_profit);
		System.out.println("company_profit: "+company_profit);
		System.out.println("add_point:" + add_point);
		pdao.addSnsPay(sns_profit, pb.getAmount(), pb.getSns_id());
		pdao.addVendorProfit(vendor_profit, pb.getVendor_id());
		pdao.addPoint(add_point, id);
		pdao.addCount(pb.getAmount(), pb.getProduct_num());
		
		//rank update 확인
		list_sns = pdao.getSnsPaymentList(pb.getSns_id());
		System.out.println("size:"+list_sns.size());
		for(int j=0; j<list_sns.size(); j++){
			pb_sns = list_sns.get(j);
			prob_sns = prodao.getProduct(pb_sns.getProduct_num());
			System.out.println("product_num:"+pb_sns.getProduct_num());
			System.out.println("price:"+prob_sns.getPrice());
			all_sns_sell += (long)prob_sns.getPrice()*(long)pb_sns.getAmount();
		}
		System.out.println(all_sns_sell);
		sb_sns= sdao.getSnsDetail(pb.getSns_id());
		
		
		//pdao.rankUpdate(pb.getSns_id(), all_sns_sell+Math.round(price_result), sb_sns.getRank());
		long money = all_sns_sell+Math.round(price_result);
		AlarmBean ab = new AlarmBean();
		AlarmDAO adao = new AlarmDAO();
		if( sb_sns.getRank().equals("basic")){
			if(money>=10000000){
				ab.setContent("등급이  premium으로 상승하셨습니다!");
				ab.setId(pb.getSns_id());
				ab.setMove("RankUp.al?rank="+"premium");
				adao.insertAlarm(ab);
				pdao.rankUpdate(pb.getSns_id(), "premium");
			}else if(money>=90000){//테스트용
			//}else if(money>=500000){
				ab.setContent("등급이 plsu로 상승하셨습니다!");
				ab.setId(pb.getSns_id());
				ab.setMove("RankUp.al?rank="+"plus");
				adao.insertAlarm(ab);
				pdao.rankUpdate(pb.getSns_id(), "plus");
			}
		}else if( sb_sns.getRank().equals("plus")){
			if(money>=10000000){
				ab.setContent("등급이  premium으로 상승하셨습니다!");
				ab.setId(pb.getSns_id());
				ab.setMove("RankUp.al?rank="+"premium");
				adao.insertAlarm(ab);
				pdao.rankUpdate(pb.getSns_id(), "premium");
			}
		}
		
	
		
		
		
		out.println("<script>");
		out.println("alert('주문이 완료 되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		
		return null;
	}
	
	

}
