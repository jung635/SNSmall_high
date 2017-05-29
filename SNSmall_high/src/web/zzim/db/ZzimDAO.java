package web.zzim.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ZzimDAO {

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
	ResultSet rs2 = null;
	//찜리스트
	public List getZzimList(String id){
		
		List<ZzimBean> list = new ArrayList<ZzimBean>();
		try{
			con = getConnection();
			
			sql = "select * from zzim where client_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while (rs.next()){
				
				
				ZzimBean zb = new ZzimBean();
				zb.setClient_id(rs.getString("client_id"));
				zb.setProduct_num(Integer.parseInt(rs.getString("product_num")));
				zb.setSns_id(rs.getString("sns_id"));
				zb.setPrice(Integer.parseInt(rs.getString("price")));
				zb.setDate(rs.getDate("date"));
				
				sql = "select * from product where product_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, zb.getProduct_num());
				rs2 = pstmt.executeQuery();
				if(rs2.next()){
					zb.setSubject(rs2.getString("subject"));					
				}

				list.add(zb);
				
			}
		}catch (Exception e){
			e.printStackTrace();		
		}finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	} 
	//찜 삭제
	public void ZzimDelete(String client_id,String product_num){
		
		try{
			con = getConnection();
			sql = "delete from zzim where client_id=? && product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, client_id);
			pstmt.setString(2, product_num);
			pstmt.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();		
		}finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return ;
	}
	//찜 추가
	public void ZzimAddAction(ZzimBean zb){
		try{
			con = getConnection();
			sql="insert into zzim values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,zb.getProduct_num());
			pstmt.setString(2, zb.getSns_id());
			pstmt.setString(3,zb.getClient_id());
			pstmt.setInt(4,zb.getPrice());
			pstmt.executeUpdate();
			
		}catch (Exception e){
			e.printStackTrace();		
		}finally{
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	public int ZzimCheckAction(String id,int product_num){
		int check=0;
		try{
			
			con = getConnection();
			sql = "select * from zzim where client_id=? and product_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, product_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				check=1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return check;
	}
}
