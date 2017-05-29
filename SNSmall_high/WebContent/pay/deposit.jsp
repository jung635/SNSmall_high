<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String merchant_uid = request.getParameter("merchant_uid");
String vendorId_str = request.getParameter("vendorId_str");
String[] vendor_id = vendorId_str.split(",");
int price = Integer.parseInt(request.getParameter("price"));
String amount_str = request.getParameter("amount_str");
String[] amount = amount_str.split(",");
String product_str = request.getParameter("product_str");
String[] product = product_str.split(",");
int point = Integer.parseInt(request.getParameter("point"));
String snsId_str = request.getParameter("snsId_str");
String[] sns_id = snsId_str.split(",");
String message = request.getParameter("message");
String option1_str = request.getParameter("option1_str");
String[] option1 = option1_str.split(",");
String option2_str = request.getParameter("option2_str");
String[] option2 = option2_str.split(",");
String option3_str = request.getParameter("option3_str");
String[] option3 = option3_str.split(",");
String method = request.getParameter("method");
String address = request.getParameter("address");
%>
<%
/* Date date = new Date();
date.setDate(date.getDate()+1); */
Calendar today = Calendar.getInstance ( );
today.add ( Calendar.DATE, 1 );
Date tomorrow = today.getTime ( );
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분 까지");
%>
<form action="PayCompleteAction.pa" name="fr">
		<input type="hidden" name="amount_str" value='<%=amount_str %>'>
		<input type="hidden" name="product_str" value='<%=product_str %>'>
		<input type="hidden" name="vendorId_str" value='<%=vendorId_str %>'>
		<input type="hidden" name="snsId_str" value='<%=snsId_str %>'>
		<input type="hidden" name="option1_str" value='<%=option1_str %>'>
		<input type="hidden" name="option2_str" value='<%=option2_str %>'>
		<input type="hidden" name="option3_str" value='<%=option3_str %>'>
		<input type="hidden" name="merchant_uid" value='<%=merchant_uid %>'>
		<input type="hidden" name="point" value='<%=point %>'>
		<input type="hidden" name="message" value='<%=message %>'>
		<input type="hidden" name="price" value='<%=price %>'>
		<input type="hidden" name="method" value='<%=method %>'>
		<input type="hidden" name="address" value='<%=address %>'>
<table>
	<tr>
		<td>입금 은행</td>
  		<td>
  		<select name="selectbox">
			<option value="kb">국민은행</option>  
			<option value="nh">농협은행</option>  
			<option value="bs">부산은행</option>  
   		</select>
  		</td>
	</tr>
 	<tr>
 		<td>입금 기한</td><td><%=sdf.format(tomorrow) %></td>
 	<tr>
</table>

<div>
	 무통장입금 시 유의사항<br>
 	입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.<br>
	 무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.<br>
 	은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.<br>
</div>
<input type="submit" value="확인">
<button onclick="window.close()">취소</button>
</form>
</body>
</html>