package web.reply.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	
	private Connection getConnection() throws Exception{

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}	//getConnection()	
	
	//댓글등록
	public void insertReply(ReplyBean rb){
		int num = 0;
		try{
			con = getConnection();
			sql = "select max(num) from reply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1)+1;
			sql = "insert into reply(num,id,content,re_ref,re_lev,re_seq,date)"
					+ "value(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, rb.getId());
			pstmt.setString(3, rb.getContent());
			pstmt.setInt(4, rb.getRe_ref());
			pstmt.setInt(5, rb.getRe_lev());
			pstmt.setInt(6, rb.getRe_seq());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
	}
	
	// 댓글 목록 가져오기
	public List<ReplyBean> getReplyList(int num){
		List<ReplyBean>  replyList = new ArrayList<ReplyBean>();
		try{
			con = getConnection();
			sql = "select * from reply where re_ref=? order by num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ReplyBean rb = new ReplyBean();
				rb.setNum(rs.getInt(1));
				rb.setId(rs.getString(2));
				rb.setContent(rs.getString(3));
				rb.setRe_ref(rs.getInt(4));
				rb.setRe_lev(rs.getInt(5));
				rb.setRe_seq(rs.getInt(6));
				rb.setDate(rs.getDate(7));
				replyList.add(rb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return replyList;
	}
	
	// 댓글개수 가져오기
	public int getReplyCount(int num){
		int count = 0;
		try{			
			con = getConnection();
			sql = "select count(*) from reply where re_ref=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);						
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return count;
	}
	
	// 댓글 삭제
	public void replyDelete(int num){
		try{
			con = getConnection();
			
			sql = "delete from reply where num=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
	}
	
}
