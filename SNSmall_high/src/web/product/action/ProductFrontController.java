package web.product.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/ProductDetail.pr")){
			action = new ProductDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/ProductUpdate.pr")){
			action = new ProductUpdateForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/ProductUpdateAction.pr")){
			action = new ProductUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}			
			
		}else if(command.equals("/ProductInsert.pr")){
			forward = new ActionForward();
			forward.setPath("./product/productInsertForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/ProductInsertAction.pr")){
			action = new ProductInsertAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/ProductList.pr")){
			action = new ProductListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/ProductDelete.pr")){
			action = new ProductDeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){e.printStackTrace();}
			
		}else if(command.equals("/ProductSearchList.pr")){
			action = new ProductSearchListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {e.printStackTrace();}
			
		}
		
		
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
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
