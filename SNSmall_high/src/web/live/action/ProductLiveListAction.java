package web.live.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;

public class ProductLiveListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		LiveDAO ldao = new LiveDAO();
		List<LiveBean> list = ldao.getLive(product_num);
		
		request.setAttribute("list", list);
		request.setAttribute("product_num", product_num);
		ActionForward forward = new ActionForward();
		forward.setPath("./live/productLiveList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
