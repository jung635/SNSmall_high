package web.reply.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.reply.db.ReplyBean;
import web.reply.db.ReplyDAO;

public class ReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ReplyBean rb = new ReplyBean();
		ReplyDAO rdao = new ReplyDAO();
		String id = (String)request.getParameter("id");
		String num = (String)request.getParameter("num");
		String reply = (String)request.getParameter("reply");
		
		rb.setId(id);
		rb.setReply_num(Integer.parseInt(num));
		rb.setReply_content(reply);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}
	

}
