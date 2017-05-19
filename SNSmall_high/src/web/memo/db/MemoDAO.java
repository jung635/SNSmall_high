package web.memo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemoDAO {

Connection con = null;
	
	private Connection getConnection() throws Exception{

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}	//getConnection()
	

	//쪽지쓰기 (MemoWrite)메서드----------------------------------------------------------------	
	public void insertMemo(MemoBean meb){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int num=0;
		
		try{
			//1, 2 디비연결 메서드 호출
			con=getConnection();
			// num 게시판 글번호 구하기
			sql="select max(num) from memo";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			System.out.println("num= "+num);
			
			//3. sql insert   디비날짜 now()
			sql="insert into memo(num, from_id, to_id, subject, content, date) values(?, ?, ?, ?, ?, now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num); //첫번째 물음표 1, num에 입력될 값
			pstmt.setString(2, meb.getFrom_id()); //두번째 물음표2, name에 입력될 값
			pstmt.setString(3, meb.getTo_id()); //세번째 물음표3, pass에 입력될 값
			pstmt.setString(4, meb.getSubject()); //다섯번째 물음표4, subject에 입력될 값
			pstmt.setString(5, meb.getContent()); //여섯번째 물음표5, content에 입력될 값
			//4. 실행
			pstmt.executeUpdate(); // insert, update, delete
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//예외 상관없이 마무리 작업
			//객체 생성 닫기
			if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try{con.close();}catch(SQLException ex){}}
		}
	}// insertMemo(meb)	
	
	// 전체 쪽지수 구하기 getMemoCount()----------------------------------------------------------------
	public int getMemoCount(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;

		try{
			//1, 2 디비연결 메서드 호출
			con=getConnection();	
			//3. sql함수 count(*) 구하기
			sql = "select count(*) from memo where from_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id); //
			System.out.println("id : "+id);
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
	}//getMemoCount()
	

	//게시판 페이지 가져오기----------------------------------------------------------------------------
	public List getMemoList(String id, int startRow, int pageSize){
		List memoList=new ArrayList();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		MemoBean meb=null;  //선언
		try{
			//1단계 드라이버로더			//2단계 디비연결
			con=getConnection();
			
			// sql : select * from board
			// 최근글 위로 re_ref 그룹별 내림차순 정렬   re_seq오름차순
			//		re_ref desc, re_seq asc
			// 글잘라오기 limit  시작행-1, 개수
			//3단계 sql 
			sql="select * from memo where from_id=? order by num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id); //
			pstmt.setInt(2, startRow-1); //시작행 -1
			pstmt.setInt(3, pageSize); //몇개글
			//4단계  rs 실행결과 저장
			rs = pstmt.executeQuery(); //select
			//5 rs while 데이터 있으면
			// 자바빈 객체 생성 BoardBean bb
			// bb 멤버변수 <= rs열데이터 가져와서 저장
			// bb 게시판 글 하나 => boardList 한칸 저장
			while(rs.next()){ //첫행 데이터 있으면  true

				meb=new MemoBean();
				meb.setNum(rs.getInt("num"));
				meb.setFrom_id(rs.getString("from_id"));
				meb.setTo_id(rs.getString("to_id"));
				meb.setSubject(rs.getString("subject"));
				meb.setContent(rs.getString("content"));
				meb.setDate(rs.getDate("date"));
				//memoList 한칸 저장
				memoList.add(meb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//객체닫기
			if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try{con.close();}catch(SQLException ex){}}
		}
		return memoList;
	} //getMemoList()
	

	// 쪽지 내용물 가져오기-------------------------------------------------------------------
	public MemoBean getMemo(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		MemoBean meb=null;  //선언
		
		try{
			//1단계 드라이버로더			//2단계 디비연결
			con=getConnection();
			//3단계 sql num에 해당하는 board 모든정보 가져오기
			sql="select * from memo where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4단계  rs 실행결과 저장
			rs = pstmt.executeQuery(); //select			
			//5단계 rs 첫번째 행 이동했을때 데이터 있으면
			//		자바빈 meb 객체생성
			//		meb set 메서드 멤버변수 저장 <= rs 열내용
			if(rs.next()){
				meb=new MemoBean();
				meb.setNum(rs.getInt("num"));
				meb.setFrom_id(rs.getString("from_id"));
				meb.setTo_id(rs.getString("to_id"));
				meb.setSubject(rs.getString("subject"));
				meb.setContent(rs.getString("content"));
				meb.setDate(rs.getDate("date"));
			}
				
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//객체닫기
			if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try{con.close();}catch(SQLException ex){}}
		}
		return meb;
	}//getMemo()

	//게시물 삭제 ------------------------------------------------------------------------	
	public int deleteMemo(int num){
		
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		System.out.println("num : "+num);
		try{
			//예외가 발생할 것 같은 명령문
			//1단계 드라이버로더			//2단계 디비연결
			con=getConnection();
			sql="delete from memo where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4단계 실행
			pstmt.executeUpdate();
			check=1;
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			//예외 상관없이 마무리 작업
			//객체 생성 닫기
			if(rs!=null){try{rs.close();}catch(SQLException ex){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException ex){}}
			if(con!=null){try{con.close();}catch(SQLException ex){}}
		}
		return check;
	}//deleteMemo() class
	
	
}
