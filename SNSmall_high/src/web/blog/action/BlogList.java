package web.blog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.blog.db.BlogDAO;

public class BlogList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BlogList execute()");
		
		BlogDAO bdao = new BlogDAO();
		int count = bdao.getBlogListCount();
		//한페이지에 보여줄 글갯수
		int pageSize= 3;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){ pageNum="1"; }
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		int endRow = currentPage*pageSize;
		
		 List blogList = bdao.getBlogList(startRow, pageSize);
			//전체 페이지수 구하기      게시판 글 50개, 한 화면에 보여줄 글 개수 10 =>전체페이지? 5Page
			//                게시판 글 56개, 한 화면에 보여줄 글 개수 10 =>전체페이지? 5+1(나머지)Page
			 int pageCount = count/pageSize+(count%pageSize==0? 0:1);
			//한 화면에 보여줄 페이지 번호 개수 
			 int pageBlock=10;
			//시작페이지 번호 구하기  1~10=>1 , 11~20=>11 , 21~30=>21
			 int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			//끝페이지 번호 구하기
			 int endPage= startPage+pageBlock-1;
			 if(endPage>pageCount){
				 endPage=pageCount;
			 }
			 
			 request.setAttribute("blogList", blogList);
			    request.setAttribute("pageCount",pageCount);
			    request.setAttribute("count", count);
				request.setAttribute("pageNum",pageNum);  //currentPage 랑 동일
				request.setAttribute("pageBlock",pageBlock);
				request.setAttribute("startPage",startPage);
				request.setAttribute("endPage",endPage);
				//이동 ./board/list.jsp
				ActionForward forward = new ActionForward();
				forward.setPath("./blog/blogHome.jsp");
				forward.setRedirect(false);
						
				return forward;
		
		
	}

}
