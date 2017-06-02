package web.live.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.payment.db.PaymentBean;

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
	
	
	public void insertLive(String sns_id) {
		try {
			con = getConnection();
			sql = "insert into live(id) values(?); ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sns_id);
			pstmt.executeUpdate();
			
		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}
	}
	
	public List<LiveBean> getLive() {
		List<LiveBean> list = new ArrayList<>();
		LiveBean lb = null;
		try {
			con = getConnection();
			sql = "select * from live";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				lb = new LiveBean();
				lb.setSns_id(rs.getString("id"));
				list.add(lb);
			}

		} catch(Exception e){e.printStackTrace();}
		finally{if(rs!=null){try{rs.close();}catch(SQLException ex){}}
		if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
		if(con!=null){try{con.close();}catch(SQLException ex){}}}

		return list;
	}
}
