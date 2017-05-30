package web.memo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.memo.db.MemoBean;
import web.memo.db.MemoDAO;

public class MemoReWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		
		// MemoBean meb 객체생성
		MemoBean meb = new MemoBean();
		
		//폼파라미터 => 자바빈 변수 저장
		
		meb.setNum(Integer.parseInt(request.getParameter("num")));
		meb.setContent(request.getParameter("content"));
		meb.setSubject(request.getParameter("subject"));
		meb.setFrom_id(request.getParameter("from_id"));
		meb.setTo_id(request.getParameter("to_id"));
		//meb.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		//meb.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		//meb.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		//meb.setDate(request.getParameter("data"));
		
		// MemoDAO 객체생성 medao
		MemoDAO medao = new MemoDAO();
		// 메서드 호출 reInsertMemo(meb);
		medao.reInsertMemo(meb);
		
		//이동 ./MemoList.me
		ActionForward forward = new ActionForward();
		forward.setPath("./MemoListGet.me");
		forward.setRedirect(true);
		return forward;
	}

}
