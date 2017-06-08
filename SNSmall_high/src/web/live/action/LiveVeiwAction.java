package web.live.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		String sns_id = request.getParameter("sns_id");
		String video_id = request.getParameter("video_id");
		String token = request.getParameter("token");
		String title = request.getParameter("title");
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		System.out.println(product_num);
		LiveDAO ldao = new LiveDAO();
		ldao.viewUp(video_id);
		
		request.setAttribute("sns_id", sns_id);
		request.setAttribute("id", id);
		request.setAttribute("video_id", video_id);
		request.setAttribute("token", token);
		request.setAttribute("title", title);
		request.setAttribute("product_num", product_num);
		forward = new ActionForward();
		forward.setPath("./live/viewLive.jsp");
		forward.setRedirect(false);
		}
		return forward;
	}

}
