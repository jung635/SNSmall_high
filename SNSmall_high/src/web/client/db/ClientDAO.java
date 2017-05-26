package web.client.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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


public class ClientDAO {

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
	
	//client 회원정보 불러오기
	public ClientBean getMember(String id){
		ClientBean cb = null;
		
		try{
			con = getConnection();
			sql = "select * from client where client_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cb = new ClientBean();
				cb.setName(rs.getString("name"));
				cb.setEmail(rs.getString("email"));
				cb.setAddress(rs.getString("address"));
				cb.setPhone(rs.getString("phone"));
				cb.setPoint(rs.getInt("point"));
				cb.setDate(rs.getDate("date"));
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
				
		return cb;
	}
	
	//클라이언트 회원정보 DB 삽입
	public void insertClient(ClientBean clb){
		try{
			con = getConnection();
			sql = "insert into client (client_id, pass, name, phone, email, address, point, date, type) values (?,?,?,?,?,?,?,now(),'client')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, clb.getClient_id());
			pstmt.setString(2, clb.getPass());
			pstmt.setString(3, clb.getName());
			pstmt.setString(4, clb.getPhone());
			pstmt.setString(5, clb.getEmail());
			pstmt.setString(6, clb.getAddress());
			pstmt.setInt(7, 1000); 
			
			pstmt.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	} //insertVendor
	
	// 중복 아이디 체크
	public boolean  idDupCheck(String id) {
		boolean check = false; // 아이디 중복
		try {
			con = getConnection();
			sql = "select * from sns where sns_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return check; // 아이디 중복
			}
			
			sql = "select * from vendor where vendor_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return check; // 아이디 중복
			}
			
			sql = "select * from client where client_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return check; // 아이디 중복
			}
			if (rs.next() == false) {
				check = true; // 아이디 중복 안됨
				return check;
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		return check;
	} // idDupCheck()
	
	// 로그인 시 아이디 비번 확인, 타입 가져오기
	public MemberTypeBean idCheck(String id, String pass) {
		MemberTypeBean mtb = new MemberTypeBean();
		int check = -1;
		String name=null;
		String type=null;

		try {
			con = getConnection();
			// 모든 회원테이블에서 아이디 확인
			sql = "select name,pass,type from client where client_id=? union select person_name,pass,type from vendor where vendor_id=? union select name,pass,type from sns where sns_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, id);		
			rs = pstmt.executeQuery();
			// if 문으로 제어
			if (rs.next()) { // rs 기억장소 중에 첫번째로 옮기는 메소드next()
				if (pass.equals(rs.getString("pass"))) {
					check = 1;
					name = rs.getString(1);
					type = rs.getString(3);
				} else {check = 0;}
			}
			mtb.setCheck(check);
			mtb.setType(type);
			mtb.setName(name);

		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		return mtb;
	}// idCheck() end
	
	// 메일 보내기
	public boolean sendMail(String email, String content) throws com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException {

		boolean check = false;
		final String id = "sunju635";
		final String pass = "Tjswn635*";
		int port = 25;
		String host = "smtp.naver.com";
		String from = "sunju635@naver.com";
		
		try {
			Properties props = new Properties();
			props.put("mail.stmp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(id, pass);
				}
			});
			
			session.setDebug(true);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("인증메일입니다");
			message.setContent(content, "text/html; charset=EUC-KR");
			message.setText(content);

			Transport.send(message);
			check = true;
				
		} catch (Exception e) {check = false;}
	
		return check;
	}	
	
	//클라이언트 정보 수정
	public void updateClient(ClientBean clb){
		
		try{
			con = getConnection();
			sql = "update client set name=?, phone=?, address=? where client_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, clb.getName());
			pstmt.setString(2, clb.getPhone());
			pstmt.setString(3, clb.getAddress());
			pstmt.setString(4, clb.getClient_id());			
					
			pstmt.executeUpdate();
		}catch (Exception e){System.out.println("DB연결 실패(update)" + e);}			
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	} //updateClient
	
	//회원수 구하기
	public int getListCount(){
		int num = 0;

		try {
			con = getConnection();
			sql = "select count(*) from client where client_id != 'admin'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}

		} catch (Exception e) {e.printStackTrace();
		} finally {if (rs != null) {try {rs.close();} catch (Exception ex) {}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception ex) {}}
			if (con != null) {try {con.close();} catch (Exception ex) {}}}

		return num;	
	}
	
	//검색된 회원수 구하기
	public int getListCountForSearch(String search){
		int num = 0;

		try {
			con = getConnection();
			sql = "select count(*) from client where client_id != 'admin' and name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}

		} catch (Exception e) {e.printStackTrace();
		} finally {if (rs != null) {try {rs.close();} catch (Exception ex) {}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception ex) {}}
			if (con != null) {try {con.close();} catch (Exception ex) {}}}

		return num;	
	}
	
	//비밀번호 변경
	public void passModify(String id, String pass){

		try{
			con = getConnection();
			sql = "update client set pass=? where client_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
				
			pstmt.executeUpdate();
		}catch (Exception e){System.out.println("DB연결 실패(passModify)" + e);}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	} //passModify
	
	//회원정보 목록 불러오기
	public List<ClientBean> getClientList(int startRow, int pageSize){
		List<ClientBean> clientList = new ArrayList<ClientBean>();
		try{
			con = getConnection();
			sql = "select * from client where client_id != 'admin' order by client_id desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ClientBean cl = new ClientBean();
				cl.setClient_id(rs.getString("client_id"));
				cl.setPass(rs.getString("pass"));
				cl.setAddress(rs.getString("address"));
				cl.setName(rs.getString("name"));
				cl.setEmail(rs.getString("email"));
				cl.setPhone(rs.getString("phone"));
				cl.setPoint(rs.getInt("point"));
				cl.setDate(rs.getDate("date"));
				clientList.add(cl);
			}
		}catch(Exception e){e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(Exception ex){}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		return clientList;
	}
	
	//검색된 회원정보 목록 불러오기
		public List<ClientBean> getClientList(int startRow, int pageSize, String search){
			List<ClientBean> clientList = new ArrayList<ClientBean>();
			try{
				con = getConnection();
				sql = "select * from client where client_id != 'admin' and name like ? order by client_id desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ClientBean cl = new ClientBean();
					cl.setClient_id(rs.getString("client_id"));
					cl.setPass(rs.getString("pass"));
					cl.setAddress(rs.getString("address"));
					cl.setName(rs.getString("name"));
					cl.setEmail(rs.getString("email"));
					cl.setPhone(rs.getString("phone"));
					cl.setPoint(rs.getInt("point"));
					cl.setDate(rs.getDate("date"));
					clientList.add(cl);
				}
			}catch(Exception e){e.printStackTrace();}
			finally {if(rs != null){try {rs.close();}catch(Exception ex){}}
			if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
			if(con != null){try {con.close();}catch(Exception ex) {}}}
			return clientList;
		}
}
