package web.alarm.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.alarm.db.AlarmDAO;

public class AlarmListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int limit = 0;
		if(request.getParameter("limit")==null) limit=20;
		else limit = Integer.parseInt(request.getParameter("limit"));
		AlarmDAO adao = new AlarmDAO();
		Map<String, Object> map = null;
		List<Map<String, Object>> list = adao.alarmList(id, limit);
		ActionForward forward = null;
			request.setAttribute("list", list);
			request.setAttribute("limit", limit);
			forward = new ActionForward();
			forward.setPath("./mypage/alarmInnerList.jsp");
			forward.setRedirect(false);
			
		return forward;

	}
}
