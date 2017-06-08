package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientDAO;
import web.client.db.MemberTypeBean;

public class SearchPass_IdSend implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		ActionForward forward = new ActionForward();
		forward.setPath("./member/phone_auth2.jsp");
		forward.setRedirect(false);
		return forward;
		}		
	}