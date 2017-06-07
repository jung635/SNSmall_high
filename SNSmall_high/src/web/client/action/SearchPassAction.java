package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientDAO;
import web.client.db.MemberTypeBean;

public class SearchPassAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		RandomPass rp = new RandomPass();
		ClientDAO cldao = new ClientDAO();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		//아이디랑 이름으로 가입유무 조회
		boolean passcheck = cldao.SearchPass(id, name);
		// 있으면 임시비번 발송 후 디비에 임시버번으로  update
		if(passcheck){			
			String NewPass = rp.randomPw();
			String content="임시 비밀번호는 "+NewPass+" 입니다.";
			boolean check = cldao.sendMail(email,content);
			if (check){
				// 비밀번호 암호화 코드 추가
				String npass = NewPass;
				SecurityUtil su = new SecurityUtil();
				String pass = su.encryptSHA256(npass);		
				// 비밀번호 암호화 코드 추가
				cldao.updatePass(id, name, pass);
				response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('메일발송하였습니다!');");
				out.println("window.close();");
				out.println("</script>");
				out.close();
				return null;
			}else{
				response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('메일발송을 실패하였습니다.');"); // ; 이 엔터키 역할
				out.println("history.back();"); // ; 이 엔터키 역할
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