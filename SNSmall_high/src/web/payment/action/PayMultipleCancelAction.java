package web.payment.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayMultipleCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		PaymentDAO pdao = new PaymentDAO();
		String order_num = request.getParameter("order_num");
		List<PaymentBean> pb_list = pdao.getPayment(order_num);
		PaymentBean pb = null;
		if(pb_list.get(0).getUsedPoint()>0){
			for(int i=0; i<pb_list.size(); i++){
				pb = pb_list.get(i);
					if(pb.getState().equals("waiting")){
						pdao.deletePayRequestWaiting(pb.getNum());
					}else{
						pdao.deletePayRequest(pb.getNum());
					}
			}
			out.println("<script>");
			out.println("alert('포인트를 사용한 배송은 해당 상품 퍼센트에 해당하는 포인트만 돌려받을 수 있습니다.');");
			out.println("location.href='PayPointCancel.pa?merchant_uid=" + pb.getOrder_num() + "&num="+pb.getProduct_num()+"';");
			out.println("</script>");
		}else{
			for(int i=0; i<pb_list.size(); i++){
				pb = pb_list.get(i);
					if(pb.getState().equals("waiting")){
						pdao.deletePayRequestWaiting(pb.getNum());
					}else{
						pdao.deletePayRequest(pb.getNum());
					}
			}
			out.println("<script>");
			out.println("alert('취소 신청이 완료되었습니다.');");
			out.println("location.href='PayList.pa';");
			out.println("</script>");
		}
		
		


		//pdao.deletePayRequest(order_num);
/*		out.println("<script>");
		out.println("alert('취소 신청이 완료되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");*/

		return null;
	}

}
