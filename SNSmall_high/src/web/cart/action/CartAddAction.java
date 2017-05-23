package web.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.cart.db.CartBean;
import web.cart.db.CartDAO;

public class CartAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String client_id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String vendor_id = request.getParameter("vendor_id");
		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		int allprice = Integer.parseInt(request.getParameter("allprice"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		CartDAO cdao = new CartDAO();
		CartBean cb = new CartBean();
		cb.setClient_id(client_id);
		cb.setProduct_num(product_num);
		cb.setVendor_id(vendor_id);
		cb.setOption1(option1);
		cb.setOption2(option2);
		cb.setOption3(option3);
		cb.setPrice(allprice);
		cb.setAmount(amount);
		//sns 해야됨
		cdao.CartAdd(cb);
		forward.setRedirect(true);
		forward.setPath("./CartList.ca");
		
		return forward;
	}

}