package web.live.action;

import java.util.ArrayList;
import java.util.HashMap;
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

public class LiveListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LiveDAO ldao = new LiveDAO();
		SnsDAO sdao = new SnsDAO();
		Map<LiveBean, ProductBean> map = ldao.getLive();
		List<SnsBean> list = new ArrayList<>();
		for(LiveBean key : map.keySet()){
			LiveBean lb = key;
			SnsBean sb = sdao.getSnsDetail(lb.getSns_id());
			list.add(sb);
		}		
		request.setAttribute("map", map);
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setPath("./live/liveList.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
