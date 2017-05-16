package web.sns.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;


public class SnsUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("업뎃");
		
		String realPath = request.getRealPath("/sns_pro_upload");
		System.out.println("물리적경로:"+realPath);
		int maxSize = 5*1024*1024;
		MultipartRequest multi = 
				new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		SnsBean sb = new SnsBean();
		SnsDAO sdao = new SnsDAO();
		//세션
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		
		
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setPath("./login.ve");
			forward.setRedirect(true);
			return forward;
		}
		
		sb.setName(multi.getParameter("name"));
		sb.setCategory(multi.getParameter("myselect"));
		sb.setContent(multi.getParameter("content")); 
		
//		if(!(multi.getParameter("instagram_ac").equals(""))){
//			sb.setInstagram(multi.getParameter("instagram_ac"));
//		}else if(!(multi.getParameter("instagram_ac2").equals(""))){
//			sb.setInstagram(multi.getParameter("instagram_ac2"));
//		}else if((multi.getParameter("instagram_ac").equals(""))&&(multi.getParameter("instagram_ac2").equals(""))){
//			sb.setInstagram(multi.getParameter("instagram_ac2"));
//		}
		
		sb.setInstagram(multi.getParameter("instagram_ac"));
		sb.setFacebook(multi.getParameter("facebook_ac"));
		sb.setTwitter(multi.getParameter("twitter_ac"));
		sb.setBlog(multi.getParameter("blog_ac"));
		sb.setEtc(multi.getParameter("etc_ac"));
		
		session.setAttribute("name", multi.getParameter("name"));
		
		if(multi.getFilesystemName("file")==null){
			sb.setProfile_img(multi.getParameter("one_file"));
		}else{
			sb.setProfile_img(multi.getFilesystemName("file"));
			System.out.println(realPath+"\\"+multi.getParameter("one_file"));
			File file = new File(realPath+"\\"+multi.getParameter("one_file"));
			file.delete();
		}
		
		if(multi.getFilesystemName("files")==null){
			sb.setDetail_img(multi.getParameter("orgin_file_names"));
		}else{
			sb.setDetail_img(multi.getParameter("file_names"));
			
			String[] array;
			String s = multi.getParameter("orgin_file_names");
			array=s.split(",");
			
			for(int i=0;i<array.length;i++){
			System.out.println(realPath+"\\"+array[i]);
			File file = new File(realPath+"\\"+array[i]);
			file.delete();
			System.out.println(file);
			}
		}
		
		
		sdao.SnsUpdate(sb, id);
		
		forward.setPath("./MyPage.sn");
		forward.setRedirect(true);
		
		return forward;		 
		
		
		
	}



}
