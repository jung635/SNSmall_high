package web.sns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class SnsSaleDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SnsSaleDetail Action execute()");
		
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO prdao = new ProductDAO();
		 
		ProductBean prb = prdao.getProduct(num);
		
			if(prb!=null){
			request.setAttribute("prb", prb);
			System.out.println("num : "+num);
			System.out.println("prb.getProduct_num() : "+prb.getProduct_num());
		
			ActionForward forward = new ActionForward();
			forward.setPath("./mypage/sns_sale_detail.jsp");
			forward.setRedirect(false);
			return forward;
			}
			
			else{
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('상품정보가 없습니다.');"); //세미콜론이 문장의 끝과 엔터기 역활을 함.
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}
			
	}
}
