package web.alarm.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		AlarmBean ab = new AlarmBean();
		ab.setContent("테스트 Content OFF2");//메세지 뜰 내용
		ab.setId("abc");//to Id
		ab.setMove("RankUp.al?rank=premium");//url
		AlarmDAO adao = new AlarmDAO();
		adao.insertAlarm(ab);
		return null;
	}

}
