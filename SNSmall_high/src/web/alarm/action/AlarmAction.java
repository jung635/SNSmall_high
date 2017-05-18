package web.alarm.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import web.alarm.db.AlarmDAO;


public class AlarmAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		AlarmDAO adao = new AlarmDAO();
		Map<String, Object> map = null;
		List<Map<String, Object>> list = adao.alertAlarm(id);
		for(int i=0; i<list.size(); i++){
			map = list.get(i);
			timestamp = (Timestamp)map.get("date");
			System.out.println("time"+timestamp);
	
		if(id.equals(map.get("id"))&&map != null) {
			if((System.currentTimeMillis()-timestamp.getTime())>3*1000) {  
		        adao.updateToOn(id, (int)map.get("num"));
		    }
			request.setAttribute("list", list);
	    }else if((System.currentTimeMillis()-timestamp.getTime())>5*1000) {  
	        adao.updateToOn(id, (int)map.get("num"));
	    }
		}




		
		ActionForward forward = new ActionForward();
		forward.setPath("./inc/alarm_alert.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
