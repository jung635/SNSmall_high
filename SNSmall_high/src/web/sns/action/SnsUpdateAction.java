package web.sns.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String realPath = request.getRealPath("/sns_pro_upload");
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		SnsBean sb = new SnsBean();
		SnsDAO sdao = new SnsDAO();
		// session
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./login.cl");
			forward.setRedirect(true);
			return forward;
		}

		sb.setName(multi.getParameter("name"));
		sb.setCategory(multi.getParameter("myselect"));
		sb.setContent(multi.getParameter("content"));

		sb.setInstagram(multi.getParameter("instagram_ac"));
		sb.setFacebook(multi.getParameter("facebook_ac"));
		sb.setTwitter(multi.getParameter("twitter_ac"));
		sb.setBlog(multi.getParameter("blog_ac"));
		sb.setEtc(multi.getParameter("etc_ac"));

		session.setAttribute("name", multi.getParameter("name"));
		
		if (multi.getFilesystemName("file") == null) {
			sb.setProfile_img(multi.getParameter("one_file"));
		} else {
			System.out.println("profile: "+multi.getFilesystemName("file"));
				
				File file = new File(realPath + "\\" + multi.getParameter("one_file"));
				file.delete();
				sb.setProfile_img(multi.getFilesystemName("file"));
		}

		if (multi.getFilesystemName("files") == null) {
			sb.setDetail_img(multi.getParameter("orgin_file_names"));
		} else {
			
			System.out.println("sub: "+multi.getFilesystemName("files"));
			System.out.println("sub: "+multi.getParameter("file_names"));
			String[] array;
			String s = multi.getParameter("orgin_file_names");
			array = s.split(",");

			for (int i = 0; i < array.length; i++) {
				File file = new File(realPath + "\\" + array[i]);
				file.delete();
			}
			
			sb.setDetail_img(multi.getParameter("file_names"));
		}

		sdao.SnsUpdate(sb, id);

		forward.setPath("./MyPage.sn");
		forward.setRedirect(true);

		return forward;

	}

}
