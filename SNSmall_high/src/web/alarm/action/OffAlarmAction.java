package web.alarm.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;

public class OffAlarmAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		AlarmDAO adao = new AlarmDAO();
		adao.updateToOff(num);
		AlarmBean ab = adao.getAlarmByNum(num);
		
		if(ab.getMove().contains("RankUp")){
			out.println("<script>");
			out.println("window.open('"+ab.getMove()+"','RankUp', 'width=500, height=500');");
			out.println("history.back();");
			out.println("</script>");
		}else if(ab.getMove().contains("RankDown")){
			out.println("<script>");
			out.println("window.open('"+ab.getMove()+"','RankDown', 'width=500, height=500');");
			out.println("history.back();");
			out.println("</script>");
		}else{
			forward = new ActionForward();
			forward.setPath(ab.getMove());
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}