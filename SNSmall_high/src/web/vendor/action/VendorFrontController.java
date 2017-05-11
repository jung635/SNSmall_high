package web.vendor.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VendorFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/vendorJoin.ve")){
			forward = new ActionForward();
			forward.setPath("./member/vendor/vendorJoinForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/vendorJoinAction.ve")){
			action = new vendorJoinAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/dupIdCheck.ve")){
			action = new dupIdCheck();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/login.ve")) {
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/MyPage.ve")) {
			forward = new ActionForward();
			forward.setPath("./mypage/mypage_vendor.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/vendorView.ve")){
			action = new vendorView();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/vendorUpdateForm.ve")){
			action = new vendorUpdateForm();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/passCheck.ve")) {
			forward = new ActionForward();
			forward.setPath("./member/vendor/passCheck.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/vendorUpdateAction.ve")){
			action = new vendorUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if (command.equals("/passModify.ve")) {
			forward = new ActionForward();
			forward.setPath("./member/vendor/passModify.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/passModifyAction.ve")){
			action = new passModifyAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		} else if (command.equals("/CancelList.ve")) {
			action = new CancelListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/PayCancel.ve")) {
			action = new PayCancelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/multipleCancel.ve")) {
			forward = new ActionForward();
			forward.setPath("./mypage/vendor/multiple_cancel_list.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/login.ve")) {
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/DepositList.ve")) {
			action = new DepositListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/PayCancelPoint.ve")) {
			action = new PayCancelPointAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if (command.equals("/PayDepositDone.ve")) {
			action = new PayDepositDoneAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		// 이동
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}				
		}// 이동		
		
	}// doProcess()

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
