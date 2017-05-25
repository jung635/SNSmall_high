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
		ProductDAO prodao = new ProductDAO();
		ProductBean prob = prodao.getProduct(pb.getProduct_num());
		SnsDAO sdao = new SnsDAO();
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		double price_result = (double)prob.getPrice()*(double)pb.getAmount();
		PaymentBean pb_sns = null;
		ProductBean prob_sns = null;
		SnsBean sb_sns = null;
		long all_sns_sell = 0L;
		List<PaymentBean> list_pb = new ArrayList<>();
		List<PaymentBean> list_sns = new ArrayList<>();
		pdao.deletePay(payNum);
		AlarmBean ab = new AlarmBean();
		AlarmDAO adao = new AlarmDAO();
		
		if(pb.getState().equals("w_cancleHold")){
			ab.setContent("결제 취소가 완료되었습니다.");
			ab.setId(pb.getClient_id());
			ab.setMove("PayList.pa");
			adao.insertAlarm(ab);
			pdao.addPoint(pb.getUsedPoint(), pb.getClient_id());
			pdao.addAmount(pb.getAmount(), pb.getProduct_num());
		}else{
			
			SnsBean sb = sdao.getSnsDetail(pb.getSns_id());
			if(sb != null){
				if(sb.getRank().equals("basic")){
					sns_profit = (int)(price_result*0.05)/10*10;
				}else if(sb.getRank().equals("plus")){
					sns_profit = (int)(price_result*0.1)/10*10;
				}else{
					sns_profit = (int)(price_result*0.2/10*10);
				}
			}
			System.out.println("sns_profit"+sns_profit);
			add_point = (int)(price_result*0.01)/10*10;
			company_profit = (int)(price_result*0.1)/10*10;
			vendor_profit = ((prob.getPrice()*pb.getAmount())-company_profit-sns_profit);
			System.out.println("vendor_profit: "+vendor_profit);
			System.out.println("company_profit: "+company_profit);
			System.out.println("add_point:" + add_point);
			
	
			pdao.subSnsPay(sns_profit, pb.getAmount(), pb.getSns_id());
			pdao.subVendorProfit(vendor_profit, pb.getVendor_id());
			pdao.calAmountCancel(pb.getAmount(), pb.getProduct_num());
			pdao.addPoint(pb.getUsedPoint(), pb.getClient_id());
			pdao.subPoint(add_point, pb.getClient_id());
			
			
			//rank update 확인
			list_sns = pdao.getSnsPaymentList(pb.getSns_id());
			System.out.println("size:"+list_sns.size());
			for(int j=0; j<list_sns.size(); j++){
				pb_sns = list_sns.get(j);
				prob_sns = prodao.getProduct(pb_sns.getProduct_num());
				if(pb_sns.getState().equals("payDone") || pb_sns.getState().equals("done") || pb_sns.getState().equals("delivery")){
					all_sns_sell += (long)prob_sns.getPrice()*(long)pb_sns.getAmount();
				}
			}
			System.out.println(all_sns_sell);
			sb_sns= sdao.getSnsDetail(pb.getSns_id());
			
			
			long money = all_sns_sell+Math.round(price_result);
			
			if( sb_sns.getRank().equals("plus")){
				if(money<146000){//테스트
				//if(money<5000000){
					ab.setContent("등급이 basic으로 내려가셨어요ㅠㅠ");
					ab.setId(pb.getSns_id());
					ab.setMove("RankDown.al?rank="+"basic");
					adao.insertAlarm(ab);
					pdao.rankUpdate(pb.getSns_id(), "basic");
				}
			}else{
				if(money<10000000){
					ab.setContent("등급이  plus로 내려가셨어요ㅠㅠ");
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
			}
			ab.setContent("결제 취소가 완료되었습니다.");
			ab.setId(pb.getClient_id());
			ab.setMove("PayList.pa");
			adao.insertAlarm(ab);
			out.println("<script>");
			out.println("alert('취소가 완료되었습니다.');");
			out.println("location.href='PayList.pa';");
			out.println("</script>");
		}
		return null;
	}

}
