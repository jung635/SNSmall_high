package web.product.action;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductInsertAction implements Action{
	String opt1,opt2,opt3;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		String realPath = request.getRealPath("/vendor_img");
		int maxSize = 5*1024*1024;
		
		
		MultipartRequest multi = 
				new MultipartRequest(request, realPath, maxSize, "utf-8", 
						new DefaultFileRenamePolicy());
		String id = multi.getParameter("vendor_id");
		int index = 0;
		String realFileName ="";
		File file = new File("");
		File file_new = new File("");
		//메인 이미지 등록
		index = multi.getFilesystemName("main_img").lastIndexOf(".");
		realFileName = "main" +  id + new Date().getTime() + multi.getFilesystemName("main_img").substring(index, multi.getFilesystemName("main_img").length());
		file = new File(realPath + "/" + multi.getFilesystemName("main_img"));
		file_new = new File(realPath + "/" + realFileName);
		file.renameTo(file_new);
		String profile_img = realFileName;
		
		//디테일 이미지 등록
		index = multi.getFilesystemName("detail_img").lastIndexOf(".");
		realFileName = "sub" + id + new Date().getTime() + multi.getFilesystemName("detail_img").substring(index, multi.getFilesystemName("detail_img").length());
		file = new File(realPath + "/" + multi.getFilesystemName("detail_img"));
		file_new = new File(realPath + "/" + realFileName);
		file.renameTo(file_new);
		String detail_img = realFileName;
		
		
		ProductBean prb = new ProductBean();
		ProductDAO prdao = new ProductDAO();
		prb.setVendor_id(multi.getParameter("vendor_id"));
		prb.setCategory(multi.getParameter("category"));
		prb.setSubject(multi.getParameter("subject"));
		prb.setContent(multi.getParameter("content"));
		prb.setMain_img(profile_img);
		prb.setDetail_img(detail_img);
		
		if (multi.getParameter("opt_name1") != null && !multi.getParameter("opt_name1").equals("")){
			opt1 = multi.getParameter("opt_name1")+","+multi.getParameter("option1").replace(" ","");	
		}
		if (multi.getParameter("opt_name2") != null && !multi.getParameter("opt_name2").equals("")){
			opt2 = multi.getParameter("opt_name2")+","+multi.getParameter("option2").replace(" ","");
		}
		if (multi.getParameter("opt_name3") != null && !multi.getParameter("opt_name3").equals("")){
			opt3 = multi.getParameter("opt_name3")+","+multi.getParameter("option3").replace(" ","");	
		}
		
		prb.setOption1(opt1);
		prb.setOption2(opt2);
		prb.setOption3(opt3);
		prb.setPrice(Integer.parseInt(multi.getParameter("price")));
		prb.setAmount(Integer.parseInt(multi.getParameter("amount")));
		prdao.insertProduct(prb);
				
		ActionForward forward = new ActionForward();		
		forward.setPath("./MyPage.ve");
		forward.setRedirect(true);
		
		return forward;		 
	}
}