<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
<title>Insert title here</title>
<%
List<PaymentBean> pb_list = (List<PaymentBean>)request.getAttribute("pb_list");
List<Integer> cancel_num = (List<Integer>)request.getAttribute("cancel_num"); 
int usedPoint = (Integer)request.getAttribute("usedPoint");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	check();
});

function check(){
	if('<%=cancel_num.size()%>'==0){
		alert('이미 취소신청을 하거나 취소된 상품은 취소신청이 불가능 합니다.');
		history.back();
	}else if('<%=usedPoint%>'>0){
		alert('포인트를 사용한 배송은 해당 상품 퍼센트에 해당하는 포인트만 돌려받을 수 있습니다.');
	}
}
</script>
</head>
<body>
<%
if(cancel_num.size()!=0){ %>
<%
int cancel_point = (Integer)request.getAttribute("cancel_point");
int length = pb_list.size();
String merchant_uid = pb_list.get(0).getOrder_num();
int price = (Integer)request.getAttribute("price");
ProductDAO prodao = new ProductDAO();
String cancel_num_str = "";
%>
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
		<div id = "pay_check">
		<div><h2>결제 정보 확인</h2></div>
		<table border="1" style="width: 900px; margin: auto;">
			<tr><td rowspan="<%=length+1 %>" style="width: 150px;">주문번호<br><%=merchant_uid%></td><td>상품정보</td><td>가격</td><td>갯수</td><td>총 금액</td></tr>
			<%for(int i=0; i<length; i++){
				PaymentBean pb = pb_list.get(i);
				boolean isCancel = false;
				int product_num = pb.getProduct_num();
				ProductBean prob = prodao.getProduct(product_num);
				for(int j=0; j<cancel_num.size(); j++){
					if(cancel_num.get(j)==product_num){
						cancel_num_str += pb.getNum()+",";
						isCancel = true;
					}
				}
				if(isCancel){%>
					<tr style="font-style: italic; font-weight: bold;"><td><%=prob.getSubject() %>(취소상품)</td><td><%=prob.getPrice() %></td><td><%=pb.getAmount() %></td><td><%=pb.getAmount()*prob.getPrice() %></td></tr>
				<%}else{%>
					<tr><td><%=prob.getSubject() %></td><td><%=prob.getPrice() %></td><td><%=pb.getAmount() %></td><td><%=pb.getAmount()*prob.getPrice() %></td></tr>
			 <%}}%>
			<tr><td colspan="5" style="text-align: right;">사용한 포인트: <%=usedPoint %></td></tr>
			<tr><td colspan="5" style="text-align: right;">총 금액: <%=price %></td></tr>
	 		<tr><td colspan="5" style="text-align: right; font-style: italic; font-weight: bold; "> 회수 받을 포인트: <%=cancel_point %></td></tr>
	 		<tr><td colspan="5" style="text-align: right;">총 결제 금액: <%=price-usedPoint %></td></tr>
		</table>
		</div>
	</div>
	<div id="pay_bottom">
		<input type="button" value="구매목록" onclick="location.href='PayList.pa'">
		<input type="button" value="주문 취소" onclick="location.href='PayCancelPoint.pa?num=<%=cancel_num_str%>'">
		<input type="button" value="확인">
		<%} %>
	</div>
	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
	</footer>
 </div>
</body>
</html>