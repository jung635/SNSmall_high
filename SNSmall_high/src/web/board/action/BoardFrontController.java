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
		if(command.equals("/BoardList.bo")){
			action = new BoardListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}else if(command.equals("/writeForm.bo")){
			forward = new ActionForward();
			forward.setPath("./board/Board_WriteForm.jsp");
//			forward.setPath("./board/a.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/writeAction.bo")){
			action = new writeAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}else if(command.equals("/BoardDetail.bo")){
			action = new BoardDetailAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}else if(command.equals("/BoardUpdateForm.bo")){
			action = new BoardUpdateForm();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}else if(command.equals("/BoardUpdateAction.bo")){
			action = new BoardUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}else if(command.equals("/BoardDelete.bo")){
			action = new BoardDeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}

		//이동
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		//이동
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