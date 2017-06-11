package web.memo.action;

import java.io.PrintWriter;

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
		//System.out.println("MemoWriteAction execute()");
		
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
		ab.setContent("쪽지가 도착했습니다");
		ab.setId(request.getParameter("to_id"));
		ab.setMove("MemoListGet.me");
	
		
		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('쪽지를 보냈습니다.');"); //세미콜론이 문장의 끝과 엔터기 역활을 함.
		out.println("window.close();");
		out.println("</script>");
		out.close();
		
		
		// 이동 ./MemoList.me
		 ActionForward forward = new ActionForward();
		 forward.setPath("./MemoList.me");
		 forward.setRedirect(true);
		 return forward;
	}

}
