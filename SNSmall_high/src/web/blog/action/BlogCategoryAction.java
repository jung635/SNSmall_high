package web.blog.action;

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
			//한 화면에 보여줄 페이지 번호 개수 
			 int pageBlock=1;
			//시작페이지 번호 구하기  1~10=>1 , 11~20=>11 , 21~30=>21
			 int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			//끝페이지 번호 구하기
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
		forward.setPath("./blog/blogCategoryList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
