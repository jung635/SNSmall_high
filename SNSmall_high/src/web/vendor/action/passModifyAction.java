package web.vendor.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.action.SecurityUtil;
import web.vendor.db.VendorDAO;



public class passModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
//		String pass = request.getParameter("pass");
		// 비밀번호 암호화 코드 추가
		String npass = request.getParameter("newpass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);		
		// 비밀번호 암호화 코드 추가
		VendorDAO vdao = new VendorDAO();
		vdao.passModify(id,pass);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); // 자바api 중 하나 PrintWriter
		out.println("<script>");
		out.println("alert('비밀번호가 변경되었습니다.');"); // (;) 이 엔터키 역할
		out.println("location.href='./vendorView.ve'");
		out.println("</script>");
		out.close();
		
		return null;
	}
		
}
