package web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.board.db.BoardBean;
import web.board.db.BoardDAO;

public class BoardUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = bdao.getBoard(num);
		
		request.setAttribute("bb", bb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/Board_UpdateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}