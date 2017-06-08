package web.live.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.live.db.LiveBean;
import web.live.db.LiveDAO;
import web.product.db.ProductBean;

public class LiveDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String video_id = request.getParameter("video_id");
		String url = request.getParameter("url");
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		LiveDAO ldao = new LiveDAO();
		boolean liveIng_check = false;
		ldao.deleteLive(video_id, url);
		Map<LiveBean, ProductBean> map = ldao.getLive();
		for(LiveBean key : map.keySet()){
			LiveBean lb = key;
			ProductBean prob = map.get(key);
			if(lb.getProduct_num()==product_num){
				if(lb.getVideo_id().equals(video_id)){
				}else{
					System.out.println(lb.getTitle());
					liveIng_check = true;
				}
			}
		}
		
		if(!liveIng_check){
			ldao.productOffUpdate(product_num);
			
		}
		
		
		out.println("<script>");
		out.println("window.close();");
		out.println("</script>");
		return null;
	}

}
