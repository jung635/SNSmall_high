package web.live.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;

public class LiveListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LiveDAO ldao = new LiveDAO();
		List<LiveBean> list = ldao.getLive();
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setPath("./live/liveList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}