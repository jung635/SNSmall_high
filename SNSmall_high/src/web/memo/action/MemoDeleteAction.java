package web.memo.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.memo.db.MemoDAO;


public class MemoDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("Memo Delete execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");

		// pageNum 파라미터 정보 가져오기
		String pageNum=request.getParameter("pageNum");
		//글번호, 비밀번호 파라미터 가져오기
		int num=Integer.parseInt(request.getParameter("num"));

		//memoDAO medao 객체 생성
		MemoDAO medao = new MemoDAO();
		//int check = deleteMemo(num)메서드 호출
		int check = medao.deleteMemo(num);
				
		// check==0 "비밀번호" 뒤로 이동
		// check==-1 "게시판 글 번호없음" 뒤로 이동
		// "삭제성공" 이동 ./MemoList.me?pageNum=
				
		// check 1이면 "수정성공" 이동  ./MemoList.me?pageNum=
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제성공');"); //세미콜론이 문장의 끝과 엔터기 역활을 함.
			out.println("location.href='./MemoList.me?pageNum="+pageNum+"';");
			out.println("</script>");
			out.close();
		return null;
	}

}
