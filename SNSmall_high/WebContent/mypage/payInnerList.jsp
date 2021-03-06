<%@page import="java.util.ArrayList"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String method = request.getParameter("method");
String type= (String)request.getAttribute("type");

ClientDAO cdao = new ClientDAO();
PaymentDAO pdao = new PaymentDAO();
ProductDAO prodao = new ProductDAO();
List<List<PaymentBean>> pay_list_done= new ArrayList<>();
List<PaymentBean> pay_list= new ArrayList<>();
List<PaymentBean> pay_list_reult = new ArrayList<PaymentBean>();
%>
	<h2><%=method %></h2>
	<%if(pay_list_done == null&&pay_list == null){ %>
		내역이 없습니다.
	<%}if(method.equals("payDone")){
	pay_list_done= (List<List<PaymentBean>>)request.getAttribute("pay_list_done");%>
	
					<%for(int i=0; i<pay_list_done.size(); i++){
				String merchant_uid = "";
				pay_list_reult = pay_list_done.get(i);%>
				<div class="well">
					<table>
						<%for(int j=0; j<pay_list_reult.size(); j++){
							PaymentBean pb = pay_list_reult.get(j);
							merchant_uid = pb.getOrder_num();
							ProductBean prob = prodao.getProduct(pb.getProduct_num()); %>
						<tr>
							<td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
							<td><%=prob.getSubject() %></td>
							<td><%=prob.getContent() %></td>
							<td><%=prob.getPrice() %></td>
							<td><%=pb.getDate() %></td>
							<td><%=pb.getState() %></td>
							<td><%=pb.getOrder_num() %></td>
							<td><input type="button" onclick="location.href='PayDetail.pa?num=<%=pb.getNum() %>'" value="주문 상세 조회"></td>
							<td><%
							//구매자 일때 취소 및 환불
							if(type.equals("client")){
								if(pb.getState().equals("delivery")){
									%>배송중일때는 취소요청이 불가 합니다<%
								}else if(pb.getState().equals("cancelHold")){
									%>취소 대기중<%
								}else{
									%><input type="button" onclick="location.href='PayCancel.pa?num=<%=pb.getNum() %>'" value="주문 취소"><%
								}
							
							}	
							//판매자 일때 취소 및 환불
							if(type.equals("vendor")){
								if(pb.getState().equals("cancelHold")){
									%><input type="button" value="취소 확인" onclick="location.href='PayCancel.ve?num=<%=pb.getNum()%>'"><%
								}else if(pb.getState().equals("cancel")){
									%>취소 된 주문<%
								}else if(pb.getState().equals("delivery")){
									%><input type="button" value="배송 완료" onclick="location.href='PayDeliveryAction.pa?num=<%=pb.getNum()%>'"><%

								}else if(pb.getState().equals("waiting")){//무통장 입금시
									%><input type="button" value="입금 확인" onclick="location.href='PayDepositDone.ve?num=<%=pb.getNum()%>'"><%

								}else{
									%>비고<%
								}
							} %></td>
						</tr>
						<%}%>
					</table>
					<%if(type.equals("client")){ %>
					<input type="button" value="일괄 조회" onclick="location.href='PayDone.pa?merchant_uid=<%=merchant_uid%>'"> 
					<input type="button" value="일괄 취소" onclick="location.href='PayMultipleCancel.pa?order_num=<%=merchant_uid%>'">
				<%} %>
				</div>
				<%} %>
		
	<%}else{
		pay_list = (List<PaymentBean>)request.getAttribute("pay_list");%>
		<table id="mypay_table">
			<tr><th>사진</th><th>이름</th><th>상품 정보</th><th>가격</th><th>주문일</th><th>배송 상태</th><th>주문 상세 조회</th><th>주문 번호</th>
			<th><%if(type.equals("vendor")){
				if(method.equals("delivery")){%>배송 확인<%
					}else{%>취소 및 환불 확인<%}
			}else if(type.equals("client")){ %>취소 및 환불 신청<%}
			%></th></tr>
			<%for(int i=0; i<pay_list.size(); i++){
					PaymentBean pb = pay_list.get(i);
				ProductBean prob = prodao.getProduct(pb.getProduct_num()); %>
			<tr>
				<td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
				<td><%=prob.getSubject() %></td>
				<td><%=prob.getContent() %></td>
				<td><%=prob.getPrice() %></td>
				<td><%=pb.getDate() %></td>
				<td><%=pb.getState() %></td>
				<td><%=pb.getOrder_num() %></td>
				<td><input type="button" onclick="location.href='PayDetail.pa?num=<%=pb.getNum() %>'" value="주문 상세 조회"></td>
				<td><%
							//구매자 일때 취소 및 환불
							if(type.equals("client")){
								if(pb.getState().equals("delivery")){
									%>배송중일때는 취소요청이 불가 합니다<%
								}else if(pb.getState().equals("cancelHold")){
									%>취소 대기중<%
								}else{
									%><input type="button" onclick="location.href='PayCancel.pa?num=<%=pb.getNum() %>'" value="주문 취소"><%
								}
							
							}	
							//판매자 일때 취소 및 환불
							if(type.equals("vendor")){
								if(pb.getState().equals("cancelHold")){
									%><input type="button" value="취소 확인" onclick="location.href='PayCancel.ve?num=<%=pb.getNum()%>'"><%
								}else if(pb.getState().equals("cancel")){
									%>취소 된 주문<%
								}else if(pb.getState().equals("delivery")){
									%><input type="button" value="배송 완료" onclick="location.href='PayDeliveryAction.pa?num=<%=pb.getNum()%>'"><%

								}else if(pb.getState().equals("waiting")){//무통장 입금시
									%><input type="button" value="입금 확인" onclick="location.href='PayDepositDone.ve?num=<%=pb.getNum()%>'"><%

								}else{
									%>비고<%
								}
							} %></td>
			</tr>
			<%} %>
		</table>
	<%}%>    	
</body>
</html>