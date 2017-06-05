package web.sns.action;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sns_id = request.getParameter("sns_id");

		int all_price = 0;
		int all_amount = 0;
		int all_price_allstar = 0;
		int all_price_catstar = 0;
		int all_amount_allstar = 0;
		int all_amount_catstar = 0;
		int all_price_rank = 0;
		int cat_price_rank = 0;
		int all_amount_rank = 0;
		int cat_amount_rank = 0;
		int rank_percent = 0;
		int latest_size = 0;
		int popular_size = 0;
		
		SnsDAO sdao = new SnsDAO();
	
		//디테일 정보
		SnsBean sb = sdao.getSnsDetail(sns_id);
		
		//최근, 가장 많이 판매한 리스트
		List<Integer> latest_list = sdao.snsProductList(sns_id, "date");
		List<Integer> popular_list = sdao.snsProductList(sns_id, "sell");
		
		//전체 가격, 총 량 랭크 계산
		List<PaymentBean> payment_list = sdao.snsProductList(sns_id);
		PaymentBean pb;
		for(int i=0; i<payment_list.size(); i++){
			pb = payment_list.get(i);
			all_price += pb.getPay_price();
			all_amount += pb.getAmount();
		}

		List<PaymentBean> payment_list_allstar = sdao.snsProductList();
		for(int i=0; i<payment_list_allstar.size(); i++){
			pb = payment_list_allstar.get(i);
			all_price_allstar += pb.getPay_price();
			all_amount_allstar += pb.getAmount();
		}
		

		
		//카테고리 내 가격, 총 량 랭크 계산
		List<PaymentBean> payment_list_catstar = sdao.snsProductListByCat(sb.getCategory());
		for(int i=0; i<payment_list_catstar.size(); i++){
			pb = payment_list_catstar.get(i);
			all_price_catstar += pb.getPay_price();
			all_amount_catstar += pb.getAmount();
		}
		
		all_price_rank = (int)((double)all_price/(double)all_price_allstar*100);
		cat_price_rank = (int)((double)all_price/(double)all_price_catstar*100);
		all_amount_rank = (int)((double)all_amount/(double)all_amount_allstar*100);
		cat_amount_rank = (int)((double)all_amount/(double)all_amount_catstar*100);
		
		//rank 퍼센트
		if(sb.getRank().equals("basic")){
			rank_percent = 30;
		}else if(sb.getRank().equals("plus")){
			rank_percent = 70;
		}else{
			rank_percent = 100;
		}
		latest_size = (latest_list.size()>4) ? 4:latest_list.size();
		popular_size = (popular_list.size()>4) ? 4:popular_list.size();

		request.setAttribute("sb", sb);
		request.setAttribute("latest_size", latest_size);
		request.setAttribute("popular_size", popular_size);
		request.setAttribute("all_price_rank", all_price_rank);
		request.setAttribute("cat_price_rank", cat_price_rank);
		request.setAttribute("all_amount_rank", all_amount_rank);
		request.setAttribute("cat_amount_rank", cat_amount_rank);
		request.setAttribute("latest_list", latest_list);
		request.setAttribute("popular_list", popular_list);
		request.setAttribute("rank_percent", rank_percent);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./sns_star/detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
