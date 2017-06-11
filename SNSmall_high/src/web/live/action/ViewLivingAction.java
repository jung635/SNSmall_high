package web.live.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;

public class ViewLivingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String video_id = request.getParameter("video_id");
		ActionForward forward = null;
		LiveDAO ldao = new LiveDAO();
		LiveBean lb = ldao.getLive(video_id);
		request.setAttribute("lb", lb);
		forward = new ActionForward();
		forward.setPath("./live/liveIng.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
