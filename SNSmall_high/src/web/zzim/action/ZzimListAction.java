package web.zzim.action;

import java.io.PrintWriter;
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(id==null){
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		
		ZzimDAO zdao = new ZzimDAO();  
		List<ZzimBean> list= zdao.getZzimList(id); //id에 해당하는 찜 리스트 가져오기
		request.setAttribute("list", list);
		
		ActionForward forward =new ActionForward();
		forward.setPath("./zzim/zzim_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
