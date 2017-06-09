package web.memo.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemoFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 가상주소 뽑아오기
		// http://localhot:8080/Model2/BoardWrite.bo
		// /Model2/BoardWrite.bo
		String requestURI = request.getRequestURI();
		// /Model2
		String contextPath = request.getContextPath();
		// /BoardWrite.bo
		String command = requestURI.substring(contextPath.length());
		// 가상주소 비교

		ActionForward forward = null;
		Action action = null;
		if (command.equals("/MemoWrite.me")) {
			// ./board/writeForm.jsp
			// 이동정보 저장 net.board.action.ActionForward
			forward = new ActionForward();
			forward.setPath("./mypage/memo_writeForm.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemoWriteAction.me")) {
			// 처리할 파일 틀제시 net.board.action.Action
			// 파일 BoardWriteAction execute()
			action = new MemoWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoList.me")) {
			// MemoListAction execute()
			action = new MemoListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoContent.me")) {
			// BoardContentAction execute()
			action = new MemoContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoDeleteAction.me")) {
			// MemoDeleteAction 생성 execute() 메서드 호출
			action = new MemoDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoDelete.me")) {
			// MemoDeleteAction 생성 execute() 메서드 호출
			forward = new ActionForward();
			forward.setPath("./mypage/memo_deleteForm.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemoReWrite.me")) {
			// 파일 MemoReWrite 생성 execute()
			forward = new ActionForward();
			forward.setPath("./mypage/memo_rewriteForm.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemoReWriteAction.me")) {
			// BoardReWriteAction 생성 execute() 메서드 호출
			action = new MemoReWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoListGet.me")) {
			// MemoListAction execute()
			action = new MemoListGetAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoDeleteGetAction.me")) {
			// MemoDeleteAction 생성 execute() 메서드 호출
			action = new MemoDeleteGetAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoDeleteGet.me")) {
			// MemoDeleteAction 생성 execute() 메서드 호출
			forward = new ActionForward();
			forward.setPath("./mypage/memo_deleteFormGet.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemoContentGet.me")) {
			// BoardContentAction execute()
			action = new MemoContentGetAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoListAll.me")) {
			// MemoListAction execute()
			action = new MemoListAllAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoContentAll.me")) {
			// BoardContentAction execute()
			action = new MemoContentAllAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoDeleteAllAction.me")) {
			// MemoDeleteAction 생성 execute() 메서드 호출
			action = new MemoDeleteAllAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemoDeleteAll.me")) {
			// MemoDeleteAction 생성 execute() 메서드 호출
			forward = new ActionForward();
			forward.setPath("./mypage/memo_deleteFormAll.jsp");
			forward.setRedirect(false);
		}

		// 이동하기
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	} // doProcess

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doProcess() 메서드 호출
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doProcess() 메서드 호출
		doProcess(request, response);
	}

}// MemoFrontController
