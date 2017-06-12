package web.reply.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
import web.reply.db.ReplyBean;
import web.reply.db.ReplyDAO;

public class ReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String returnUrl = request.getHeader("referer");
		int num = Integer.parseInt(request.getParameter("num"));
				
		ReplyDAO rdao = new ReplyDAO();		
		rdao.replyDelete(num);
		
		ActionForward forward = new ActionForward();
		forward.setPath(returnUrl);
		forward.setRedirect(true);
		return forward;
	}
	

}
