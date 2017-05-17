package web.client.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.AlarmBean;
import web.client.db.ClientDAO;

public class AlarmAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ClientDAO cdao = new ClientDAO();
		List<Object> list = cdao.showAlarm(id);
		
		if(id.equals(list.get(0))) {
			out.println("쪽지옴");
			
	    }

		return null;
	}

}
