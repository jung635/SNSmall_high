package web.alarm.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class AlarmDAO {
	
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
	
	public List<Map<String, Object>> showAlarm(String id){
		Map<String, Object> map = null;
		List<Map<String, Object>> list = new ArrayList<>();
		try{
			con = getConnection();
			sql = "select * from alarm where id=? order by date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				map = new HashMap<>();
				map.put("id", id);
				map.put("content", rs.getString("content"));
				map.put("num", rs.getInt("num"));
				map.put("state", rs.getString("state"));
				map.put("move", rs.getString("move"));
				map.put("date", rs.getTimestamp("date"));
				list.add(map);
			}
				
		}catch (Exception e){System.out.println("DB연결 실패(passModify)" + e);}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		return list;
	}
	
	public List<Map<String, Object>> alertAlarm(String id){
		Map<String, Object> map = null;
		List<Map<String, Object>> list = new ArrayList<>();
		try{
			con = getConnection();
			sql = "select * from alarm where id=? and state = 'now' order by date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				map = new HashMap<>();
				map.put("id", id);
				map.put("content", rs.getString("content"));
				map.put("num", rs.getInt("num"));
				map.put("state", rs.getString("state"));
				map.put("move", rs.getString("move"));
				map.put("date", rs.getTimestamp("date"));
				list.add(map);
			}
				
		}catch (Exception e){System.out.println("DB연결 실패(passModify)" + e);}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		return list;
	}

	
	
	
	public void insertAlarm(AlarmBean ab){
		int max = 0;
		try{
			con = getConnection();

			sql = "select max(num) from alarm";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				max = rs.getInt(1);
			}
			sql = "insert into alarm(num, content, state, id, move, date) values (?,?,'now',?,?,now()) ;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, max+1);
			pstmt.setString(2, ab.getContent());
			pstmt.setString(3, ab.getId());
			pstmt.setString(4, ab.getMove());
			pstmt.executeUpdate();
				
		}catch (Exception e){e.printStackTrace();;}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	}
	
	public void  updateToOn(String id, int num){
		try{
			con = getConnection();

			sql = "update alarm set state = 'on' where id = ? and num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
				
		}catch (Exception e){e.printStackTrace();;}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}
	

}
