package web.alarm.action;

import java.sql.Timestamp;
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

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		AlarmBean ab = new AlarmBean();
		ab.setContent("테스트 Content");
		ab.setId("test");
		ab.setMove("memo");
		List<PaymentBean> list_pb = new ArrayList<>();
		List<PaymentBean> list_sns = new ArrayList<>();
		PaymentBean pb_sns = null;
		ProductBean prob_sns = null;
		long all_sns_sell = 0L;
		AlarmDAO adao = new AlarmDAO();
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		//adao.insertAlarm(ab);
		
		list_sns = pdao.getSnsPaymentList("abc");
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
		return null;
	}

}
