package web.memo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.memo.db.MemoBean;
import web.memo.db.MemoDAO;

public class MemoContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// num, pageNum 파리미터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		// MemoDAO bdao 객체 생성
		MemoDAO medao = new MemoDAO();

		// 쪽지 글 가져오기 메서드 호출 getMemo(num)
		MemoBean meb = medao.getMemo(num);

		// 데이터 저장 bb, pageNum
		request.setAttribute("meb", meb);
		request.setAttribute("pageNum", pageNum);

		// 이동 ./memo/content.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./mypage/memo_content.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
