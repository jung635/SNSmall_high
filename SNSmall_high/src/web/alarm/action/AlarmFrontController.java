package web.alarm.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AlarmFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/Alarm.al")){
			action = new AlarmAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/AlarmView.al")){
			action = new AlarmViewAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/InsertAction.al")){
			action = new InsertAction();
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
