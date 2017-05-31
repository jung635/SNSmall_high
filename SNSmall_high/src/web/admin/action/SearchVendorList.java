package web.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;

public class SearchVendorList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		VendorDAO vdao = new VendorDAO();
		String search = request.getParameter("search");
		int count = vdao.getListCount(search);
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
		
		List<VendorBean> list = null ;
	 	if(count!=0){
	 		list = vdao.getVendorList(start, pageSize, search);
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
	 	forward.setPath("./admin/vendorList.jsp");
	 	forward.setRedirect(false);
		return forward;

	}

}