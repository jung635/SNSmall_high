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
		PaymentBean pb = pdao.getPaymentByNum(num);
		SnsDAO sdao = new SnsDAO();
		AlarmBean ab = new AlarmBean();
		AlarmDAO adao = new AlarmDAO();
		PaymentBean pb_sns = null;
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		long all_sns_sell = 0L;
		List<PaymentBean> list_sns = new ArrayList<>();
		
		pdao.depositPay(num);
		
		SnsBean sb = sdao.getSnsDetail(pb.getSns_id());
		if(sb != null){
			//rank update 확인
			list_sns = pdao.getSnsPaymentList(pb.getSns_id());
			for(int j=0; j<list_sns.size(); j++){
				pb_sns = list_sns.get(j);
				if(pb_sns.getState().equals("payDone") || pb_sns.getState().equals("done") || pb_sns.getState().equals("delivery")){
					all_sns_sell += pb_sns.getPay_price();
					System.out.println(all_sns_sell);
				}
			}
			
			long money = all_sns_sell;
				if( sb.getRank().equals("basic")){
					if(money>=10000000){
						ab.setContent("등급이  premium으로 상승하셨습니다!");
						ab.setId(pb.getSns_id());
						ab.setMove("RankUp.al?rank="+"premium");
						adao.insertAlarm(ab);
						pdao.rankUpdate(pb.getSns_id(), "premium");
					}else if(money>=5000000){
						ab.setContent("등급이 plsu로 상승하셨습니다!");
						ab.setId(pb.getSns_id());
						ab.setMove("RankUp.al?rank="+"plus");
						adao.insertAlarm(ab);
						pdao.rankUpdate(pb.getSns_id(), "plus");
					}
				}else if( sb.getRank().equals("plus")){
					if(money>=10000000){
						ab.setContent("등급이  premium으로 상승하셨습니다!");
						ab.setId(pb.getSns_id());
						ab.setMove("RankUp.al?rank="+"premium");
						adao.insertAlarm(ab);
						pdao.rankUpdate(pb.getSns_id(), "premium");
					}
				}
			if(sb.getRank().equals("basic")){
				sns_profit = (int)(pb.getPay_price()*0.05)/10*10;
				
			}else if(sb.getRank().equals("plus")){
				sns_profit = (int)(pb.getPay_price()*0.1)/10*10;
			}else{
				sns_profit = (int)(pb.getPay_price()*0.2)/10*10;
			}
		}
		add_point = (int)(pb.getPay_price()*0.01)/10*10;
		company_profit = (int)(pb.getPay_price()*0.1)/10*10;
		vendor_profit = pb.getPay_price()-company_profit-sns_profit;
		pdao.addSnsPay(sns_profit, pb.getAmount(), pb.getSns_id());
		pdao.addVendorProfit(vendor_profit, pb.getVendor_id());
		pdao.addPoint(add_point, pb.getClient_id());
		pdao.addCount(pb.getAmount(), pb.getProduct_num());
		
		
		out.println("<script>");
		out.println("alert('주문이 완료 되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		
		return null;
	}
	
	

}
