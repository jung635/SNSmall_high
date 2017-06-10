package web.sns.action;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;

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
		int index = 0;
		String realFileName ="";
		File file = new File("");;
		File file_new = new File("");
		
		if (multi.getFilesystemName("file") == null) {
			sb.setProfile_img(multi.getParameter("one_file"));
		} else {
			
			index = multi.getFilesystemName("file").lastIndexOf(".");
			realFileName = id + new Date().getTime() + multi.getFilesystemName("file").substring(index, multi.getFilesystemName("file").length());
			file = new File(realPath + "\\" + multi.getFilesystemName("file"));
			file_new = new File(realPath + "\\" + realFileName);
			file.renameTo(file_new);
			String profile=realFileName;
			
			file = new File(realPath + "\\" + multi.getParameter("one_file"));
			file.delete();
			sb.setProfile_img(profile);
		}

		if (multi.getFilesystemName("files") == null) {
			sb.setDetail_img(multi.getParameter("orgin_file_names"));
		} else {
			System.out.println("sub: "+multi.getParameter("file_names"));


			
			
			String s_new = multi.getParameter("file_names");
			String[] array_new = s_new.split(",");
			for(int i=0; i<array_new.length; i++){
				index = array_new[i].lastIndexOf(".");
				realFileName = id + new Date().getTime() + array_new[i].substring(index, array_new[i].length());
				file = new File(realPath + "\\" + array_new[i]);
				file_new = new File(realPath + "\\" + realFileName);
				file.renameTo(file_new);
				array_new[i]=realFileName;
			}
			String realFileNames = Arrays.toString(array_new).substring(1, Arrays.toString(array_new).length()-1).replace(" ", "");
			
			String[] array;
			String s = multi.getParameter("orgin_file_names");
			array = s.split(",");

			for (int i = 0; i < array.length; i++) {
				file = new File(realPath + "\\" + array[i]);
				file.delete();
			}
			
			sb.setDetail_img(realFileNames);
		}

		sdao.SnsUpdate(sb, id);

		forward.setPath("./MyPage.sn");
		forward.setRedirect(true);

		return forward;

	}

}
