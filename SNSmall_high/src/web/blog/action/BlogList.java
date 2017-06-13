package web.blog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.blog.db.BlogDAO;

public class BlogList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BlogDAO bdao = new BlogDAO();
		int count = bdao.getBlogListCount();
		int pageSize= 3;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){ pageNum="1";}
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		int endRow = currentPage*pageSize;
		
		 List blogList = bdao.getBlogList(startRow, pageSize);

			 int pageCount = count/pageSize+(count%pageSize==0? 0:1);
			 int pageBlock=1;
			 int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
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
	
				ActionForward forward = new ActionForward();
				forward.setPath("./blog/blogHome.jsp");
				forward.setRedirect(false);
						
				return forward;
		
		
	}

}
