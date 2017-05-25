package web.blog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.blog.db.BlogBean;
import web.blog.db.BlogDAO;

public class BlogSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BlogSearchAction execute()");
		
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		
		BlogDAO bdao = new BlogDAO();
		
		
		int count = bdao.getBoardCount(search);
		
		int pageSize=5;
		
		String pageNum =request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage= Integer.parseInt(pageNum); 
		int startRow= (currentPage-1)*pageSize+1;
		List<BlogBean> blogList = null;
		
		if(count!=0){
			blogList = bdao.getBlogList(startRow, pageSize, search);
		}
		
		
			request.setAttribute("blogList", blogList);
		   
		    request.setAttribute("count", count);
			request.setAttribute("pageNum",pageNum);  //currentPage 랑 동일
			//이동 ./board/list.jsp
			ActionForward forward = new ActionForward();
			forward.setPath("./blog/blogSearch.jsp");
			forward.setRedirect(false);
					
			return forward;
		
	}
	

}
