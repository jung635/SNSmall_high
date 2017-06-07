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

public class LiveListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LiveDAO ldao = new LiveDAO();
		Map<LiveBean, ProductBean> map = ldao.getLive();
		
		request.setAttribute("map", map);
		ActionForward forward = new ActionForward();
		forward.setPath("./live/liveList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
