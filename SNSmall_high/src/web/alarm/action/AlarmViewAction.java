package web.alarm.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.alarm.db.AlarmDAO;

public class AlarmViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		AlarmDAO adao = new AlarmDAO();
		Map<String, Object> map = null;
		List<Map<String, Object>> list = adao.showAlarm(id);
		if(list.isEmpty()){
			
		}else{
			for(int i=0; i<list.size(); i++){
				map = list.get(i);
			}
			if(id.equals(map.get("id"))) {
				request.setAttribute("list", list);
		    }
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./inc/alarm_view.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
