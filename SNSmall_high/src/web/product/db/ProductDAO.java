package web.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.client.db.ClientBean;

public class ProductDAO {

	Connection con = null;

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	} // getConnection()

	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;

	
	// getProduct()
	public List<ProductBean> getProduct(String num) {
		ProductBean pb = null;
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		try {
			con = getConnection();
			String[] number = num.split(",");
			StringBuffer sql = new StringBuffer("select * from product where product_num IN(");

			for (int i = 0; i < number.length; i++) {
				if (i == number.length - 1) {sql.append("?");}
				else {sql.append("?,");}
			}
			sql.append(")");
			pstmt = con.prepareStatement(sql.toString());
			for (int i = 0; i < number.length; i++) {
				pstmt.setString(i + 1, number[i]);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new ProductBean();
				pb = new ProductBean();
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setCategory(rs.getString("category"));
				pb.setSubject(rs.getString("subject"));
				pb.setContent(rs.getString("content"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setDetail_img(rs.getString("detail_img"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setPrice(rs.getInt("price"));
				pb.setAmount(rs.getInt("amount"));
				pb.setCount(rs.getInt("count"));
				list.add(pb);
			}
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		return list;
	}

	// getProduct()
	public ProductBean getProduct(int num) {
		ProductBean pb = null;
		try{
			con = getConnection();
			sql = "select * from product where product_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pb = new ProductBean();
				pb.setProduct_num(num);
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setCategory(rs.getString("category"));
				pb.setSubject(rs.getString("subject"));
				pb.setContent(rs.getString("content"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setDetail_img(rs.getString("detail_img"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setPrice(rs.getInt("price"));
				pb.setAmount(rs.getInt("amount"));
				pb.setCount(rs.getInt("count"));
				pb.setDate(rs.getDate("date"));
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
				
		return pb;
	}
	
	//물품리스트 (카테고리별, 정렬변경 출력)
	public List<ProductBean> getProductList(int startRow, int pageSize, String category, String order){
		List<ProductBean> productList = new ArrayList<ProductBean>();
		try{
			con = getConnection();
			if(category.equals("not")){
				if(order.equals("price")){
					sql = "select * from product order by price asc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
				}else if(order.equals("count")){
					sql = "select * from product order by count desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
				}else if(order.equals("product_num")){
					sql = "select * from product order by product_num desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
				}else{
					sql = "select * from product order by ? desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, order);
					pstmt.setInt(2, startRow-1);
					pstmt.setInt(3, pageSize);
				}
				
			}else if(order.equals("price")){
				sql = "select * from product where category=? order by price asc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
			}else if(order.equals("count")){
				sql = "select * from product where category=? order by count desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
			}else if(order.equals("product_num")){
				sql = "select * from product where category=? order by product_num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
			}else{
				sql = "select * from product where category=? order by ? desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, order);
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductBean pb = new ProductBean();
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setCategory(rs.getString("category"));
				pb.setSubject(rs.getString("subject"));
				pb.setContent(rs.getString("content"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setDetail_img(rs.getString("detail_img"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setPrice(rs.getInt("price"));
				pb.setAmount(rs.getInt("amount"));
				pb.setCount(rs.getInt("count"));
				pb.setDate(rs.getDate("date"));
				productList.add(pb);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(Exception ex){}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		return productList;
	}
	
	// 등록상품정보 DB 삽입
	public void insertProduct(ProductBean prb){
		int product_num = 0;
		try{
			
			con = getConnection();
			sql = "select max(product_num) from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) product_num = rs.getInt(1)+1;
			sql = "insert into product(product_num,vendor_id,category,subject,content,"
					+ "main_img,detail_img,option1,option2,option3,price,amount,count,date) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setString(2, prb.getVendor_id());
			pstmt.setString(3, prb.getCategory());
			pstmt.setString(4, prb.getSubject());
			pstmt.setString(5, prb.getContent());
			pstmt.setString(6, prb.getMain_img());
			pstmt.setString(7, prb.getDetail_img());
			pstmt.setString(8, prb.getOption1());
			pstmt.setString(9, prb.getOption2());
			pstmt.setString(10, prb.getOption3());
			pstmt.setInt(11, prb.getPrice());
			pstmt.setInt(12, prb.getAmount());
			pstmt.setInt(13, 0);
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}// insertProduct() end
	
	// 등록 상품 갯수 구하기
	public int getProductCount(String id){
		int count = 0;

		try{			
			con = getConnection();
			sql = "select count(*) from product where vendor_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		return count;
	}// getProductCount() end
	
	//카테고리별 상품갯수 구하기
	public int getProductCount(String category, int a){
		int count = 0;
		
		try{			
			con = getConnection();
			if(category.equals("not")){
				sql = "select count(*) from product";
				pstmt = con.prepareStatement(sql);
			}else{
				sql = "select count(*) from product where category=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		return count;
	}// getProductCount() end
	
	//등록상품 리스트 불러오기
	public List<ProductBean> getProductList(String id, int startRow, int pageSize){
		List<ProductBean> productList = new ArrayList<ProductBean>();
		
		try{
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select * from product where vendor_id=? order by product_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductBean prb = new ProductBean();
				prb.setProduct_num(rs.getInt(1));
				prb.setVendor_id(rs.getString(2));
				prb.setCategory(rs.getString(3));
				prb.setSubject(rs.getString(4));
				prb.setContent(rs.getString(5));
				prb.setMain_img(rs.getString(6));
				prb.setDetail_img(rs.getString(7));
				prb.setOption1(rs.getString(8));
				prb.setOption2(rs.getString(9));
				prb.setOption3(rs.getString(10));
				prb.setPrice(rs.getInt(11));
				prb.setAmount(rs.getInt(12));				
				prb.setCount(rs.getInt(12));
				prb.setDate(rs.getDate(14));
				productList.add(prb);
			}

		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		return productList;
	} //getProductList() end 
	
	// 상품 정보 수정(모든 정보 수정)
	public void updateProduct(ProductBean prb){

		try{
			con = getConnection();
			sql = "update product set category=?,subject=?,content=?,"
					+ "main_img=?,detail_img=?,option1=?,option2=?,option3=?,price=?,amount=? where product_num=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prb.getCategory());
			pstmt.setString(2, prb.getSubject());
			pstmt.setString(3, prb.getContent());
			pstmt.setString(4, prb.getMain_img());
			pstmt.setString(5, prb.getDetail_img());
			pstmt.setString(6, prb.getOption1());
			pstmt.setString(7, prb.getOption2());
			pstmt.setString(8, prb.getOption3());
			pstmt.setInt(9, prb.getPrice());
			pstmt.setInt(10, prb.getAmount());
			pstmt.setInt(11, prb.getProduct_num());
			
			pstmt.executeUpdate();
			 
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
			
	}// updateProduct() end
	
	// 등록 상품 삭제
	public void deleteProduct(int product_num){

		try {
			con=getConnection();
			//3 sql num해당하는 상품 삭제
			sql="delete from product where product_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product_num);

			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	}//deleteProduct()
	
	
	
} // ProductDAO
