package web.sns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.sns.db.SnsDAO;

public class snsSaleDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("SnsSaleDeleteAction execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		// pageNum 파라미터 정보 가져오기
		String pageNum=request.getParameter("pageNum");
		int num=Integer.parseInt(request.getParameter("num"));
		
		//sns
		SnsDAO snsdao = new SnsDAO();	
		int check = snsdao.deleteSnsSale(num);
		
		// check==0 "비밀번호" 뒤로 이동
		// check==-1 "게시판 글 번호없음" 뒤로 이동
		// "삭제성공" 이동 ./MemoList.me?pageNum=
						
		// check 1이면 "수정성공" 이동  ./MemoList.me?pageNum=
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제성공');"); //세미콜론이 문장의 끝과 엔터기 역활을 함.
			out.println("location.href='./SnsSale.sn?pageNum="+pageNum+"';");
			out.println("</script>");
			out.close();
		
		return null;
	}

}
