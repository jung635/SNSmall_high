package web.qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.alarm.db.AlarmBean;
import web.alarm.db.AlarmDAO;
import web.qna.db.QnaBean;
import web.qna.db.QnaDAO;

public class QnaInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaInsertAction execute()");
		
		request.setCharacterEncoding("utf-8");

		String realPath = request.getRealPath("/qna_img");
		int maxSize = 5*1024*1024;
		MultipartRequest multi =
				new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String pageNum = request.getParameter("pageNum");
		int product_num = Integer.parseInt(multi.getParameter("product_num"));
		String client_id = multi.getParameter("client_id");
		String vendor_id = multi.getParameter("vendor_id");
		int stars = Integer.parseInt(multi.getParameter("stars"));
		QnaBean qnabean = new QnaBean();
		qnabean.setClient_id(client_id);
		qnabean.setProduct_num(product_num);
		qnabean.setContent(multi.getParameter("content"));
		qnabean.setQ_img(multi.getFilesystemName("q_img"));
		qnabean.setStars(stars);
		
		QnaDAO qnadao = new QnaDAO();
		int check = qnadao.checkClientId(client_id);
		
		//alarm 설정
		AlarmBean ab = new AlarmBean();
		ab.setContent(client_id+"님의 상품후기가 작성되었습니다.");
		ab.setId(vendor_id);
		ab.setMove("./ProductDetail.pr?product_num="+product_num+"&pageNum="+pageNum);
		AlarmDAO adao = new AlarmDAO();
		
		if(check==1){
			qnadao.insertQna(qnabean);
			adao.insertAlarm(ab);		//alarm insert
			ActionForward forward = new ActionForward();
			forward.setPath("./ProductDetail.pr?product_num="+product_num+"&pageNum="+pageNum);
			forward.setRedirect(true);
			return forward;
		} else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매자만 작성할 수 있습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
	}

}
