package web.cart.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CartDAO {

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
	
public List<CartBean> getCartList(String client_id){
		
		List<CartBean> CartList = new ArrayList<CartBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql="";
		ResultSet rs = null;
		ResultSet rs2 = null;
		try{
			
			//1,2단계
			con=getConnection();
			sql="select * from cart where client_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,client_id);


			rs=pstmt.executeQuery();

			while(rs.next()){
				sql="select subject,main_img from product where product_num=?";
				pstmt2=con.prepareStatement(sql);
				
				int product_num = rs.getInt("product_num");
				pstmt2.setInt(1, product_num);
				
				
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()){
				CartBean cb = new CartBean();
				
				cb.setProduct_num(rs.getInt("product_num"));
				//cb.setSns_id(rs.getString("sns_id"));
				cb.setVendor_id(rs.getString("vendor_id"));
				//cb.setMain_img();
				cb.setAmount(rs.getInt("amount"));
				cb.setPrice(rs.getInt("price"));
				cb.setOption1(rs.getString("option1"));
				cb.setOption2(rs.getString("option2"));
				cb.setOption3(rs.getString("option3"));
				cb.setDate(rs.getDate("date"));
				
				cb.setSubject(rs2.getString("subject"));
				cb.setMain_img(rs2.getString("main_img"));
				CartList.add(cb);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null){try {rs.close();}catch(SQLException ex){}}
			if(rs2!=null){try {rs2.close();}catch(SQLException ex){}}
			if(pstmt!=null){try {pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try {con.close();}catch(SQLException ex) {}}
		}
		
		return CartList;
	}

	//장바구니에 추가하기
	public void CartAdd(CartBean cb){
		try{
			con = getConnection();
			
			
			
			sql = "insert into cart values(?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cb.getProduct_num());
			pstmt.setString(2, cb.getSns_id());
			pstmt.setString(3, cb.getClient_id());
			pstmt.setString(4, cb.getVendor_id());
			pstmt.setString(5, cb.getOption1());
			pstmt.setString(6, cb.getOption2());
			pstmt.setString(7, cb.getOption3());
			pstmt.setInt(8, cb.getAmount());
			pstmt.setInt(9, cb.getPrice());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null){try {rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try {pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try {con.close();}catch(SQLException ex) {}}
		}

	}//add end
	
	//cart delete
	public void CartDelete(String client_id,int product_num){
		try{
			con = getConnection();
			sql = "delete from cart where client_id=? && product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, client_id);
			pstmt.setInt(2, product_num);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null){try {rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try {pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try {con.close();}catch(SQLException ex) {}}
		}

	}

	
}
