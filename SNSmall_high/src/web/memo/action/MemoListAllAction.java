package web.memo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.memo.db.MemoDAO;

public class MemoListAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 세션값 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// MemoDAO medao 객체 생성
		MemoDAO medao = new MemoDAO();

		// 메모 전체글 개수
		// int count = medao.getMemoCount() 메서드 호출
		int count = medao.getMemoCountAll(id);

		// 한 페이지에 보여줄 글의 개수
		int pageSize = 10;
		// 현페이지가 몇 페이지인지 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) { // pageNum없으면
			pageNum = "1"; // 무조건 1페이지
		}

		// 시작행 구하기 1 11 21 31... <= pageNum, pageSize 조합
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 끝행 구하기(오라클 끝행 필요함.)
		int endRow = currentPage * pageSize;

		// List memoListAll = 매서드 호출 getMemoListAll(시작행, 몇개)
		List memoListAll = medao.getMemoListAll(id, startRow, pageSize);

		// 전체 페이지 수 구하기 게시판글 50개 한 화면에 보여줄 글개수 10 => 5 페이지
		// 56개 한 화면에 보여줄 글개수 10 => 5 페이지 + 1(나머지) =>6
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 한 화면에 보여줄 페이지 번호 개수
		int pageBlock = 10;
		// 시작페이지 번호 구하기 1~10=>1 11~20=>11 21~30=>21
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		// 끝페이지 번호 구하기
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		// 데이터 저장 count boardList pageCount pageNum pageBlock startPage endPage

		request.setAttribute("memoListAll", memoListAll); // 리스트형
		request.setAttribute("pageNum", pageNum); // String형
		request.setAttribute("count", count); // int형
		request.setAttribute("pageCount", pageCount); // int형
		request.setAttribute("pageBlock", pageBlock); // int형
		request.setAttribute("startPage", startPage); // int형
		request.setAttribute("endPage", endPage); // int형

		// 이동 ./mypage/memo_list.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./mypage/memo_list_all.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
