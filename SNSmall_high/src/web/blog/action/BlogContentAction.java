package web.blog.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.blog.db.BlogBean;
import web.blog.db.BlogDAO;

public class BlogContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		BlogDAO bdao = new BlogDAO();
		BlogBean bb = (BlogBean) bdao.getBlogPost(num);

		request.setAttribute("bb", bb);
		request.setAttribute("pageNum", pageNum);

		ActionForward forward = new ActionForward();
		forward.setPath("./blog/blogPost.jsp");
		forward.setRedirect(false);

		return forward;
	}

	
	
}
