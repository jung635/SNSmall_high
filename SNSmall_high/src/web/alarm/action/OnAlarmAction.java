package web.alarm.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;

public class OnAlarmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int num = Integer.parseInt(request.getParameter("num"));
		String url = request.getParameter("url");
		AlarmDAO adao = new AlarmDAO();
		AlarmBean ab = adao.getAlarmByNum(num);
		System.out.println(ab.getState());
		adao.updateToOn(num);
		out.println("<script>");
		//out.println("history.back();");
		out.println("location.href='"+url+"';");
		out.println("</script>");
		

		return null;
	}

}
