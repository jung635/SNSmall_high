package web.memo.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
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
		
		
		AlarmBean ab = new AlarmBean(); 
		ab.setContent("답글이 도착했습니다");
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
		
		//이동 ./MemoList.me
		ActionForward forward = new ActionForward();
		forward.setPath("./MemoListGet.me");
		forward.setRedirect(true);
		return forward;
	}

}
