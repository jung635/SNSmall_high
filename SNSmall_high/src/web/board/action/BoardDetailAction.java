package web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.board.db.BoardBean;
import web.board.db.BoardDAO;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = bdao.getBoard(num);
		request.setAttribute("bb", bb);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/Board_detail.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
