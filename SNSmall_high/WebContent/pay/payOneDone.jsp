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
	<title>SN#</title> 
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
int num = Integer.parseInt(request.getParameter("num"));
int totalprice=0;
PaymentDAO pdao = new PaymentDAO();
List pb_list = pdao.payDetail(num);
int usedPoint = 0;
String option_all = "";
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
<tr><td rowspan="2" class="pay-ord-num"><b>주문번호</b><br><div style="word-break:break-all;"><%=merchant_uid%></div></td>
<td class="pay-ord-info"><b>상품정보</b></td>
<td class="pay-ord-pri"><b>가격</b></td>
<td class="pay-ord-pri"><b>개수</b></td>
</tr>
<%
if(pb_list!=null){
PaymentBean pb = (PaymentBean)pb_list.get(0);
ProductBean prob = (ProductBean)pb_list.get(1);


int price = prob.getPrice()*pb.getAmount();
usedPoint += pb.getUsedPoint();
totalprice = price-usedPoint;

if(pb.getOption1() != null && !pb.getOption1().equals("") && !pb.getOption1().equals("null")) option_all += pb.getOption1()+"/";
if(pb.getOption2() != null && !pb.getOption2().equals("") && !pb.getOption2().equals("null")) option_all += pb.getOption2()+"/";
if(pb.getOption3() != null && !pb.getOption3().equals("") && !pb.getOption3().equals("null")) option_all += pb.getOption3()+"/";
if(option_all.length()>0) option_all = option_all.substring(0,option_all.length()-1);
%>
 <tr><td><%=prob.getSubject() %> (<%=option_all %>)</td><td><%=prob.getPrice() %></td><td><%=pb.getAmount() %></td></tr>

 <tr><td><b>배송지</b></td><td colspan="3" style="text-align: left;"><%=pb.getAddress() %></td></tr>
 
 
</table>

<table class="total-pri">
<tr>
					 <th class="pri-1">상품 금액</th>
					 <th class="pri-2">사용한 포인트</th>
					 <th class="pri-3" style="font-size: 25px;">총 결제 금액</th>
				 </tr>
				 <tr>
					 <td class="pri-1"><%=prob.getPrice() %> 원</td>
					 <td class="pri-2">- <%=usedPoint %> P</td>
					 <td class="pri-3" style="font-size: 30px;"><b><%=totalprice %> 원</b></td>
				 </tr>
</table>
<%} %>
</div>
</div></div>
</div>
<div id="pay_bottom">
<input type="button" value="구매목록" onclick="location.href='PayList.pa'">
<input type="button" value="주문 취소" onclick="location.href='PayMultipleCancel.pa?order_num=<%=merchant_uid%>'">
<input type="button" value="확인" onclick="location.href='Main.cl'">


	</div>
	        <hr>

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