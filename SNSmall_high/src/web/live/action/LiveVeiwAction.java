package web.live.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;

public class LiveVeiwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = "";
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(session.getAttribute("id")==null){
			out.println("<script>");
			out.println("alert('로그인을 하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else{
			id = (String)session.getAttribute("id");
		
			String video_id = request.getParameter("video_id");
			LiveDAO ldao = new LiveDAO();
			LiveBean lb = ldao.getLive(video_id);
			ldao.viewUp(video_id);
			
			request.setAttribute("lb", lb);
			forward = new ActionForward();
			forward.setPath("./live/viewLive.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
