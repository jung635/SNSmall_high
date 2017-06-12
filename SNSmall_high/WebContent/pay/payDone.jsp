<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/inner.css" rel="stylesheet">
	<link href="css/header.css" rel="stylesheet">
	<link href="css/pay.css" rel="stylesheet">
<title>Insert title here</title>
<style>
#pay_bottom{
	text-align: center;
}
#pay_check{
	margin-bottom: 63px;
}
</style>
</head>
<body>
<%
String merchant_uid = request.getParameter("merchant_uid");
PaymentDAO pdao = new PaymentDAO();
List<PaymentBean> pb_list = pdao.getPayment(merchant_uid);
int length = pb_list.size();
int price = 0;
int usedPoint = 0;
String address = pb_list.get(0).getAddress();
%>
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <div class="col-md-12">
    <div class="panel panel-default text-center" style="border-color: white;">
		<div id = "pay_check">
			<div style="text-align: left;"><h3>결제 정보 확인</h3></div>
			<hr style="border-color: #fc7700;">
			<br><br>
			<table border="1" style="margin: auto;" class="pro-info">
				<tr>
				<td rowspan="<%=length+1 %>" class="pay-ord-num">주문번호<br><div style="word-break:break-all;"><%=merchant_uid%></div></td>
				<td class="pay-ord-info"><b>상품정보</b></td>
				<td class="pay-ord-pri"><b>가격</b></td>
				<td class="pay-ord-pri"><b>개수</b></td>
				</tr>
				<%
				for(int i=0; i<length; i++){
					String option_all = "";
					PaymentBean pb = pb_list.get(i);
						int product_num = pb.getProduct_num();
						ProductDAO prodao = new ProductDAO();
						ProductBean prob = prodao.getProduct(product_num);
						if(prob != null){
						price += pb.getPay_price();
						usedPoint += pb.getUsedPoint();
						if(pb.getOption1().trim().length() != 0) option_all += pb.getOption1()+"/";
						if(pb.getOption2().trim().length() != 0) option_all += pb.getOption2()+"/";
						if(pb.getOption3().trim().length() != 0) option_all += pb.getOption3()+"/";
						if(option_all.length()>0) option_all = option_all.substring(0,option_all.length()-1);
						
					%>
					 <tr><td><%=prob.getSubject() %> (<%=option_all %>)</td><td><%=prob.getPrice() %>원</td><td><%=pb.getAmount() %>개</td></tr>
				 <%}else{
					 usedPoint += pb.getUsedPoint();
					 price += pb.getPay_price(); %>
					 <tr><td colspan="3">삭제된 상품입니다</td></tr>
				 <%}} %>
				 
				 <tr><td><b>배송 주소</b></td><td colspan="3" style="text-align: left; padding-left: 20px;"><%=address %></td></tr>
				 
				 </table>
				 
				 <table class="total-pri">
				 <tr>
					 <th>총 상품 금액</th>
					 <th style="background-color: #fff; color:#fc7700;">사용한 포인트</th>
					 <th style="color:#ae0000;">총 결제 금액</th>
				 </tr>
				 <tr>
					 <td style="color:#fff;"><%=price %> 원</td>
					 <td  style="background-color: #fff; color:#fc7700;">- <%=usedPoint %> P</td>
					 <td style="color: #ae0000;"><%=price-usedPoint %> 원</td>
				 </tr>
				</table>
		</div>
		</div>
	</div>
</div>
	<div id="pay_bottom" class="col-md-12">
		<input type="button" value="구매목록" onclick="location.href='PayList.pa'">
		<input type="button" value="일괄 취소" onclick="location.href='PayMultipleCancel.pa?order_num=<%=merchant_uid%>'">
		<input type="button" value="확인" onclick="location.href='Main.cl'">
	</div>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
         <!-- /.container -->

 </div>
</body>
</html>