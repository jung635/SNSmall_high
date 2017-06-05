package web.live.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveDAO;

public class LiveDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String video_id = request.getParameter("video_id");
		LiveDAO ldao = new LiveDAO();
		ldao.deleteLive(video_id);
		out.println("<script>");
		//out.println("window.close();");
		out.println("</script>");
		return null;
	}

}
