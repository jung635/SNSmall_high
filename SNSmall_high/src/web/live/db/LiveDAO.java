package web.live.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.payment.db.PaymentBean;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class LiveDAO {

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
	
	
	public void productOnUpdate(int product_num) {
		try {
			con = getConnection();
			sql = "update product set live_state='on' where product_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	public void productOffUpdate(int product_num) {
		try {
			con = getConnection();
			sql = "update product set live_state='off' where product_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	public void insertLive(String sns_id, String video_id, int product_num, String token, String title) {
		try {
			con = getConnection();
			sql = "insert into live(id, video_id, product_num, token, date, title, url, state, view) values(?, ?, ?, ?, now(), ?, ?, ?, ?); ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sns_id);
			pstmt.setString(2, video_id);
			pstmt.setInt(3, product_num);
			pstmt.setString(4, token);
			pstmt.setString(5, title);
			pstmt.setString(6, "LIVE");
			pstmt.setString(7, "LIVE");
			pstmt.setInt(8, 0);
			pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	public Map<LiveBean, ProductBean> getLive() {
		Map<LiveBean, ProductBean> map = new HashMap<>();
		LiveBean lb = null;
		ProductBean prob = null;
		ProductDAO prodao = new ProductDAO();
		try {
			con = getConnection();
			sql = "select * from live where state = 'LIVE' order by date desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				lb = new LiveBean();
				lb.setSns_id(rs.getString("id"));
				lb.setVideo_id(rs.getString("video_id"));
				lb.setProduct_num(rs.getInt("product_num"));
				lb.setToken(rs.getString("token"));
				lb.setDate(rs.getTimestamp("date"));
				lb.setTitle(rs.getString("title"));
				lb.setUrl(rs.getString("url"));
				lb.setState(rs.getString("state"));
				lb.setView(rs.getInt("view"));
				prob = prodao.getProduct(lb.getProduct_num());
				
				
				map.put(lb, prob);
			}

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}

		return map;
	}
	
	public Map<LiveBean, ProductBean> getVod() {
		Map<LiveBean, ProductBean> map = new HashMap<>();
		LiveBean lb = null;
		ProductBean prob = null;
		ProductDAO prodao = new ProductDAO();
		try {
			con = getConnection();
			sql = "select * from live where state = 'VOD' order by view desc limit 10";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				lb = new LiveBean();
				lb.setSns_id(rs.getString("id"));
				lb.setVideo_id(rs.getString("video_id"));
				lb.setProduct_num(rs.getInt("product_num"));
				lb.setToken(rs.getString("token"));
				lb.setDate(rs.getTimestamp("date"));
				lb.setTitle(rs.getString("title"));
				lb.setUrl(rs.getString("url"));
				lb.setState(rs.getString("state"));
				lb.setView(rs.getInt("view"));
				prob = prodao.getProduct(lb.getProduct_num());
				
				
				map.put(lb, prob);
			}
			
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
		
		return map;
	}
	
	public void deleteLive(String video_id, String url){
		try {
			con = getConnection();
			sql = "update live set state='VOD', url=? where video_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, url);
			pstmt.setString(2, video_id);
			pstmt.executeUpdate();

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	public void viewUp(String video_id){
		try {
			con = getConnection();
			sql = "update live set view = view+1 where video_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, video_id);
			pstmt.executeUpdate();

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	
}
