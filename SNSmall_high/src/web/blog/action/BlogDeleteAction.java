package web.blog.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.blog.db.BlogDAO;

public class BlogDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));

		BlogDAO bdao = new BlogDAO();
		bdao.blogPostDelete(num);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다');");
		out.println("location.href='OurBlog.bl';");
		out.println("</script>");
		out.close();

		return null;
	}

}
