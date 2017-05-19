package web.memo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
import web.memo.db.MemoBean;
import web.memo.db.MemoDAO;


public class MemoWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemoWriteAction execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String from_id = (String)session.getAttribute("from_id");
		// web.memo.db.MemoBean   web.memo.db.MemoDAO
		// MemoBean mob 객체생성
		MemoBean meb=new MemoBean();
		// 자바빈 멤버변수 <= 파라미터 저장
		
		meb.setFrom_id(request.getParameter("from_id"));
		meb.setTo_id(request.getParameter("to_id"));
		meb.setSubject(request.getParameter("subject"));
		meb.setContent(request.getParameter("content"));
		 
		// MemoDAO modao 객체생성
		 MemoDAO medao = new MemoDAO();
		// 메서드 호출 insertMemo(meb)
		 medao.insertMemo(meb);
		 
		AlarmBean ab = new AlarmBean(); 
		ab.setContent("메모_알람_테스트");
		ab.setId(from_id);
		ab.setMove("memo");
		 
		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);

		
		// 이동 ./MemoList.me
		 ActionForward forward = new ActionForward();
		 forward.setPath("./MemoList.me");
		 forward.setRedirect(true);
		 return forward;
	}

}
