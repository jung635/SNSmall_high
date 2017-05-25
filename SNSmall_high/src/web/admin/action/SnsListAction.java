package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SnsDAO sdao = new SnsDAO();
		List<SnsBean> list = sdao.getPaymentList();
		
		request.setAttribute("sns_list", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/snsList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
