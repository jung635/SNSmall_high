package web.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.board.db.BoardDAO;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num")); 
		BoardDAO bdao = new BoardDAO();
		bdao.deleteBoard(num);		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}
	

}