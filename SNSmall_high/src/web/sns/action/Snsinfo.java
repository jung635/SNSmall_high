package web.sns.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class Snsinfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String type = (String) session.getAttribute("type");

		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./login.ve");
			forward.setRedirect(true);
			return forward;
		}
		SnsDAO sdao = new SnsDAO();
		SnsBean sb = sdao.getSnsDetail(id);

		request.setAttribute("sb", sb);
		// request.setAttribute("type", type);
		// request.setAttribute("id", id);

		forward.setPath("./mypage/mypage_sns.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
