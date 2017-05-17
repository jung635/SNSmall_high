package web.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		// 가상주소 판단 시작
		if(command.equals("/Contact.co")){
			forward = new ActionForward();
			forward.setPath("./contact/contactBoard.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/writeForm.co")){
			forward = new ActionForward();
			forward.setPath("./contact/contactBoard_InsertForm.jsp");
			forward.setRedirect(false);
		}
		
<<<<<<< HEAD:SNSmall_high/src/web/contact/action/ContactFrontController.java
		// 가상주소 판단 끝
		
		// 이동 시작
		if(forward!=null){
=======
		//이동
		if (forward != null) {
>>>>>>> c8e06b96ef4b68aa785e78e1792204381f283e40:SNSmall_high/src/web/board/action/BoardFrontController.java
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
<<<<<<< HEAD:SNSmall_high/src/web/contact/action/ContactFrontController.java
		// 이동 끝
=======
		//이동
>>>>>>> c8e06b96ef4b68aa785e78e1792204381f283e40:SNSmall_high/src/web/board/action/BoardFrontController.java
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