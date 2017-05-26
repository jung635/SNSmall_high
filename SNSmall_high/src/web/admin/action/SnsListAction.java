package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SnsDAO sdao = new SnsDAO();
		String category = request.getParameter("category");
		if(category == null) category = "all";
		String order = request.getParameter("order");
		if(order == null) order = "sell";
		String rank = request.getParameter("rank");
		if(rank == null) order = "all";
		int count = sdao.getListCount(category, rank);
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
		
		start = (pageSize*(currentPage-1));
		end = start+pageSize-1;  
		System.out.println(pageNum);
		List<Object> list = null ;
	 	if(count!=0){
	 		list = sdao.snsList(start, pageSize, category, order);
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
	 	request.setAttribute("category", category);
	 	request.setAttribute("order", order);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/snsList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}