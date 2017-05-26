package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.board.db.BoardBean;
import web.board.db.BoardDAO;
import web.reply.db.ReplyBean;
import web.reply.db.ReplyDAO;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = bdao.getBoard(num);
		
		ReplyDAO rdao = new ReplyDAO();
		int count = rdao.getReplyCount(num);
		List<ReplyBean> replyList  = rdao.getReplyList(num);
		
		request.setAttribute("bb", bb);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("replyList", replyList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/boardDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
