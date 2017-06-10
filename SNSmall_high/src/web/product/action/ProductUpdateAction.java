package web.product.action;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductUpdateAction implements Action {
	String opt1, opt2, opt3, pre_main_img, pre_detail_img, main_img, detail_img;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String realPath = request.getRealPath("/vendor_img");
		int maxSize = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());
		ProductBean prb = new ProductBean();
		ProductDAO prdao = new ProductDAO();
		int index = 0;
		String realFileName ="";
		File file = new File("");
		File file_new = new File("");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		prb.setProduct_num(Integer.parseInt(multi.getParameter("product_num")));
		prb.setCategory(multi.getParameter("category"));
		prb.setSubject(multi.getParameter("subject"));
		prb.setContent(multi.getParameter("content"));

		pre_main_img = multi.getParameter("pre_main_img");
		pre_detail_img = multi.getParameter("pre_detail_img");
		main_img = multi.getFilesystemName("main_img");
		detail_img = multi.getFilesystemName("detail_img");

		prb.setMain_img(multi.getFilesystemName("main_img"));
		prb.setDetail_img(multi.getFilesystemName("detail_img"));

		// 옵션명, 옵션 합치기 {
		if (multi.getParameter("opt_name1") != null && !multi.getParameter("opt_name1").equals("")) {
			opt1 = multi.getParameter("opt_name1") + "," + multi.getParameter("option1").replace(" ","");
		}
		if (multi.getParameter("opt_name2") != null && !multi.getParameter("opt_name2").equals("")) {
			opt2 = multi.getParameter("opt_name2") + "," + multi.getParameter("option2").replace(" ","");
		}
		if (multi.getParameter("opt_name3") != null && !multi.getParameter("opt_name3").equals("")) {
			opt3 = multi.getParameter("opt_name3") + "," + multi.getParameter("option3").replace(" ","");
		} // } 옵션명, 옵션 합치기

		prb.setOption1(opt1);
		prb.setOption2(opt2);
		prb.setOption3(opt3);
		prb.setPrice(Integer.parseInt(multi.getParameter("price")));
		prb.setAmount(Integer.parseInt(multi.getParameter("amount")));

		// 파일변경 시 기존 파일 삭제 {
		if (main_img != null) {
			//메인 이미지 등록
			index = multi.getFilesystemName("main_img").lastIndexOf(".");
			realFileName = id + new Date().getTime() + multi.getFilesystemName("main_img").substring(index, multi.getFilesystemName("main_img").length());
			file = new File(realPath + "\\" + multi.getFilesystemName("main_img"));
			file_new = new File(realPath + "\\" + realFileName);
			file.renameTo(file_new);
			String profile_img = realFileName;
			

			file = new File(realPath + "\\" + pre_main_img);
			file.delete();
			prb.setMain_img(profile_img);
		} else {
			prb.setMain_img(multi.getParameter("pre_main_img"));
		}

		if (detail_img != null) {
			//디테일 이미지 등록
			index = multi.getFilesystemName("detail_img").lastIndexOf(".");
			realFileName = id + new Date().getTime() + multi.getFilesystemName("detail_img").substring(index, multi.getFilesystemName("detail_img").length());
			file = new File(realPath + "\\" + multi.getFilesystemName("detail_img"));
			file_new = new File(realPath + "\\" + realFileName);
			file.renameTo(file_new);
			String detail_img = realFileName;
			file = new File(realPath + "\\" + pre_detail_img);
			file.delete();
			prb.setDetail_img(detail_img);
		} else {
			prb.setDetail_img(multi.getParameter("pre_detail_img"));
		}
		// }파일변경 시 기존 파일 삭제
		prdao.updateProduct(prb);

		ActionForward forward = new ActionForward();
		forward.setPath("./MyPage.ve");
		forward.setRedirect(true);

		return forward;
	}
}