package web.zzim.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.zzim.db.ZzimBean;

public class ZzimAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		ZzimBean zb = new ZzimBean();
		zb.setProduct_num(product_num);
		
		
		return null;
	}

}
