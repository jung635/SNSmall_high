package web.live.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class StarLiveListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sns_id = request.getParameter("sns_id");
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
		ActionForward forward = new ActionForward();
		forward.setPath("./live/starLiveList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
