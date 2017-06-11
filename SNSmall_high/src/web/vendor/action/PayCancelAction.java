package web.vendor.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
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
		SnsDAO sdao = new SnsDAO();
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		PaymentBean pb_sns = null;
		long all_sns_sell = 0L;
		List<PaymentBean> list_sns = new ArrayList<>();
		pdao.deletePay(payNum);
		AlarmBean ab = new AlarmBean();
		AlarmDAO adao = new AlarmDAO();
		
		if(pb.getState().equals("w_cancelHold")){
			ab.setContent("결제 취소가 완료되었습니다.");
			ab.setId(pb.getClient_id());
			ab.setMove("PayList.pa");
			adao.insertAlarm(ab);
			pdao.addPoint(pb.getUsedPoint(), pb.getClient_id());
			pdao.addAmount(pb.getAmount(), pb.getProduct_num());
		}else{
			
			SnsBean sb = sdao.getSnsDetail(pb.getSns_id());
			if(sb != null){
				//rank update 확인
				list_sns = pdao.getSnsPaymentList(pb.getSns_id());
				for(int j=0; j<list_sns.size(); j++){
					pb_sns = list_sns.get(j);
					if(pb_sns.getState().equals("payDone") || pb_sns.getState().equals("done") || pb_sns.getState().equals("delivery")){
						all_sns_sell += pb_sns.getPay_price();
					}
				}
				
				long money = all_sns_sell+pb.getPay_price();
				System.out.println(money);
				if( sb.getRank().equals("premium")){
					if(money<10000000){
						ab.setContent("등급이 plus으로 내려가셨어요ㅠㅠ");
						ab.setId(pb.getSns_id());
						ab.setMove("RankDown.al?rank="+"plus");
						adao.insertAlarm(ab);
						pdao.rankUpdate(pb.getSns_id(), "plus");
					}else if(money<5000000){
						ab.setContent("등급이 basic으로 내려가셨어요ㅠㅠ");
						ab.setId(pb.getSns_id());
						ab.setMove("RankDown.al?rank="+"basic");
						adao.insertAlarm(ab);
						pdao.rankUpdate(pb.getSns_id(), "basic");
					}
				}else if( sb.getRank().equals("plus")){
					if(money<5000000){
						ab.setContent("등급이 basic으로 내려가셨어요ㅠㅠ");
						ab.setId(pb.getSns_id());
						ab.setMove("RankDown.al?rank="+"basic");
						adao.insertAlarm(ab);
						pdao.rankUpdate(pb.getSns_id(), "basic");
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
	
			pdao.subSnsPay(sns_profit, pb.getAmount(), pb.getSns_id());
			pdao.subVendorProfit(vendor_profit, pb.getVendor_id());
			pdao.calAmountCancel(pb.getAmount(), pb.getProduct_num());
			pdao.addPoint(pb.getUsedPoint(), pb.getClient_id());
			pdao.subPoint(add_point, pb.getClient_id());
	
			ab.setContent("결제 취소가 완료되었습니다.");
			ab.setId(pb.getClient_id());
			ab.setMove("PayList.pa");
			adao.insertAlarm(ab);
		}
		
		out.println("<script>");
		out.println("alert('취소가 완료되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");
		return null;
	}

}
