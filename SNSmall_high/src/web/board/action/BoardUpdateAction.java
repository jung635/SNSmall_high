package web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.board.db.BoardBean;
import web.board.db.BoardDAO;

public class BoardUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String returnUrl = request.getParameter("returnUrl");
		int num = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = new BoardBean();
		bb.setNum(num);
		bb.setSubject(subject);
		bb.setContent(content);
		bdao.updateBoard(bb);
		
		ActionForward forward = new ActionForward();
		forward.setPath(returnUrl);
		forward.setRedirect(true);
		return forward;
	}
	

}
