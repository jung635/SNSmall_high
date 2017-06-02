package web.vendor.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;



public class vendorUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		VendorDAO vdao = new VendorDAO();
		response.setContentType("text/html; charset=UTF-8");
		
		VendorBean vb = new VendorBean();
		vb.setVendor_id(id);
		vb.setPass(request.getParameter("pass"));
		vb.setPerson_name(request.getParameter("name"));
		vb.setCompany_name(request.getParameter("company"));
		vb.setPhone(request.getParameter("phone"));
		String addre = request.getParameter("postcode")+"/"+request.getParameter("address")+"/"+request.getParameter("address2");
		vb.setAddress(addre);
		vdao.updateVendor(vb);
		
		HttpSession session = request.getSession();
		session.setAttribute("name", vb.getPerson_name());
		
		ActionForward forward = new ActionForward();
		forward.setPath("./vendorView.ve");
		forward.setRedirect(true);
		return forward;
	}
		
}
