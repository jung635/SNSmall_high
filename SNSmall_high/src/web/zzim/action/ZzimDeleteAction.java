package web.zzim.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.zzim.db.ZzimDAO;

public class ZzimDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String product_num = request.getParameter("product_num");
		String client_id = "test";
		ZzimDAO zdao = new ZzimDAO();
		zdao.ZzimDelete(client_id, product_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ZzimList.zz");
		forward.setRedirect(true);
		
		return forward;
	}

}
