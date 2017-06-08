package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.blog.db.BlogBean;
import web.blog.db.BlogDAO;

public class BlogCategoryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category = request.getParameter("category");
		
		BlogDAO bdao = new BlogDAO();
		
		int count=bdao.getBlogCategoryListCount(category);
		
		int pageSize=5;
		
		String pageNum =request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage= Integer.parseInt(pageNum); 
		int startRow= (currentPage-1)*pageSize+1;
		
		 int pageCount = count/pageSize+(count%pageSize==0? 0:1);
			
			 int pageBlock=1;
			 int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			 int endPage= startPage+pageBlock-1;
			 
			 if(endPage>pageCount){
				 endPage=pageCount;
			 }
		
		List<BlogBean> categoryBlogList = null;
		if(count!=0){
			categoryBlogList = bdao.getCategoryBlogList(startRow, pageSize, category);
		}
		
		request.setAttribute("categoryBlogList", categoryBlogList);
		   
	    request.setAttribute("count", count);
		request.setAttribute("pageNum",pageNum);
		request.setAttribute("category", category);
		
		request.setAttribute("pageCount",pageCount);
		request.setAttribute("pageBlock",pageBlock);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage",endPage);
		
			
		ActionForward forward = new ActionForward();
		forward.setPath("/admin/blogCategoryList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
