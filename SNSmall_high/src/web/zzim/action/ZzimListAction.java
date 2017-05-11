package web.zzim.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.zzim.db.ZzimBean;
import web.zzim.db.ZzimDAO;

public class ZzimListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ZzimListAction");
		
		
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("id"); 
		
		id="test";		
		
		
		ZzimDAO zdao = new ZzimDAO();  
		List<ZzimBean> list= zdao.getZzimList(id); //id에 해당하는 찜 리스트 가져오기
		request.setAttribute("list", list);
		
		ActionForward forward =new ActionForward();
		forward.setPath("./zzim/zzim_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
