package web.alarm.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		AlarmBean ab = new AlarmBean();
		ab.setContent("테스트 Content");
		ab.setId(id);
		ab.setMove("memo");
		
		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);
		return null;
	}

}
