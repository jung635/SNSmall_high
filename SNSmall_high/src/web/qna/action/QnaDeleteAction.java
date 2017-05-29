package web.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.qna.db.QnaDAO;

public class QnaDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaDeleteAction execute()");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String pageNum = request.getParameter("pageNum");
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		
		QnaDAO qdao = new QnaDAO();
		qdao.deleteQna(q_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductDetail.pr?product_num="+product_num+"&pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}