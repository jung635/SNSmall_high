package web.sns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.client.action.SecurityUtil;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		// 비밀번호 암호화 코드 추가
		String npass = request.getParameter("pass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);		
		// 비밀번호 암호화 코드 추가
		String realPate = request.getRealPath("/sns_pro_upload");
		System.out.println(realPate);
		int maxSize=5*1024*1024;
		MultipartRequest multi= new MultipartRequest(request, realPate,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		
		SnsDAO sdao = new SnsDAO();
		String sns_id = multi.getParameter("sns_id");
		
		int check= sdao.joinIdCheck(sns_id);
		
		
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('다른 아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}		
		
		SnsBean sb= new SnsBean();
		
		sb.setSns_id(multi.getParameter("sns_id"));
		sb.setPass(pass);
		sb.setName(multi.getParameter("name"));
		sb.setProfile_img(multi.getFilesystemName("file"));
		sb.setDetail_img(multi.getParameter("file_names"));
		sb.setCategory(multi.getParameter("myselect"));
		sb.setContent(multi.getParameter("content"));
		sb.setInstagram(multi.getParameter("instagram_ac"));
		sb.setFacebook(multi.getParameter("facebook_ac"));
		sb.setTwitter(multi.getParameter("twitter_ac"));
		sb.setBlog(multi.getParameter("blog_ac"));
		sb.setEtc(multi.getParameter("etc_ac"));
		
		
		
		sdao.insertMember_sns(sb);
				
		ActionForward forward = new ActionForward();
		forward.setPath("./login.ve");
		forward.setRedirect(true);
				
		return forward;
	
	}

}
