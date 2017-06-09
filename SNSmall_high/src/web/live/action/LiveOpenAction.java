package web.live.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;

public class LiveOpenAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String sns_id = request.getParameter("sns_id");
		String video_id = request.getParameter("video_id");
		String token = request.getParameter("token");
		String title = request.getParameter("title");
		ActionForward forward = null;
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		LiveBean lb = null;
		LiveDAO ldao = new LiveDAO();
		if(ldao.isLiving(sns_id)){
			System.out.println("진행중");
			out.println("<script>");
			out.println("alert('진행중인 방송이 있어 새로운 방송을 생성 할 수 없습니다.');");
			out.println("window.close();");
			out.println("</script>");
		}else{
			lb = ldao.getLive(video_id);
			ldao.insertLive(sns_id, video_id, product_num, token, title);
			ldao.productOnUpdate(product_num);
			request.setAttribute("lb", lb);
			forward = new ActionForward();
			forward.setPath("./live/liveIng.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
