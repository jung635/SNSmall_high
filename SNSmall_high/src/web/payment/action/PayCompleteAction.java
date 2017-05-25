package web.payment.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

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

public class PayCompleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String merchant_uid = request.getParameter("merchant_uid");
		String vendorId_str = request.getParameter("vendorId_str");
		String[] vendor_id = vendorId_str.split(",");
		int price = Integer.parseInt(request.getParameter("price"));
		String amount_str = request.getParameter("amount_str");
		String[] amount = amount_str.split(",");
		String product_str = request.getParameter("product_str");
		String[] product = product_str.split(",");
		int point = Integer.parseInt(request.getParameter("point"));
		String snsId_str = request.getParameter("snsId_str");
		String[] sns_id = snsId_str.split(",");
		System.out.println(snsId_str);
		System.out.println(sns_id.length);
		for(int i=0; i<sns_id.length; i++){
			System.out.println("sns_id"+sns_id[i]);
		}
		
		String message = request.getParameter("message");
		String option1_str = request.getParameter("option1_str");
		String[] option1 = option1_str.split(",");
		String option2_str = request.getParameter("option2_str");
		String[] option2 = option2_str.split(",");
		String option3_str = request.getParameter("option3_str");
		String[] option3 = option3_str.split(",");
		String method = request.getParameter("method");
		String state = "";
		if (method.equals("card")||method.equals("withPoint"))
			state = "payDone";
		else if (method.equals("deposit"))
			state = "waiting";

		// Payment Insert
		PaymentBean pb = null;
		PaymentBean pb_sns = null;
		ProductBean prob = null;
		ProductBean prob_sns = null;
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		SnsDAO sdao = new SnsDAO();
		int usedPoint_each = point;


		List<PaymentBean> list_pb = new ArrayList<>();
		List<PaymentBean> list_sns = new ArrayList<>();

		
		for (int i = 0; i < amount.length; i++) {
			Double price_result = 0d;
			long all_sns_sell = 0L;
			int add_point = 0;
			int vendor_profit = 0;
			int company_profit = 0;
			int sns_profit = 0;
			int point_each = 0;
			prob = prodao.getProduct((Integer.parseInt(product[i])));
			pb = new PaymentBean();
			pb.setAmount(Integer.parseInt(amount[i]));
			pb.setClient_id(id);
			pb.setMessage(message);
			pb.setOrder_num(merchant_uid);
			pb.setProduct_num(Integer.parseInt(product[i]));
			if(i>=sns_id.length){
				pb.setSns_id("");
			}else{
				pb.setSns_id(sns_id[i]);
			}
			if(i>=option1.length){
				pb.setOption1("");
			}else{
				pb.setOption1(option1[i]);
			}
			if(i>=option2.length){
				pb.setOption2("");
			}else{
				pb.setOption2(option2[i]);
			}
			if(i>=option3.length){
				pb.setOption3("");
			}else{
				pb.setOption3(option3[i]);
			}
			pb.setVendor_id(vendor_id[i]);
			
			
			
			if(i==amount.length-1){
				point_each = usedPoint_each;
				price_result = (double)prob.getPrice()*(double)pb.getAmount();
			}else{
				price_result = (double)prob.getPrice()*(double)pb.getAmount();
				point_each = (int)((price_result/(double)price)*point)/10*10;
				usedPoint_each -= point_each;
			}
			//사용된 포인트 각 물건에 주기
			pb.setUsedPoint(point_each);
			list_pb.add(pb);
			//사용한 포인트 빼기
			pdao.subPoint(point_each, id);
			//amount 빼기
			if(method.equals("deposit")){
				pdao.subAmount(pb.getAmount(), pb.getProduct_num());
			}

			System.out.println("sns_id공백"+pb.getSns_id());
			if(method.equals("card")||method.equals("withPoint")){
				SnsBean sb = sdao.getSnsDetail(pb.getSns_id());
				if(sb != null){
					if(sb.getRank().equals("basic")){
						sns_profit = (int)(price_result*0.05)/10*10;
					}else if(sb.getRank().equals("plus")){
						sns_profit = (int)(price_result*0.1)/10*10;
					}else{
						sns_profit = (int)(price_result*0.2)/10*10;
					}
					
				}
				System.out.println("sns_profit"+sns_profit);
				
				add_point = (int)(price_result*0.01)/10*10;
				company_profit = (int)(price_result*0.1)/10*10;
				vendor_profit = ((prob.getPrice()*pb.getAmount())-company_profit-sns_profit);
				System.out.println("vendor_profit: "+vendor_profit);
				System.out.println("company_profit: "+company_profit);
				System.out.println("add_point:" + add_point);
				//sns profit 주기

				pdao.addSnsPay(sns_profit, pb.getAmount(), pb.getSns_id());
				//vendor profit 주기
				pdao.addVendorProfit(vendor_profit, vendor_id[i]);
				//포인트 더하기
				pdao.addPoint(add_point, id);
				//amount 정리
				pdao.calAmount(pb.getAmount(), pb.getProduct_num());
				if(sb != null){
				
					//rank update 확인
					list_sns = pdao.getSnsPaymentList(sns_id[i]);
					for(int j=0; j<list_sns.size(); j++){
						pb_sns = list_sns.get(j);
						prob_sns = prodao.getProduct(pb_sns.getProduct_num());
						if(pb_sns.getState().equals("payDone") || pb_sns.getState().equals("done") || pb_sns.getState().equals("delivery")){
							all_sns_sell += (long)prob_sns.getPrice()*(long)pb_sns.getAmount();
						}
					}
					System.out.println(all_sns_sell);
					
					long money = all_sns_sell+Math.round(price_result);
					AlarmBean ab = new AlarmBean();
					AlarmDAO adao = new AlarmDAO();
					if( sb.getRank().equals("basic")){
						if(money>=10000000){
							ab.setContent("등급이  premium으로 상승하셨습니다!");
							ab.setId(sns_id[i]);
							ab.setMove("RankUp.al?rank="+"premium");
							adao.insertAlarm(ab);
							pdao.rankUpdate(sns_id[i], "premium");
						}else if(money>=30000){//테스트용
						//}else if(money>=500000){
							ab.setContent("등급이 plsu로 상승하셨습니다!");
							ab.setId(sns_id[i]);
							ab.setMove("RankUp.al?rank="+"plus");
							adao.insertAlarm(ab);
							pdao.rankUpdate(sns_id[i], "plus");
						}
					}else if( sb.getRank().equals("plus")){
						if(money>=10000000){
							ab.setContent("등급이  premium으로 상승하셨습니다!");
							ab.setId(sns_id[i]);
							ab.setMove("RankUp.al?rank="+"premium");
							adao.insertAlarm(ab);
							pdao.rankUpdate(sns_id[i], "premium");
						}
					}
				}
					if(method.equals("withPoint")){
						out.println("<script>");
						out.println("alert('주문이 완료되었습니다.');");
						out.println("location.href='PayDone.pa?merchant_uid=" + merchant_uid + "';");
						out.println("window.close();");
						out.println("</script>");
					}
				
			}
		}
		
		if(method.equals("deposit")){
			Calendar today = Calendar.getInstance ( );
			today.add ( Calendar.DATE, 1 );
			Date tomorrow = today.getTime ( );
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분");
			String day = sdf.format(tomorrow);
			System.out.println(day);
			
			Timer timer = new Timer();
			TimerTask t_task = new TimerTask() {
				@Override
				public void run() {
					for(int i=0; i<product.length; i++){
						List<PaymentBean> list_depositPb = pdao.getPaymentByOrderNum(merchant_uid);
						for(int j=0; j<list_depositPb.size(); j++){
							PaymentBean pb_deposit = list_depositPb.get(j);
							if(pb_deposit.getState().equals("waiting")){
								pdao.deletePay(pb_deposit.getNum());
								pdao.addPoint(pb_deposit.getUsedPoint(), pb_deposit.getClient_id());
								pdao.addAmount(pb_deposit.getAmount(), pb_deposit.getProduct_num());
								System.out.println("무통장 입금이 안되 주문이 취소됨");
								AlarmBean ab = new AlarmBean();
								ab.setContent("무통장 입금이 안되 주문이 취소되었습니다.");
								ab.setId(id);
								ab.setMove("PayList.pa");
								AlarmDAO adao = new AlarmDAO();
								adao.insertAlarm(ab);
							}
						}
						
						
					}
					
				}
			};
			
			timer.schedule(t_task, (long) (1000 * 60 * 60 * 24) - (1000 * 60 *2));
			
			out.println("<script>");
			out.println("alert('주문이 완료되었습니다.');");
			out.println("window.opener.location.href='PayDone.pa?merchant_uid=" + merchant_uid + "';");
			out.println("window.close();");
			out.println("</script>");
		}
		pdao.insertPay(list_pb, state);

		return null;
	}

}
