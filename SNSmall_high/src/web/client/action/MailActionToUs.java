package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientDAO;

public class MailActionToUs implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		String name = request.getParameter("name");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		name = new String(name.getBytes("ISO_8859_1"),"UTF-8");
		message = new String(message.getBytes("ISO_8859_1"),"UTF-8");
		message = "메일 보낸사람: "+email+"\n"+message;
		
		ClientDAO cdao = new ClientDAO();
		cdao.sendMail(message, email ,name+"님의 문의메일입니다");
		
		out.println("<script>");
		out.println("alert('메일이 전송되었습니다.');");
		out.println("location.href='Main.cl';");
		out.println("</script>");
		
		return null;
	}

}
