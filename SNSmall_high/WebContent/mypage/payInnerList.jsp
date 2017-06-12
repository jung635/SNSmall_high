<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/pay.css" rel="stylesheet"> 
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
String merchant_uid = "";
String content="";
%>
	<h2><%=method %></h2>
	<%if(pay_list_done == null&&pay_list == null){ %>
		내역이 없습니다.
	<%}
	if(method.equals("payDone")){
	pay_list_done= (List<List<PaymentBean>>)request.getAttribute("pay_list_done");%>

					<%for(int i=0; i<pay_list_done.size(); i++){

				pay_list_reult = pay_list_done.get(i);%>
				<div class="col-md-12">
				<div class="panel panel-default" style="padding: 10px;">
					<table class="pay-done-table">
						<%for(int j=0; j<pay_list_reult.size(); j++){
							PaymentBean pb = pay_list_reult.get(j);
							merchant_uid = pb.getOrder_num();
							ProductBean prob = prodao.getProduct(pb.getProduct_num()); 
							int price=0;
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							String date = format.format(pb.getDate());
							String subject;
							if(prob==null){
								%><tr><td colspan="9">삭제된 상품 입니다. 상품정보에 대한 문의는 회사를 통해주시기 바랍니다.(<%=pb.getOrder_num() %>)</td>
								<td><%
							//구매자 일때 취소 및 환불
							if(type.equals("client")){
								if(pb.getState().equals("delivery")){
									%>배송중일때는 취소요청이 불가 합니다<%
								}else if(pb.getState().equals("cancelHold")||pb.getState().equals("w_cancelHold")){
									%>취소 대기중<%
								}else if(pb.getState().equals("cancel")){
									%>취소된 상품<%
								}else{
									%><div style="width: auto;"><input type="button" onclick="location.href='PayCancel.pa?num=<%=pb.getNum()%>&merchant_uid=<%=merchant_uid%>'" value="주문 취소"></div><%
								}
							}
							}else{
								subject = prob.getSubject();
								
						%>
						<%if(j==0){ %>
						<tr><td colspan="6" class="ord-dat"><%=date %></td> </tr>
						<%} %>
						
						<tr><%
					
							price = pb.getAmount()*prob.getPrice();
								if(prob.getContent().length()>30){content =prob.getContent().substring(0,31)+"...";}%>
							<td class="ord-num" style="width: 100px !important; word-break:break-all;"><div style="text-align: center;">주문번호</div><div style="word-break:break-all;"><%=pb.getOrder_num() %></div></td>
							<td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 90px; height: 90px;"></div></td>
							<td class="ord-sub">
							<div class="ord-sub-in"><%=subject %></div>
							<div class="ord-con"><%=content %></div>
							<div class="ord-pri"><%=price %> 원</div>
							</td>
							<td class="ord-sta"><%=pb.getState() %></td>
							<td style="text-align: center;"><input type="button" onclick="location.href='PayOneDone.pa?num=<%=pb.getNum()%>&merchant_uid=<%=merchant_uid%>'" value="주문 상세 조회"><br>
							<%
							//구매자 일때 취소 및 환불
							if(type.equals("client")){
								if(pb.getState().equals("delivery")){
									%>배송중일때는 취소요청이 불가 합니다<%
								}else if(pb.getState().equals("cancelHold")||pb.getState().equals("w_cancelHold")){
									%>취소 대기중<%
								}else if(pb.getState().equals("cancel")){
									%>취소된 상품<%
								}else{
									%><div style="width: auto;"><input type="button" onclick="location.href='PayCancel.pa?num=<%=pb.getNum()%>&merchant_uid=<%=merchant_uid%>'" value="주문 취소"></div><%
								}
							
							}	
							//판매자 일때 취소 및 환불
							if(type.equals("vendor")){
								if(pb.getState().equals("cancelHold")||pb.getState().equals("w_cancelHold")){
									%><input type="button" value="취소 확인" onclick="location.href='PayCancel.ve?num=<%=pb.getNum()%>'"><%
								}else if(pb.getState().equals("cancel")){
									%>취소 된 주문<%
								}else if(pb.getState().equals("delivery")){
									%><input type="button" value="배송 완료" onclick="location.href='PayDeliveryAction.pa?num=<%=pb.getNum()%>'"><%

								}else if(pb.getState().equals("waiting")){//무통장 입금시
									%><input type="button" value="입금 확인" onclick="location.href='PayDepositDone.ve?num=<%=pb.getNum()%>'"><%

								}else if(pb.getState().equals("payDone")){
									%><input type="button" value="배송 하기" onclick="location.href='todelivery.pa?num=<%=pb.getNum()%>'"><%
								}else{
									%>비고<%
								}
							}} %></td>
						</tr>
						<%}%>
					</table>
					<%if(type.equals("client")){ %>
					<div class="group-search-btns">
					<input type="button" value="일괄 조회" onclick="location.href='PayDone.pa?merchant_uid=<%=merchant_uid %>'"> 
					<input type="button" value="일괄 취소" onclick="location.href='PayMultipleCancel.pa?order_num=<%=merchant_uid%>'">
					</div>
				<%}%>
				</div>
			</div>
				<%} %>
		
	<%}else{
		pay_list = (List<PaymentBean>)request.getAttribute("pay_list2");
	%>
		<div class="panel panel-default" style="padding: 10px;">
		<table id="pay-state-table">
			<tr>
			<th class="state-ord-num">주문 번호</th>
			<th colspan="2" style="width: 350px;">상품 정보</th>
			<th style="width: 100px;">주문일</th>
			<th style="width: 120px;">주문 상세 조회</th>
			
			<th class="state-conf-can"><%if(type.equals("vendor")){
				if(method.equals("delivery")){%>배송 확인<%
					}else{%>취소 및 환불 확인<%}
			}else if(type.equals("client")){ %>취소 신청<%}
			%></th></tr>
			<%

			for(int i=0; i<pay_list.size(); i++){
					PaymentBean pb = pay_list.get(i);
					merchant_uid = pb.getOrder_num();
				ProductBean prob = prodao.getProduct(pb.getProduct_num());
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String date = format.format(pb.getDate());
				if(pb.getSns_id()==null ||pb.getSns_id().equals(" ") ||pb.getSns_id().equals("null")){pb.setSns_id("없음");}
				if(prob.getContent().length()>3){content =prob.getContent().substring(0,4)+"...";}
											if(prob==null){
								%><tr><td colspan="8">삭제된 상품 입니다. 상품정보에 대한 문의는 회사를 통해주시기 바랍니다.(<%=pb.getOrder_num() %>)</td><td><input type="button" onclick="location.href='PayCancel.pa?num=<%=pb.getNum() %>&merchant_uid=<%=pb.getOrder_num()%>'" value="주문 취소"></td></tr> <%
							}%>
			
			<tr>
				<td style="border-right: 1px solid #ccc;"><div style="word-break:break-all;"><%=pb.getOrder_num() %></div></td>
				<td style="background-color: #f7f7f7;"><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 90px; height: 90px"></td>
				<td style="text-align: left; border-right: 1px solid #ccc; background-color: #f7f7f7;">
					<div class="ord-sub-in"><%=prob.getSubject() %></div>
					<div class="ord-pri"><%=prob.getPrice() %> 원</div>	
					<div class="ord-con"><%=content %></div>	
				</td>
				<td style="border-right: 1px solid #ccc;"><%=date %></td>
				<td style="border-right: 1px solid #ccc; background-color: #f7f7f7;"><input type="button" onclick="location.href='PayOneDone.pa?num=<%=pb.getNum() %>&merchant_uid=<%=merchant_uid%>'" value="주문 상세 조회"></td>
				<td><%
							//구매자 일때 취소 및 환불
							if(type.equals("client")){
								if(pb.getState().equals("delivery")){
									%>배송중일때는 취소요청이 불가 합니다<%
								}else if(pb.getState().equals("cancel")){
									%>취소 된 주문<%
								}else if(pb.getState().equals("cancelHold")||pb.getState().equals("w_cancelHold")){
									%>취소 대기중<%
								}else{
									%><input type="button" onclick="location.href='PayCancel.pa?num=<%=pb.getNum() %>'" value="주문 취소"><%
								}
							
							}	
							//판매자 일때 취소 및 환불
							if(type.equals("vendor")){
								if(pb.getState().equals("cancelHold")||pb.getState().equals("w_cancelHold")){
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
	</div>
	<%}%>    	
</body>
</html>