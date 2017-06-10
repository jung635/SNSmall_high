package web.sns.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.client.action.SecurityUtil;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String realPate = request.getRealPath("/sns_pro_upload");
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realPate, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		// 비밀번호 암호화 코드 추가
		String npass = multi.getParameter("pass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);
		// 비밀번호 암호화 코드 추가

		SnsDAO sdao = new SnsDAO();
		String sns_id = multi.getParameter("sns_id");

		int check = sdao.joinIdCheck(sns_id);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (check == 1) {

			out.println("<script>");
			out.println("alert('다른 아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//sns스타 프로필 사진 등록
		int index = 0;
		String realFileName ="";
		File file = new File("");;
		File file_new = new File("");
		//사진 확장자(.jpg 등등) 추출
		index = multi.getFilesystemName("file").lastIndexOf(".");
		//우리가 사용할 사진 이름을 정함(sns id + 절대시간 + 확장자)
		realFileName = sns_id + new Date().getTime() + multi.getFilesystemName("file").substring(index, multi.getFilesystemName("file").length());
		//기존 사진 file 객체 생성
		file = new File(realPate + "\\" + multi.getFilesystemName("file"));
		//우리가 저장할 사진 file 객체 생성
		file_new = new File(realPate + "\\" + realFileName);
		//기존 사진 이름을 우리가 사용할 사진 이름으로 변경
		file.renameTo(file_new);
		//db에 저장할 사진 이름
		String profile=realFileName;
		
		//sns스타 서브 사진 등록
		String s_new = multi.getParameter("file_names");
		String[] array_new = s_new.split(",");
		for(int i=0; i<array_new.length; i++){
			//사진 확장자(.jpg 등등) 추출
			index = array_new[i].lastIndexOf(".");
			//우리가 사용할 사진 이름을 정함(sns id + 절대시간 + 확장자)
			realFileName = sns_id + new Date().getTime() + array_new[i].substring(index, array_new[i].length());
			//기존 사진 file 객체 생성
			file = new File(realPate + "\\" + array_new[i]);
			//우리가 저장할 사진 file 객체 생성
			file_new = new File(realPate + "\\" + realFileName);
			//기존 사진 이름을 우리가 사용할 사진 이름으로 변경
			file.renameTo(file_new);
			//db에 저장할 사진 이름
			array_new[i]=realFileName;
		}
		String realFileNames = Arrays.toString(array_new).substring(1, Arrays.toString(array_new).length()-1).replace(" ", "");
		
		
		
		SnsBean sb = new SnsBean();

		sb.setSns_id(multi.getParameter("sns_id"));
		sb.setPass(pass);
		sb.setName(multi.getParameter("name"));
		sb.setProfile_img(profile);
		sb.setDetail_img(realFileNames);
		sb.setCategory(multi.getParameter("myselect"));
		sb.setContent(multi.getParameter("content"));
		sb.setInstagram(multi.getParameter("instagram_ac"));
		sb.setFacebook(multi.getParameter("facebook_ac"));
		sb.setTwitter(multi.getParameter("twitter_ac"));
		sb.setBlog(multi.getParameter("blog_ac"));
		sb.setEtc(multi.getParameter("etc_ac"));

		sdao.insertMember_sns(sb);
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');");
		out.println("location.href='./login.ve'");
		out.println("</script>");
		out.close();

		return null;

	}

}
