package web.sns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.action.SecurityUtil;
import web.sns.db.SnsDAO;

public class passChangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("passChangeAction execute()");
		
		//세션제어
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setPath("./login.ve");
			forward.setRedirect(true);
			return forward;
		}
		
//		String pass=request.getParameter("newpass");
		// 비밀번호 암호화 코드 추가
		String npass = request.getParameter("newpass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);		
		// 비밀번호 암호화 코드 추가
		
		
		System.out.println(pass);
		System.out.println(id);
		SnsDAO sdao = new SnsDAO();
		sdao.passChange(id, pass);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); // 자바api 중 하나 PrintWriter
		out.println("<script>");
		out.println("alert('비밀번호가 변경되었습니다.');"); // (;) 이 엔터키 역할
		out.println("history.back();");
		out.println("</script>");
		out.close();

		return null;		 
		
	}

}
