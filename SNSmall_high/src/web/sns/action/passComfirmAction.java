package web.sns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.action.SecurityUtil;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;


public class passComfirmAction implements Action{

	//비밀번호확인하고 업데이트창으로 가는 page
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setPath("./MemberLoginForm.me");
			forward.setRedirect(true); 
			return forward;
		}
		
		String pass = request.getParameter("pass");
		// 비밀번호 암호화 코드 추가
//		String npass = request.getParameter("pass");
//		SecurityUtil su = new SecurityUtil();
//		String pass = su.encryptSHA256(npass);		
		// 비밀번호 암호화 코드 추가
		
		SnsDAO sdao = new SnsDAO();
		int check= sdao.passCheck(id, pass);
		System.out.println(check);
		if(check==-1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		SnsBean sb= sdao.getSnsDetail(id);
		request.setAttribute("sb", sb);
		
		forward.setPath("./member/sns/snsUpdate.jsp");
		forward.setRedirect(false);  
		return forward;
		
	}

}
