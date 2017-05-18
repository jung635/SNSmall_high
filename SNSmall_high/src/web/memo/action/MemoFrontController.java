package web.memo.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemoFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 가상주소 뽑아오기
		// http://localhot:8080/Model2/BoardWrite.bo
		//		/Model2/BoardWrite.bo
		String requestURI = request.getRequestURI();
		//		/Model2
		String contextPath = request.getContextPath();
		//		/BoardWrite.bo
		String command = requestURI.substring(contextPath.length());
		// 가상주소 비교
				
		ActionForward forward = null;
		Action action = null;
		if(command.equals("/MemoWrite.me")){
			//	./board/writeForm.jsp
			// 이동정보 저장 net.board.action.ActionForward
			forward = new ActionForward();
			forward.setPath("./mypage/memo_writeForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemoWriteAction.me")){
			// 처리할 파일 틀제시 net.board.action.Action
			// 파일 BoardWriteAction execute()
			action = new MemoWriteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
		}else if(command.equals("/MemoList.me")){
			//   MemoListAction   execute()
			action = new MemoListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/MemoContent.me")){
			// BoardContentAction execute()
			action = new MemoContentAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
		}
		
		
		
		
		// 이동하기
		if(forward !=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request,  response);
			}
		}
	} //doProcess
	
	@Override	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()메서드 호출");
		// doProcess() 메서드 호출
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()메서드 호출");
		// doProcess() 메서드 호출
		doProcess(request, response);
	}
	
}//MemoFrontController
