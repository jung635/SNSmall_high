package web.reply.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
import web.reply.db.ReplyBean;
import web.reply.db.ReplyDAO;

public class ReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String returnUrl = request.getHeader("referer");
		String to_id = (String) request.getParameter("to_id");
		String id = (String) request.getParameter("id");
		String content = (String) request.getParameter("content");
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));

		// [ 알람 테이블 정보 입력
		AlarmDAO adao = new AlarmDAO();
		AlarmBean ab = new AlarmBean();
		ab.setContent("댓글이 입력되었습니다.");// 메세지 뜰 내용
		ab.setId(to_id);// to Id
		ab.setMove(returnUrl);// url
		adao.insertAlarm(ab);
		// 알람 테이블 정보 입력 ]

		// [ 댓글 입력
		ReplyBean rb = new ReplyBean();
		ReplyDAO rdao = new ReplyDAO();
		rb.setId(id);
		rb.setContent(content);
		rb.setRe_ref(re_ref);
		rb.setRe_lev(0);
		rb.setRe_seq(0);
		rdao.insertReply(rb);
		// 댓글 입력 ]

		ActionForward forward = new ActionForward();
		forward.setPath(returnUrl);
		forward.setRedirect(true);
		return forward;
	}

}
