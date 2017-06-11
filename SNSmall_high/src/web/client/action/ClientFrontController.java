package web.client.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClientFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/Main.cl")){
			action = new MainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
		}else if (command.equals("/clientJoin.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/client/clientJoinForm.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/mailAction.cl")) {
			action = new mailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if (command.equals("/mailActionForPass.cl")) {
			action = new mailActionForPass();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if (command.equals("/mailActionForId.cl")) {
			action = new mailActionForId();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if (command.equals("/mailActionForSnsId.cl")) {
			action = new mailActionForSnsId();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if (command.equals("/clientJoinAction.cl")) {
			action = new clientJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/dupIdCheck.cl")){
			action = new dupIdCheck();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/login.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/SearchPass.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/phone_auth1.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/SearchPass_IdSend.cl")){
			action = new SearchPass_IdSend();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/SearchPassAction.cl")){
			action = new SearchPassAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/SearchPassAuthen.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/phone_auth3.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/SearchIdAuthen.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/phone_auth5.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/SearchSnsIdAuthen.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/phone_auth7.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/SearchId.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/phone_auth4.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/SearchIdAction.cl")){
			action = new SearchIdAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/SearchIdForSns.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/phone_auth6.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/SearchIdForSnsAction.cl")){
			action = new SearchIdForSnsAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/loginAction.cl")){
			action = new loginAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/logOut.cl")){
			// 패키지 net.member.action 파일 MemberLogout.java
			action = new logOutAction();
			// forward = execute메서드 호출 -> 주소값 리턴
			try{
				forward = action.execute(request, response);	
			}catch(Exception e){e.printStackTrace();}	
			
		}else if(command.equals("/MyPage.cl")){
			forward = new ActionForward();
			forward.setPath("./mypage/mypay_list.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/passCheck.cl")){
			forward = new ActionForward();
			forward.setPath("./member/client/passCheck.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/ClientPassConfirm.cl")){
			action = new ClientPassConfirm();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/clientView.cl")){
			action = new clientView();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/clientUpdateForm.cl")){
			action = new clientUpdateForm();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/clientUpdateAction.cl")){
			action = new clientUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/passModifyAction.cl")){
			action = new passModifyAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/Service.cl")) {
			forward = new ActionForward();
			forward.setPath("./service/service.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/Price.cl")) {
			forward = new ActionForward();
			forward.setPath("./price/priceTable.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/loginProductAction.cl")){
			action = new loginProductAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/SendMail.cl")) {
			action = new MailActionToUs();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}
		
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
