package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.board.db.BoardBean;
import web.board.db.BoardDAO;
import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;

public class SearchBoardList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		BoardDAO bdao = new BoardDAO();
		String search = request.getParameter("search");
		int count = bdao.getBoardCount();
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = 0;
		int pageBlock = 10;
		int startPage = 0;
		int endPage = 0;
		
		List<BoardBean> boardList = null;
		if(count!=0){
			boardList = bdao.getSearchBoardList(startRow, pageSize, search);
			pageCount = count/pageSize+(count%pageSize == 0 ? 0 : 1);
			
			startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("boardList", boardList);
	 	
	 	ActionForward forward = new ActionForward();
	 	forward.setPath("./admin/vendorList.jsp");
	 	forward.setRedirect(false);
		return forward;

	}

}
