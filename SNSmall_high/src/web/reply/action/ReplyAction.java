package web.reply.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.reply.db.ReplyBean;
import web.reply.db.ReplyDAO;

public class ReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String returnUrl = request.getHeader("referer");
		
		ReplyBean rb = new ReplyBean();
		ReplyDAO rdao = new ReplyDAO();
		String id = (String)request.getParameter("id");
		String content = (String)request.getParameter("content");
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		
		rb.setId(id);
		rb.setContent(content);
		rb.setRe_ref(re_ref);
		rb.setRe_lev(0);
		rb.setRe_seq(0);
		
		rdao.insertReply(rb);
		
		ActionForward forward = new ActionForward();
		forward.setPath(returnUrl);
		forward.setRedirect(true);
		return forward;
	}
	

}
