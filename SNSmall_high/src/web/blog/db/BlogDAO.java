package web.blog.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BlogDAO {

	Connection con = null;

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}

	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	
	//blog write
	public void blogPostWrite(BlogBean bb){
		
		int num=0;
		
		try{
		con = getConnection();
		
		sql="select max(num) from blog";
		pstmt=con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			num= rs.getInt(1)+1;
		}
		
		sql="insert into blog(num,subject,content,file,date,category) values(?,?,?,?,now(),?);";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, bb.getSubject());
		pstmt.setString(3, bb.getContent());
		pstmt.setString(4, bb.getFile());
		pstmt.setString(5, bb.getCategory());
		
		pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){ try{pstmt.close();}catch(SQLException ex){} }
			if(con!=null){ try{con.close();}catch(SQLException ex){} }
			if(rs!=null){ try{rs.close();}catch(SQLException ex){} }
		}
	}
	
		//blog List count
	
		public int getBlogListCount(){
			int count=0;
			
			try{
				con = getConnection();
				
				sql="select count(*) from blog";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt(1);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(pstmt!=null){ try{pstmt.close();}catch(SQLException ex){} }
				if(con!=null){ try{con.close();}catch(SQLException ex){} }
				if(rs!=null){ try{rs.close();}catch(SQLException ex){} }
			}
			return count;
		}
		
	
	
		//blog List
		
		public List getBlogList(int startRow,int pageSize){
			
			List blogList= new ArrayList();
			
			try{
			//12 디비연결 메서드호출
			con=getConnection();
			//3 sql객체생성                                                                      
			sql="select * from blog order by num desc limit ?,?";                    
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1); //limit가 그다음행부터 세기때문에 -1!
			pstmt.setInt(2,pageSize);  //몇개글
			//4 실행저장
			rs = pstmt.executeQuery();
			
			while(rs.next()){  //여러개 구문돌면서 나와야하니까!!
				
				BlogBean bb = new BlogBean();
				bb.setNum(rs.getInt("num"));
				bb.setDate(rs.getDate("date"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setFile(rs.getString("file"));
				bb.setCategory(rs.getString("category"));
				//bb라는 객체에 현재 위와같은 내용 다담음!
			
				blogList.add(bb);  //boardlist의 배열 한칸에 bb의내용을 담겠다!
				}
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(pstmt!=null){ try{pstmt.close();}catch(SQLException ex){} }
				if(con!=null){ try{con.close();}catch(SQLException ex){} }
				if(rs!=null){ try{rs.close();}catch(SQLException ex){} }
			}
			
			return blogList;
		
		
		
	}
}
