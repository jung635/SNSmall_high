package web.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
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
	
	// 글등록
	public void insertBoard(BoardBean bb){
		int num = 0;
		try{
			con = getConnection();			
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1)+1;
			sql = "insert into board(num,id,subject,content,date,type) "
					+ "values(?,?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getSubject());
			pstmt.setString(4, bb.getContent());
			pstmt.setString(5, bb.getType());
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
	}//insertBoard() END
	
	// 게시판 글 갯수 불러오기
	public int getBoardCount(){
		int count = 0;
		try{
			con = getConnection();
			sql = "select count(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return count;
	}//getBoardCount() END
	
	// 게시판 글 목록 불러오기
	public List<BoardBean> getBoardList(int startRow, int pageSize){
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		try{
			con = getConnection();
			sql = "select * from board order by num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt(1));
				bb.setId(rs.getString(2));
				bb.setSubject(rs.getString(3));
				bb.setContent(rs.getString(4));
				bb.setDate(rs.getDate(5));
				bb.setType(rs.getString(6));
				boardList.add(bb);				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return boardList;
	}//getBoardList() END
	
	// 게시판 검색글 목록 불러오기
		public List<BoardBean> getSearchBoardList(int startRow, int pageSize, String search){
			List<BoardBean> boardList = new ArrayList<BoardBean>();
			try{
				con = getConnection();
				sql = "select * from board where subject like ? or content like ? order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, "%"+search+"%");
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					BoardBean bb = new BoardBean();
					bb.setNum(rs.getInt(1));
					bb.setId(rs.getString(2));
					bb.setSubject(rs.getString(3));
					bb.setContent(rs.getString(4));
					bb.setDate(rs.getDate(5));
					bb.setType(rs.getString(6));
					boardList.add(bb);				
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
				if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
				if (con != null) {try {con.close();} catch (SQLException ex) {	}}
			}
			return boardList;
		}//getBoardList() END
	
	// 글내용 가져오기
	public BoardBean getBoard(int num){
		BoardBean bb = new BoardBean();
		try{			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){				
				bb.setNum(rs.getInt(1));
				bb.setId(rs.getString(2));
				bb.setSubject(rs.getString(3));
				bb.setContent(rs.getString(4));
				bb.setDate(rs.getDate(5));
				bb.setType(rs.getString(6));
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return bb;		
	}// getBoard() end
	
	// 글수정
	public void updateBoard(BoardBean bb){
		try{
			con = getConnection();			
			sql = "update board set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setInt(3, bb.getNum());
			pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
	}//updateBoard() END
	
	// 글삭제
	public void deleteBoard(int num){
		try{
			con = getConnection();			
			sql = "delete from board where num=?";
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
