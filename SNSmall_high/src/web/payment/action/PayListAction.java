package web.payment.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;

public class PayListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String type = (String)session.getAttribute("type");

		request.setAttribute("type", type);
		
		String client_id="";
		String vendor_id="";
		List<String> order_num_list;
		List<PaymentBean> vendor_order_num_list;
		List<List<PaymentBean>> pay_list_done = new ArrayList<>();
		List<PaymentBean> pay_list = new ArrayList<>();
		List<PaymentBean> pay_list2 = new ArrayList<>();
		String product_num = "";
		
		PaymentDAO pdao = new PaymentDAO();
		String method = request.getParameter("method");
		int page = Integer.parseInt(request.getParameter("page"));

		if(type.equals("client")){
			client_id =(String)session.getAttribute("id");
			order_num_list = pdao.getOrderNumList(page, client_id, method);

			if(method.equals("payDone")){
				for (int i=0; i<order_num_list.size(); i++){
					pay_list_done.add(pdao.getPayment(order_num_list.get(i)));
				}
				request.setAttribute("pay_list_done", pay_list_done);
			}else{
				pay_list2 = pdao.getPaymentById(page, client_id, method);
				request.setAttribute("pay_list2", pay_list2);
			}
		}else if(type.equals("vendor")){
			vendor_id =(String)session.getAttribute("id");
			vendor_order_num_list = pdao.getVendorOrderNumList(page, vendor_id, method);


			if(method.equals("payDone")){
				for (int i=0; i<vendor_order_num_list.size(); i++){
					PaymentBean pb = vendor_order_num_list.get(i);
					pay_list_done.add(pdao.getPayment(pb.getOrder_num(),pb.getNum()));
				}
				request.setAttribute("pay_list_done", pay_list_done);
			}else{
				pay_list2 = pdao.getVendorPaymentById(page, vendor_id, method);
				request.setAttribute("pay_list2", pay_list2);
			}
			
		}
		
		

		ActionForward forward = new ActionForward();
		forward.setPath("./mypage/payInnerList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
