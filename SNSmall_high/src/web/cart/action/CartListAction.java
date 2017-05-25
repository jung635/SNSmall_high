package web.cart.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.cart.db.CartBean;
import web.cart.db.CartDAO;

public class CartListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//한글 처리 추가
		request.setCharacterEncoding("utf-8");
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		CartDAO cdao = new CartDAO();
		String client_id = (String)session.getAttribute("id");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
				
		if(client_id.equals(null)){
			
			out.println("<script>");
			out.println("alert('회원만 볼수있습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		List<CartBean> CartList = cdao.getCartList(client_id);
		request.setAttribute("CartList", CartList);
		ActionForward forward = new ActionForward();
		forward.setPath("./mypage/cart_list.jsp");
		forward.setRedirect(false);
		System.out.println(forward.getPath());
		return forward;
	}

}
