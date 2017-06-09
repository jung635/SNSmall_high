package web.blog.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.blog.db.BlogBean;
import web.blog.db.BlogDAO;

public class BlogUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String realPath = request.getRealPath("/blog_upload");
		
		System.out.println(realPath);
		int maxSize=20*1024*1024;
		MultipartRequest multi= new MultipartRequest(request, realPath
										,maxSize,"utf-8",new DefaultFileRenamePolicy());
		BlogDAO bdao = new BlogDAO();
		BlogBean bb = new BlogBean();
		
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		
		if(id==null||!id.equals("admin")){
			forward.setPath("./Login.cl");
			forward.setRedirect(true);
			return forward;
		}
		
		int num =Integer.parseInt(multi.getParameter("num"));
		bb.setNum(num);
		bb.setSubject(multi.getParameter("subject"));
		bb.setCategory(multi.getParameter("category"));
		bb.setContent(multi.getParameter("content"));
		
		if(multi.getFilesystemName("file")==null && multi.getParameter("one_file")==null){
			
		}else if(multi.getFilesystemName("file")==null){
			bb.setFile(multi.getParameter("one_file"));
		}else if(multi.getFilesystemName("file")!=null){
			bb.setFile(multi.getFilesystemName("file"));
			System.out.println(realPath+"\\"+multi.getParameter("one_file"));
			File file = new File(realPath+"\\"+multi.getParameter("one_file"));
			file.delete();
		}
		
		bdao.blogPostUpdate(bb);
		
		forward = new ActionForward();
		forward.setPath("./OurBlogPostAction.ad?num="+num);
		forward.setRedirect(true);
		
		return forward;		 
	}

	
}
