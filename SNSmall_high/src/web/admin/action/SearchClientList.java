package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientBean;
import web.client.db.ClientDAO;

public class SearchClientList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ClientDAO cdao = new ClientDAO();
		String search = request.getParameter("search");
		int count = cdao.getListCountForSearch(search);
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum="1";
		int currentPage=Integer.parseInt(pageNum);
		int pageSize = 12;
		int start = 0;
		int end = 0;
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock=10;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
//		start = (pageSize*(currentPage-1));
		start = (currentPage-1)*pageSize+1;
		end = start+pageSize-1;  
		
		List<ClientBean> list = null ;
	 	if(count!=0){
	 		list = cdao.getClientList(start, pageSize, search);
		} 
	 	
	 	request.setAttribute("list", list);
	 	request.setAttribute("count", count);
	 	request.setAttribute("pageSize", pageSize);
	 	request.setAttribute("pageNum", pageNum);
	 	request.setAttribute("start", start);
	 	request.setAttribute("end", end);
	 	request.setAttribute("pageCount", pageCount);
	 	request.setAttribute("pageBlock", pageBlock);
	 	request.setAttribute("startPage", startPage);
	 	request.setAttribute("endPage", endPage);
	 	request.setAttribute("search", search);
	 	
	 	ActionForward forward = new ActionForward();
	 	forward.setPath("./admin/clientList.jsp");
	 	forward.setRedirect(false);
		return forward;

	}

}
