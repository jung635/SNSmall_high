package web.vendor.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.action.SecurityUtil;
import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;



public class vendorJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		// 비밀번호 암호화 코드 추가
		String npass = request.getParameter("pass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);		
		// 비밀번호 암호화 코드 추가
		VendorDAO vdao = new VendorDAO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		boolean check=vdao.idDupCheck(id); 
		if(check==false){
			out.println("<script>");
			out.println("alert('다른 아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		VendorBean vb = new VendorBean();
		vb.setVendor_id(request.getParameter("id"));
		vb.setPass(pass);
		vb.setPerson_name(request.getParameter("name"));
		vb.setCompany_name(request.getParameter("company"));
		vb.setPhone(request.getParameter("phone"));
		String addre = request.getParameter("postcode")+"/"+request.getParameter("address")+"/"+request.getParameter("address2");
		vb.setAddress(addre);
		vdao.insertVendor(vb);
		
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');");
		out.println("location.href='./login.ve'");
		out.println("</script>");
		out.close();
		return null;
	}
		
}
