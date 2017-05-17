package web.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.cart.db.CartBean;
import web.cart.db.CartDAO;
import web.product.db.ProductBean;

public class CartAdd implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("장바구니 추가 액션");

		request.setCharacterEncoding("utf-8");	//한글처리
		
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("id"); //세션에서 id 값 가져오기
		
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		} // 로그인이 되어있지 않으면 로그인 페이지로 이동

		
		System.out.println("subject : "+request.getParameter("subject"));
		System.out.println("pro_num : "+request.getParameter("product_num"));
		System.out.println("vendor_id : "+request.getParameter("vendor_id"));
		System.out.println("sns_id : "+request.getParameter("sns_id"));
		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		System.out.println("allprice : "+request.getParameter("allprice"));
		System.out.println("payamount : "+request.getParameter("amount"));
		
		//Basket.bean에값 저장
		CartBean cb = new CartBean();
		//받아올 세션 값 : 구매자 아이디
		cb.setClient_id(id);
		//받아올 파라미터 값 : (sns_id 어떻게 가져오지) 제목 , 갯수 , 옵션1 , 옵션2 , 옵션3 , 대표이미지
		
		cb.setSubject(request.getParameter("subject"));
		if(option1==null){option1 = "null";}
		cb.setOption1(option1);
		if(option2==null){option2 = "null";}
		cb.setOption2(option2);
		if(option3==null){option3 = "null";}
		cb.setOption3(option3);
		cb.setAmount(Integer.parseInt(request.getParameter("amount")));
		cb.setPrice(Integer.parseInt(request.getParameter("allprice")));
		cb.setProduct_num(Integer.parseInt(request.getParameter("product_num")));
		cb.setSns_id(request.getParameter("sns_id"));
		cb.setVendor_id(request.getParameter("vendor_id"));
		
		//vendor_id , product_num
		
		
		//생성해야할 값 : 날자
		
		//DAO 불러와서
		CartDAO cdao = new CartDAO();
		//추가
		cdao.CartAdd(cb);
		
		//장바구니 리스트로 가기? or 상세페이지로 이동(뒤로가기)
		
			forward.setRedirect(true);
			forward.setPath("./CartList.ca");
		return forward;
	}

}
