package web.vendor.db;

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

public class VendorDAO {

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
	
	//판매자 정보 DB 삽입
	public void insertVendor(VendorBean vb){
		
		try{
			con = getConnection();
			sql = "insert into vendor (vendor_id, pass, person_name, company_name, phone, address, vendor_profit, date, type) values (?,?,?,?,?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vb.getVendor_id());
			pstmt.setString(2, vb.getPass());
			pstmt.setString(3, vb.getPerson_name());
			pstmt.setString(4, vb.getCompany_name());
			pstmt.setString(5, vb.getPhone());
			pstmt.setString(6, vb.getAddress());
			pstmt.setInt(7, 0);
			pstmt.setString(8, "vendor");
			
			
			pstmt.executeUpdate();
		} catch (Exception e) {e.printStackTrace();
		} finally {if (con != null) {try {con.close();} catch (Exception e) {e.printStackTrace();}	}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {	e.printStackTrace();}}
			if (rs != null) {try {rs.close();} catch (Exception e) {e.printStackTrace();}}}
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
			
		} catch (Exception e) {e.printStackTrace();
		} finally {if (con != null) {try {con.close();} catch (Exception e) {e.printStackTrace();}	}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {	e.printStackTrace();}}
			if (rs != null) {try {rs.close();} catch (Exception e) {e.printStackTrace();}}}
		
		return check;
	} // idDupCheck()
			
	// 판매자정보 불러오기
	public VendorBean getVendor(String id) {
		VendorBean vb = new VendorBean();
		ResultSet rs = null;
		try {
			con = getConnection();
			sql = "select * from vendor where vendor_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vb.setVendor_id(id);
				vb.setPass(rs.getString("pass"));
				vb.setPerson_name(rs.getString("person_name"));
				vb.setAddress(rs.getString("address"));
				vb.setPhone(rs.getString("phone"));
				vb.setCompany_name(rs.getString("company_name"));
				vb.setVendor_profit(rs.getInt("vendor_profit"));
				vb.setDate(rs.getDate("date"));
				vb.setType(rs.getString("type"));
			}
		} catch (Exception e) {e.printStackTrace();
		} finally {if (con != null) {try {con.close();} catch (Exception e) {e.printStackTrace();}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {	e.printStackTrace();}}
			if (rs != null) {try {rs.close();} catch (Exception e) {e.printStackTrace();}}}

		return vb;
	}// getMember() end
	
	//판매자 정보 수정
	public void updateVendor(VendorBean vb){
		
		try{
			con = getConnection();
			sql = "update vendor set person_name=?, company_name=?, phone=?, address=? where vendor_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vb.getPerson_name());
			pstmt.setString(2, vb.getCompany_name());
			pstmt.setString(3, vb.getPhone());
			pstmt.setString(4, vb.getAddress());
			pstmt.setString(5, vb.getVendor_id());			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();
		} finally {if (con != null) {try {con.close();} catch (Exception e) {e.printStackTrace();}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {	e.printStackTrace();}}
			if (rs != null) {try {rs.close();} catch (Exception e) {e.printStackTrace();}}}
	} //updateVendor
	
	//비밀번호 수정
	public void passModify(String id, String pass){
		
		try{
			con = getConnection();
			sql = "update vendor set pass=? where vendor_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();
		} finally {if (con != null) {try {con.close();} catch (Exception e) {e.printStackTrace();}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {	e.printStackTrace();}}
			if (rs != null) {try {rs.close();} catch (Exception e) {e.printStackTrace();}}}
	} //passModify
	
	// vendor 취소 목록 카운트
	public int getCancelListCount(String vendor_id) {
		int num = 0;
		try {
			con = getConnection();
			sql = "select count(*) from payment where vendor_id = ? and state = 'cancelHold' ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vendor_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception ex) {
				}
			}
		}

		return num;
	}

	// 취소 목록 가져오기
	public List<PaymentBean> payDeleteList(int start, int pageSize, String vendor_id) {
		List<PaymentBean> list = new ArrayList<PaymentBean>();
		PaymentBean pb = null;
		try {
			sql = "select * from payment where vendor_id = ? and state = 'cancelHold' limit ?,?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vendor_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setClient_id(rs.getString("client_id"));
				pb.setDate(rs.getTimestamp("date"));
				pb.setMessage(rs.getString("message"));
				pb.setNum(rs.getInt("num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setState(rs.getString("state"));
				pb.setUsedPoint(rs.getInt("usedPoint"));
				list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception ex) {
				}
			}
		}
		return list;

	}
	// 무통장 입금 목록 가져오기
	public List<PaymentBean> payDepositList(int start, int pageSize, String vendor_id) {
		List<PaymentBean> list = new ArrayList<PaymentBean>();
		PaymentBean pb = null;
		try {
			sql = "select * from payment where vendor_id = ? and state = 'waiting' limit ?,?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vendor_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setClient_id(rs.getString("client_id"));
				pb.setDate(rs.getTimestamp("date"));
				pb.setMessage(rs.getString("message"));
				pb.setNum(rs.getInt("num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setState(rs.getString("state"));
				pb.setUsedPoint(rs.getInt("usedPoint"));
				list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception ex) {
				}
			}
		}
		return list;
		
	}

	// 취소 목록 가져오기
	public List<PaymentBean> payDeleteList(String vendor_id, String order_num) {
		List<PaymentBean> list = new ArrayList<PaymentBean>();
		PaymentBean pb = null;
		try {
			sql = "select * from payment where vendor_id = ? and order_num = ?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vendor_id);
			pstmt.setString(2, order_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setClient_id(rs.getString("client_id"));
				pb.setDate(rs.getTimestamp("date"));
				pb.setMessage(rs.getString("message"));
				pb.setNum(rs.getInt("num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setState(rs.getString("state"));
				pb.setUsedPoint(rs.getInt("usedPoint"));
				list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception ex) {
				}
			}
		}
		return list;

	}
	
	//회원수 구하기
		public int getListCount(){
			int num = 0;

			try {
				con = getConnection();
				sql = "select count(*) from vendor";
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
		
		// 검색된 회원수 구하기
		public int getListCount(String search){
			int num = 0;

			try {
				con = getConnection();
				sql = "select count(*) from vendor where person_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
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
		
		// 회원정보 목록 불러오기
		public List<VendorBean> getVendorList(int startRow, int pageSize){
			List<VendorBean> vendorList = new ArrayList<VendorBean>();
			try{
				con = getConnection();
				sql = "select * from vendor order by vendor_id desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					VendorBean vb = new VendorBean();
					vb.setVendor_id(rs.getString("vendor_id"));
					vb.setPass(rs.getString("pass"));
					vb.setAddress(rs.getString("address"));
					vb.setPhone(rs.getString("phone"));
					vb.setPerson_name(rs.getString("person_name"));
					vb.setCompany_name(rs.getString("company_name"));
					vb.setVendor_profit(rs.getInt("vendor_profit"));
					vb.setDate(rs.getDate("date"));
					vendorList.add(vb);
				}
			}catch(Exception e){e.printStackTrace();}
			finally {if(rs != null){try {rs.close();}catch(Exception ex){}}
			if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
			if(con != null){try {con.close();}catch(Exception ex) {}}}
			return vendorList;
		}
		
		// 검색된 회원정보 목록 불러오기
		public List<VendorBean> getVendorList(int startRow, int pageSize, String search){
			List<VendorBean> vendorList = new ArrayList<VendorBean>();
			try{
				con = getConnection();
				sql = "select * from vendor where person_name like ? order by vendor_id desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()){
					VendorBean vb = new VendorBean();
					vb.setVendor_id(rs.getString("vendor_id"));
					vb.setPass(rs.getString("pass"));
					vb.setAddress(rs.getString("address"));
					vb.setPhone(rs.getString("phone"));
					vb.setPerson_name(rs.getString("person_name"));
					vb.setCompany_name(rs.getString("company_name"));
					vb.setVendor_profit(rs.getInt("vendor_profit"));
					vb.setDate(rs.getDate("date"));
					vendorList.add(vb);
				}
			}catch(Exception e){e.printStackTrace();}
			finally {if(rs != null){try {rs.close();}catch(Exception ex){}}
			if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
			if(con != null){try {con.close();}catch(Exception ex) {}}}
			return vendorList;
		}		
}
