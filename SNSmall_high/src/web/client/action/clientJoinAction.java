package web.client.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientBean;
import web.client.db.ClientDAO;
import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;

public class clientJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		// 비밀번호 암호화 코드 추가
		String npass = request.getParameter("pass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);		
		// 비밀번호 암호화 코드 추가
		
		ClientDAO cldao = new ClientDAO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		boolean check=cldao.idDupCheck(id); 
		if(check==false){
			out.println("<script>");
			out.println("alert('다른 아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}		
		ClientBean clb = new ClientBean();
		clb.setClient_id(request.getParameter("id"));
		clb.setPass(pass);
		clb.setName(request.getParameter("name"));
		clb.setEmail(request.getParameter("email"));
		clb.setPhone(request.getParameter("phone"));
		String addre = request.getParameter("postcode")+"/"+request.getParameter("address")+"/"+request.getParameter("address2");
		clb.setAddress(addre);
		
		cldao.insertClient(clb);
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');");
		out.println("location.href='./login.cl'");
		out.println("</script>");
		out.close();
		return null;
	}
		
}
