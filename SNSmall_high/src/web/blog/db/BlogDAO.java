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
			con=getConnection();
                                                             
			sql="select * from blog order by num desc limit ?,?";                    
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1); 
			pstmt.setInt(2,pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BlogBean bb = new BlogBean();
				bb.setNum(rs.getInt("num"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setFile(rs.getString("file"));
				bb.setCategory(rs.getString("category"));
				
				blogList.add(bb);  
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
		
		public BlogBean getBlogPost(int num){
			
			BlogBean bb = null;
			
			try{
				con=getConnection();
				sql = "select * from blog where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					bb= new BlogBean();
					bb.setNum(rs.getInt("num"));
					bb.setSubject(rs.getString("subject"));
					bb.setContent(rs.getString("content"));
					bb.setCategory(rs.getString("category"));
					bb.setDate(rs.getTimestamp("date"));
					bb.setFile(rs.getString("file"));
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con!=null){try{con.close();}catch(SQLException ex){}}
				if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
				if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			}
			return bb;
			
		}
		
		public int getBlogSearchCount(String search){
			
			int count=0;
			try{
				con= getConnection();
				                                   
				sql="select count(*) from blog where subject like ? or content like ?";  
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1,"%"+search+"%"); 
				pstmt.setString(2,"%"+search+"%");
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt(1); 
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con!=null){try{con.close();}catch(SQLException ex){}}
				if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
				if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			}
			
			return count;
			
		}

		public List<BlogBean> getBlogList(int startRow,int pageSize,String search){
			List<BlogBean> bloglist = new ArrayList<BlogBean>();
			
			try{
				con=getConnection();
				sql="select * from blog where subject like ? or content like ? order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, "%"+search+"%");
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
				
				rs= pstmt.executeQuery();
				
				while(rs.next()){
					BlogBean bb = new BlogBean();
					bb.setNum(rs.getInt("num"));
					bb.setSubject(rs.getString("subject"));
					bb.setCategory(rs.getString("category"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getTimestamp("date"));
					bb.setFile(rs.getString("file"));
					
					bloglist.add(bb)
;				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con!=null){try{con.close();}catch(SQLException e){}}
				if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
				if(rs!=null){try{rs.close();}catch(SQLException e){}}
			}
			return bloglist;
		}
		
		public int getBlogCategoryListCount(String category){
			
			int count=0;
			try{
				con= getConnection();
				                                   
				sql="select count(*) from blog where category=?";  
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1,category); 
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					count = rs.getInt(1); 
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con!=null){try{con.close();}catch(SQLException ex){}}
				if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
				if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			}
			
			return count;
			
		}
		
		public List<BlogBean> getCategoryBlogList(int startRow,int pageSize,String category){
			List<BlogBean> categorybloglist = new ArrayList<BlogBean>();
			
			try{
				con=getConnection();
				sql="select * from blog where category=? order by num desc limit ?,?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,category);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				
				rs= pstmt.executeQuery();
	
				while(rs.next()){
					BlogBean bb = new BlogBean();
					bb.setNum(rs.getInt("num"));
					bb.setSubject(rs.getString("subject"));
					bb.setCategory(rs.getString("category"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getTimestamp("date"));
					bb.setFile(rs.getString("file"));
					
					categorybloglist.add(bb);}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(con!=null){try{con.close();}catch(SQLException e){}}
				if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
				if(rs!=null){try{rs.close();}catch(SQLException e){}}
			}
			return categorybloglist;
		}
		
		//blogPost
		public void blogPostUpdate(BlogBean bb){
			try{
				con=getConnection();
				sql="update blog set category=?,subject=?,content=?,file=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bb.getCategory());
				pstmt.setString(2, bb.getSubject());
				pstmt.setString(3, bb.getContent());
				pstmt.setString(4, bb.getFile());
				pstmt.setInt(5, bb.getNum());
				
				pstmt.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(pstmt!=null){try{ pstmt.close(); }catch(SQLException ex){}}
				if(con!=null){try {con.close();}catch(SQLException ex){}}}
			}
		
		public void blogPostDelete(int num){
			try{
				con=getConnection();
				
				sql="delete from blog where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
				
				sql="update blog set num=num-1 where num>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
				
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(pstmt!=null){try{ pstmt.close(); }catch(SQLException ex){}}
				if(con!=null){try {con.close();}catch(SQLException ex){}}}
		
			}
		
		
		
}
