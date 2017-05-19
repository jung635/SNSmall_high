package web.payment.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		//int price_result = Integer.parseInt(request.getParameter("price_result"));
		String amount_str = request.getParameter("amount_str");
		String[] amount = amount_str.split(",");
		String product_str = request.getParameter("product_str");
		String[] product = product_str.split(",");
		int point = Integer.parseInt(request.getParameter("point"));
		String snsId_str = request.getParameter("snsId_str");
		String[] sns_id = snsId_str.split(",");
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
		SnsBean sb_sns = null;
		SnsDAO sdao = new SnsDAO();
		//int usedPoint = pdao.usingPoint(point, id);
		int usedPoint_each = point;
		int sns_profit = 0;
		int add_point = 0;
		int vendor_profit = 0;
		int company_profit = 0;
		long all_sns_sell = 0L;
		Double price_result = 0d;
		List<PaymentBean> list_pb = new ArrayList<>();
		List<PaymentBean> list_sns = new ArrayList<>();
		for (int i = 0; i < amount.length; i++) {
			int point_each = 0;
			prob = prodao.getProduct((Integer.parseInt(product[i])));
			pb = new PaymentBean();
			pb.setAmount(Integer.parseInt(amount[i]));
			pb.setClient_id(id);
			pb.setMessage(message);
			pb.setOrder_num(merchant_uid);
			pb.setProduct_num(Integer.parseInt(product[i]));
			pb.setSns_id(sns_id[i]);
			pb.setVendor_id(vendor_id[i]);
			pb.setOption1(option1[i]);
			pb.setOption2(option2[i]);
			pb.setOption3(option3[i]);
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
			pdao.subAmount(pb.getAmount(), pb.getProduct_num());

			
			if(method.equals("card")||method.equals("withPoint")){
				SnsBean sb = sdao.getSnsDetail(sns_id[i]);
				System.out.println(sb.getRank());
				if(sb.getRank().equals("basic")){
					//sns_profit = (int)((double)prob.getPrice()*(Double.parseDouble(amount[i])*0.05));
					sns_profit = (int)(price_result*0.05)/100*100;
				}else if(sb.getRank().equals("plus")){
					sns_profit = (int)(price_result*0.1)/100*100;
				}else{
					sns_profit = (int)(price_result*0.2)/100*100;
				}
				System.out.println("sns_profit"+sns_profit);
				//add_point = (int)((double)prob.getPrice()*(Double.parseDouble(amount[i])*0.01));
				add_point = (int)(price_result*0.01)/10*10;
				//company_profit = (int)((double)prob.getPrice()*(Double.parseDouble(amount[i])*0.1));
				company_profit = (int)(price_result*0.1)/100*100;
				vendor_profit = ((prob.getPrice()*pb.getAmount())-company_profit-sns_profit)/100*100;
				System.out.println("vendor_profit: "+vendor_profit);
				System.out.println("company_profit: "+company_profit);
				System.out.println("add_point:" + add_point);
				//sns profit 주기
				pdao.addSnsPay(sns_profit, pb.getAmount(), sns_id[i]);
				//vendor profit 주기
				pdao.addVendorProfit(vendor_profit, vendor_id[i]);
				//포인트 더하기
				pdao.addPoint(add_point, id);
				//amount 정리
				pdao.calAmount(pb.getAmount(), pb.getProduct_num());
				
				//rank update 확인
				list_sns = pdao.getSnsPaymentList(sns_id[i]);
				System.out.println("size:"+list_sns.size());
				for(int j=0; j<list_sns.size(); j++){
					pb_sns = list_sns.get(j);
					prob_sns = prodao.getProduct(pb_sns.getProduct_num());
					System.out.println("product_num:"+pb_sns.getProduct_num());
					System.out.println("price:"+prob_sns.getPrice());
					all_sns_sell += (long)prob_sns.getPrice()*(long)pb_sns.getAmount();
				}
				System.out.println("test");
				System.out.println(all_sns_sell);
				sb_sns= sdao.getSnsDetail(sns_id[i]);
				
				
				pdao.rankUpdate(sns_id[i], all_sns_sell+Math.round(price_result), sb_sns.getRank());
			}
		}
		
		if(method.equals("deposit")){
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
