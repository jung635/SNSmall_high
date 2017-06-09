package web.blog.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.blog.db.BlogBean;
import web.blog.db.BlogDAO;
import web.blog.action.ActionForward;

public class BlogPostingAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String realPate = request.getRealPath("/blog_upload");

		int maxSize = 20 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realPate, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		BlogBean bb = new BlogBean();

		bb.setSubject(multi.getParameter("subject"));
		bb.setCategory(multi.getParameter("category"));
		bb.setFile(multi.getFilesystemName("file"));
		bb.setContent(multi.getParameter("content"));

		BlogDAO bdao = new BlogDAO();
		bdao.blogPostWrite(bb);

		ActionForward forward = new ActionForward();
		forward.setPath("./OurBlog.ad");
		forward.setRedirect(true);

		return forward;
		
	}

}
