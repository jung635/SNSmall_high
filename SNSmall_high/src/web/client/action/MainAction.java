package web.client.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.sns.db.SnsDAO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//snsList
		SnsDAO sdao = new SnsDAO();
		List<Object> list = sdao.snsList(0, 8, "all" , "sell");
		request.setAttribute("list", list);
		
		//ProductList
		ProductDAO prodao = new ProductDAO();
		List<ProductBean> product_list = prodao.getProductList(1, 12, "not", "count");
		request.setAttribute("product_list", product_list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main/index.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
