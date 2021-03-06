package web.payment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.client.db.ClientBean;
import web.product.db.ProductBean;
import web.sns.db.SnsBean;

public class PaymentDAO {

Connection con = null;
	
	private Connection getConnection() throws Exception{

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}	//getConnection()
	
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	
	
	public void insertPay(List<PaymentBean> list_pb, String state) {
		PaymentBean pb = null;
		int max = 0;
		try {
			con = getConnection();
			sql = "select max(num) from payment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				max = rs.getInt(1);
			}

			sql = "insert into payment(order_num, product_num, sns_id, vendor_id, client_id, amount, message, date, num, option1, option2, option3, state, usedPoint) "
					+ "values(?,?,?,?,?,?,?,now(),?,?,?,?,?,?); ";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < list_pb.size(); i++) {
				pb = (PaymentBean) list_pb.get(i);
				pstmt.setString(1, pb.getOrder_num());
				pstmt.setInt(2, pb.getProduct_num());
				pstmt.setString(3, pb.getSns_id());
				pstmt.setString(4, pb.getVendor_id());
				pstmt.setString(5, pb.getClient_id());
				pstmt.setInt(6, pb.getAmount());
				pstmt.setString(7, pb.getMessage());
				pstmt.setInt(8, max + i + 1);
				pstmt.setString(9, pb.getOption1());
				pstmt.setString(10, pb.getOption2());
				pstmt.setString(11, pb.getOption3());
				pstmt.setString(12, state);
				pstmt.setInt(13, pb.getUsedPoint());
				pstmt.executeUpdate();
			}
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	public void depositPay(int num) {
		try {
			con = getConnection();
			sql = "update payment set state='payDone' where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void deletePay(int num) {
		try {
			con = getConnection();
			sql = "update payment set state='cancel' where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void deletePay(String order_num) {
		try {
			con = getConnection();
			sql = "update payment set state='cancel' where order_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_num);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void deletePayRequest(String order_num) {
		try {
			con = getConnection();
			sql = "update payment set state='cancelHold' where order_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_num);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void deletePayRequest(int num) {
		try {
			con = getConnection();
			sql = "update payment set state='cancelHold' where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void subPoint(int point, String id) {
		try {
			con = getConnection();
			sql = "update client set point=point-? where client_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void addPoint(int point, String id) {
		try {
			con = getConnection();
			sql = "update client set point=point+? where client_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public int usingPoint(int point, String id) {
		int usedPoint = 0;
		try {
			con = getConnection();
			sql = "select point from client where client_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				usedPoint = rs.getInt(1) - point;
			}
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		
		return usedPoint;
	}

	public void addSnsPay(int price, String sns_id) {
		try {
			con = getConnection();
			int profit = (int) (price * 0.01);
			sql = "update sns set sns_profit=sns_profit+?, sell=sell+1 where sns_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, sns_id);
			pstmt.executeUpdate();

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void subSnsPay(int profit, String sns_id) {
		try {
			con = getConnection();
			sql = "update sns set sns_profit=sns_profit-?, sell=sell-1 where sns_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, sns_id);
			pstmt.executeUpdate();

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void addVendorProfit(int profit, String vendor_id) {
		try {
			con = getConnection();
			sql = "update vendor set vendor_profit=vendor_profit+? where vendor_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, vendor_id);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void subVendorProfit(int price, String vendor_id) {
		try {
			con = getConnection();
			int profit = (int) (price * 0.01);
			sql = "update vendor set vendor_profit=vendor_profit-? where vendor_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, vendor_id);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public void subAmount(int amount, int product_num) {
		try {
			con = getConnection();
			sql = "update product set amount=amount-?, count=count+? where product_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, amount);
			pstmt.setInt(3, product_num);
			pstmt.executeUpdate();
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}

	public List<PaymentBean> getPayment(String order_num) {
		List<PaymentBean> list = new ArrayList<>();
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "select * from payment where order_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

				list.add(pb);
			}

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}

		return list;
	}

	public PaymentBean getPaymentByNum(int num) {
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "select * from payment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));
				pb.setClient_id(rs.getString("client_id"));

			}

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}

		return pb;
	}

	public List<PaymentBean> getPaymentById(String client_id) {
		List<PaymentBean> list = new ArrayList<>();
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "select * from payment where client_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, client_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

				list.add(pb);
			}

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		return list;
	}


	// getPaymentBean 아이디,start,pageSize, order로 찾음
	public List<PaymentBean> getPaymentById(int pageSize, String client_id, String method) {
		List<PaymentBean> list = new ArrayList<PaymentBean>();
		StringBuffer sql = new StringBuffer("select * from payment where client_id = ? and ");
		PaymentBean pb = null;
		try {
			con = getConnection();
			if (method.equals("payDone")) {
				sql.append("state = 'payDone' or state = 'delivery' or state = 'cancelHold' or state = 'waiting'");
			} else if (method.equals("done")) {
				sql.append("state = 'done'");
			} else if (method.equals("delivery")) {
				sql.append("state = 'delivery'");
			} else if (method.equals("cancelHold")) {
				sql.append("state = 'cancelHold'");
			} else if (method.equals("waiting")) {
				sql.append("state = 'waiting'");
			}
			sql.append(" order by date desc limit ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, client_id);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

				list.add(pb);
			}
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		return list;
	}
	
	// getorderNum 아이디,start,pageSize, order로 찾음
	public List<String> getOrderNumList(int pageSize, String client_id, String method) {
		List<String> list = new ArrayList<String>();
		StringBuffer sql = new StringBuffer("select order_num from payment where client_id = ? and ");
		String order_num = "";
		try {
			con = getConnection();
			if (method.equals("payDone")) {
				sql.append("state = 'payDone' or state = 'delivery' or state = 'cancelHold' or state = 'waiting'");
			} else if (method.equals("done")) {
				sql.append("state = 'done'");
			} else if (method.equals("delivery")) {
				sql.append("state = 'delivery'");
			} else if (method.equals("cancelHold")) {
				sql.append("state = 'cancelHold'");
			} else if (method.equals("waiting")) {
				sql.append("state = 'waiting'");
			}
			sql.append(" group by order_num order by date desc limit ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, client_id);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				order_num = rs.getString(1);
				list.add(order_num);
			}
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		return list;
	}
	
	// 전체 글의 개수 구하기 getPaymentCount()----------------------------------------------------------------
	public int getPaymentCount(){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;

		try{
			//1, 2 디비연결 메서드 호출
			con=getConnection();	
			//3. sql함수 count(*) 구하기
			sql = "select count(*) from payment where sns_id='wndms4142'";
			pstmt=con.prepareStatement(sql);
			//4. rs 실행저장
			rs = pstmt.executeQuery();
			//5. rs 데이터 있으면 count 저장
			if(rs.next()){
				count = rs.getInt(1);
				System.out.println("count : "+count);
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally{
			//예외 상관없이 마무리 작업
			//객체 생성 닫기
			if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try{con.close();}catch(SQLException ex){}}
		}
		return count;
	}//getPaymentCount()				
					
					
	//getPaymentList()
	public List getPaymentList(String snsState, String id, int startRow, int pageSize) {
		//배열(컬렉션) 객체 생성 - 여러개의 기억공간 사용+기억공간 추가해서 사용
		List paymentList=new ArrayList();
					
		try{
			con=getConnection();
			//3. sql member 모든 데이터 가져오기
			if(snsState!=null){
			sql="select * from payment where state=? and sns_id=? limit ?,?";
			System.out.println("snsState : "+snsState);
			System.out.println("id : "+id);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, snsState); //첫번째 물음표 1, snsState 상태에 입력될 값
			pstmt.setString(2, id);
			pstmt.setInt(3, startRow-1); //시작행 -1
			pstmt.setInt(4, pageSize); //몇개글
			}else{
				
			sql="select * from payment where state='done' or state='cancel' and sns_id=? limit ?,?";
			System.out.println("id : "+id);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow-1); //시작행 -1
			pstmt.setInt(3, pageSize); //몇개글
			}
			rs=pstmt.executeQuery();
			while(rs.next()){ //첫행 데이터 있으면  true
				PaymentBean pab = new PaymentBean();
				// 자바빈 한사람 저장 객체 생성
				pab.setSns_id(rs.getString("sns_id"));
				pab.setProduct_num(rs.getInt("num"));
				pab.setAmount(rs.getInt("amount"));
				pab.setMessage(rs.getString("message"));
				pab.setDate(rs.getDate("date"));
				pab.setOrder_num(rs.getString("order_num"));
				pab.setOption1(rs.getString("option1"));
				pab.setOption2(rs.getString("option2"));
				pab.setOption3(rs.getString("option3"));
				pab.setUsedPoint(rs.getInt("usedPoint"));
				pab.setState(rs.getString("state"));
				//한사람의 데이터 => paymentList 한칸 저장
				paymentList.add(pab);
			}
			//		자바빈 객체 생성 PaymentBean pab
			//		pab  id 멤버변수 <= rs에 id열에 해당하는 데이터 저장
			//	pab주소값을 paymentList 한칸에 저장
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try{con.close();}catch(SQLException ex){}}}
		
		return paymentList;
	}//getPaymentList(String snsState)
	public List<PaymentBean> getVendorPaymentById(int pageSize, String vendor_id, String method) {
		List<PaymentBean> list = new ArrayList<PaymentBean>();
		StringBuffer sql = new StringBuffer("select * from payment where vendor_id = ? and ");
		PaymentBean pb = null;
		try {
			con = getConnection();
			if (method.equals("payDone")) {
				sql.append("state = 'payDone' or state = 'delivery' or state = 'cancelHold' or state = 'waiting'");
			} else if (method.equals("done")) {
				sql.append("state = 'done'");
			} else if (method.equals("delivery")) {
				sql.append("state = 'delivery'");
			} else if (method.equals("cancelHold")) {
				sql.append("state = 'cancelHold'");
			} else if (method.equals("waiting")) {
				sql.append("state = 'waiting'");
			}else if (method.equals("cancel")) {
				sql.append("state = 'cancel'");
			}
			sql.append(" order by date desc limit ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vendor_id);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

				list.add(pb);
			}
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		return list;
	}
	
	// getorderNum 아이디,start,pageSize, order로 찾음 ----vendor
	public List<String> getVendorOrderNumList(int pageSize, String vendor_id, String method) {
		List<String> list = new ArrayList<String>();
		StringBuffer sql = new StringBuffer("select order_num from payment where vendor_id = ? and ");
		String order_num = "";
		try {
			con = getConnection();
			if (method.equals("payDone")) {
				sql.append("state = 'payDone' or state = 'delivery' or state = 'cancelHold' or state = 'waiting' or state = 'cancel'");
			} else if (method.equals("done")) {
				sql.append("state = 'done'");
			} else if (method.equals("delivery")) {
				sql.append("state = 'delivery'");
			} else if (method.equals("cancelHold")) {
				sql.append("state = 'cancelHold'");
			} else if (method.equals("waiting")) {
				sql.append("state = 'waiting'");
			}else if (method.equals("cancel")) {
				sql.append("state = 'cancel'");
			}
			sql.append(" group by order_num order by date desc limit ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vendor_id);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				order_num = rs.getString(1);
				list.add(order_num);
			}
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		return list;
	}

	public void PayDeliveryAction(String num){
		
		try{
			con = getConnection();
			sql = "update payment set state='done' where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
	
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	}
	
	public void PayWaitingAction(String num){
		
		try{
			con = getConnection();
			sql = "update payment set state='payDone' where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
	
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	}
	
	
}
