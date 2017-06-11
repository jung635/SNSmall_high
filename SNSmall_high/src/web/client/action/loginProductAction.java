package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientDAO;
import web.client.db.MemberTypeBean;

public class loginProductAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
//		String pass = request.getParameter("pass");
		//int product_num = Integer.parseInt(request.getParameter("product_num"));
		String product_num = request.getParameter("product_num");
		String sns_id = request.getParameter("sns_id");
		
		// 비밀번호 암호화 코드 추가
		String npass = request.getParameter("pass");
		SecurityUtil su = new SecurityUtil();
		String pass = su.encryptSHA256(npass);	
		// 비밀번호 암호화 코드 추가
		
		ClientDAO cldao = new ClientDAO();
		MemberTypeBean mtb = (MemberTypeBean)cldao.idCheck(id,pass);
		if (mtb.getCheck()==0){
			response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');"); // ; 이 엔터키 역할
			out.println("history.back();"); // ; 이 엔터키 역할
			out.println("</script>");
			out.close();
			return null;
		}else if(mtb.getCheck()==-1){
			response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 없음');"); // ; 이 엔터키 역할
			out.println("history.back();"); // ; 이 엔터키 역할
			out.println("</script>");
			out.close();
			return null;
		}
		
		// 로그인 성공시 세션생성
		String type = mtb.getType();
		String name = mtb.getName();
		HttpSession session = request.getSession();		
		session.setAttribute("type", type);
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("pass", pass);
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductDetail.pr?product_num="+product_num+"&sns_id="+sns_id);
		forward.setRedirect(true);			
		return forward;
	}
}