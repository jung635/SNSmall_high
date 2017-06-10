package web.client.action;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientDAO;

public class mailActionForSnsId implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		
		
		Random random = new Random();
		int authNum = random.nextInt(1000000)+100000;
		if (authNum > 1000000){
			authNum = authNum - 100000;
		}
		
		
		String content="인증번호는"+authNum+"입니다.";
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String home = request.getParameter("home");
		
		request.setAttribute("authNum", authNum);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("home", home);
		
		ClientDAO cldao = new ClientDAO();
		String findId = cldao.SearchIdForSns(name, home);
				
		if (findId != null){
			boolean check = cldao.sendMail(email,content);
			if(check){
				response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('인증번호를 발송하였습니다!');");
				out.println("location.href='./SearchSnsIdAuthen.cl?home="+home+"&name="+name+"&authNum="+authNum+"&email="+email+"'");
				out.println("</script>");
				out.close();
				return null;
			}else{
				response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('인증번호 발송을 실패하였습니다.');"); // ; 이 엔터키 역할
				out.println("window.close();"); // ; 이 엔터키 역할
				out.println("</script>");
				out.close();
				return null;
			}
		}else{
			response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('일치하는 회원정보가 없습니다.');"); // ; 이 엔터키 역할
			out.println("history.back();"); // ; 이 엔터키 역할
			out.println("</script>");
			out.close();
			return null;
		}
	}
}