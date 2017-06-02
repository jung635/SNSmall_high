package web.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		request.setCharacterEncoding("utf-8");
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("id"); 
		
		String category = request.getParameter("category");
		if(category==null) {category="not";}
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){pageNum="1";}
		String order = request.getParameter("order");
		if(order==null){order="product_num";}
		
		int a = 1;
		ProductDAO prdao = new ProductDAO(); 
		int count = prdao.getProductCount(category, a);
		
		int currentPage = Integer.parseInt(pageNum);
		//int endRow = currentPage*pageSize;
		int pageSize = 12;
		int pageBlock = 10;
		int startRow = (currentPage-1)*pageSize+1;
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		
		int startPage = ((currentPage - 1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
			
		List<ProductBean> productList = null;
			if(count!=0) {
				productList = prdao.getProductList(startRow, pageSize, category, order);
			}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("productList", productList);
		request.setAttribute("category", category);
		request.setAttribute("order", order);
			
		ActionForward forward = new ActionForward();
		forward.setPath("./product/goodsList2.jsp");
		forward.setRedirect(false);			
		return forward;
		
	}

}