package web.live.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class VodListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LiveDAO ldao = new LiveDAO();
		Map<LiveBean, ProductBean> map = ldao.getVod();
		request.setAttribute("map", map);
		ActionForward forward = new ActionForward();
		forward.setPath("./live/vodList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
