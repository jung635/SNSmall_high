package web.vendor.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;

public class vendorView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		VendorDAO vdao = new VendorDAO();
		VendorBean vb = vdao.getVendor(id);
		String postcode = vb.getAddress().split("/")[0];
		System.out.println(vb.getAddress());		
		String address = vb.getAddress().split("/")[1];
		System.out.println(address);
		String address2 = vb.getAddress().split("/")[2];
		System.out.println(address2);
		
		request.setAttribute("postcode", postcode);
		request.setAttribute("address", address);
		request.setAttribute("address2", address2);
		request.setAttribute("vb", vb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/vendor/vendorView.jsp");
		forward.setRedirect(false);			
		return forward;
	}
}