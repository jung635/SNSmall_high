package web.product.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String realPath = request.getRealPath("/vendor_img");
		int product_num=Integer.parseInt(request.getParameter("product_num"));
		ProductDAO prdao=new ProductDAO();
		ProductBean prb=prdao.getProduct(product_num);
		int check = prdao.deleteProduct(product_num);
		if (check==0){
			response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아직 진행 중인 거래가 남아있습니다.');"); // ; 이 엔터키 역할
			out.println("history.back();"); // ; 이 엔터키 역할
			out.println("</script>");
			out.close();
			return null;
		}else{
			File file1 = new File(realPath+"\\"+prb.getMain_img());
			File file2 = new File(realPath+"\\"+prb.getDetail_img());
			file1.delete();
			file2.delete();				
		}
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("./MyPage.ve");
		forward.setRedirect(true);
		return forward;
	}
}