package web.live.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class StarLiveListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String sns_id = "";
		if(request.getParameter("sns_id")==null){
			sns_id = (String)session.getAttribute("id");
			forward.setPath("./mypage/snsLiveList.jsp");
		}else{
			sns_id = request.getParameter("sns_id");
			forward.setPath("./live/starLiveList.jsp");
		}

		LiveDAO ldao = new LiveDAO();
		ProductDAO prodao = new ProductDAO();
		LiveBean lb = ldao.getSnsLive(sns_id);
		SnsDAO sdao = new SnsDAO();
		Map<LiveBean, ProductBean> vod_map = ldao.getSnsVod(sns_id);
		ProductBean prob = null;
		if(lb != null){
			prob = prodao.getProduct(lb.getProduct_num());
		}
		
		SnsBean sb = sdao.getSnsDetail(sns_id);
		
		request.setAttribute("sb", sb);
		request.setAttribute("prob", prob);
		request.setAttribute("lb", lb);
		request.setAttribute("vod_map", vod_map);
		
		forward.setRedirect(false);
		return forward;
	}

}
