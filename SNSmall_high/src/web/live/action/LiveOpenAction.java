package web.live.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;

public class LiveOpenAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sns_id = request.getParameter("sns_id");
		String video_id = request.getParameter("video_id");
		String token = request.getParameter("token");
		String title = request.getParameter("title");
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		LiveDAO ldao = new LiveDAO();
		ldao.insertLive(sns_id, video_id, product_num, token, title);
		ldao.productOnUpdate(product_num);
		
		request.setAttribute("video_id", video_id);
		request.setAttribute("token", token);
		request.setAttribute("product_num", product_num);
		request.setAttribute("title", title);
		ActionForward forward = new ActionForward();
		forward.setPath("./live/liveIng.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
