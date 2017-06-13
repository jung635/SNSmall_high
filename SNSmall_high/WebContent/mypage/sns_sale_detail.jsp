<%@page import="web.payment.db.PaymentBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
	<link href="./css/memo.css" rel="stylesheet">  
	
	
<title>Insert title here</title>

</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = (String)session.getAttribute("id");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

/* ClientDAO cdao = new ClientDAO();
ClientBean cb = cdao.getMember(id);
PaymentDAO pdao = new PaymentDAO();
ProductDAO prodao = new ProductDAO();
//List<PaymentBean> pay_list = pdao.getPaymentById(id);
List<PaymentBean> pay_list = (List<PaymentBean>)request.getAttribute("pay_list");
System.out.println(pay_list.size()); */
%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <%-- <p class="lead"><%=id %></p> --%>
                <jsp:include page="../inc/myinfo_sns_left.jsp"/>
            </div>
            <div class="col-md-9">

<%
// 세션 가져오기

// 세션이 없으면 또는 세션이 admin이 아니면 main.jsp 이동
if(id ==null ){
 	response.sendRedirect("./Main.me");
}

// request에 저장된 memberList 가져오기
//List paymentList = (List)request.getAttribute("paymentList");
ProductBean prb = (ProductBean)request.getAttribute("prb");
PaymentBean pab = new PaymentBean();

ProductDAO prdao = new ProductDAO();


System.out.println("prb.getProduct_num()"+prb.getProduct_num());
//String content = prb.getContent();
//if(content !=null){
//	content=prb.getContent().replace("\r\n", "<br>");
//}

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">판매내역 목록
            <small></small>
        </h1>
     </div>
</div>
<div class="row">


	<table>
		<tr >
			<td>상품번호 : <%=prb.getProduct_num() %></td><td colspan=2>판매자ID : <%=prb.getVendor_id() %></td>
		</tr>
		<tr>
			<td>카테고리 : <%=prb.getCategory() %></td><td colspan=2>제목 : <%=prb.getSubject() %></td>
		</tr>
		<tr>
			<td colspan=3>내용 : <%=prb.getSubject() %></td>
		</tr>
		
		<tr>
			<td colspan=3>메인이미지 : <img src="./vendor_img/<%=prb.getMain_img() %>" width="200" height="200"></td>
		</tr>
		<tr>
			<td colspan=3>디테일 이미지 : <img src="./vendor_img/<%=prb.getDetail_img() %>" width="200" height="200"></td>
		<tr>
			<td>옵션1 : <%=prb.getOption1() %></td><td>옵션2 : <%=prb.getOption2() %></td><td>옵션3 : <%=prb.getOption3() %></td>
		</tr>
		<tr>

<%
int price = pab.getAmount()*prb.getPrice();
%>
			<td>가격 : <%=prb.getPrice() %></td>
			<td>수량 : <%=pab.getAmount() %></td>
			<td>금액 : <%=price %></td>
		</tr>

<%


%>
	<%-- <tr bgcolor="#ffeecc">
		<td><%=prb.getProduct_num() %></td><td><%=prb.getVendor_id() %></td><td><%=prb.getCategory() %></td><td><%=prb.getSubject() %></td>
		<td><%=prb.getContent() %></td><td><%=prb.getMain_img() %></td><td><%=prb.getDetail_img() %></td><td><%=prb.getOption1() %></td><td><%=prb.getOption2() %></td>
		<td><%=prb.getOption3() %></td><td><%=prb.getPrice() %></td>
		<td><%=prb.getAmount() %></td>
	</tr> --%>

</table>
    <!-- /.container -->
<!--     <div class="container"> -->
    
<div class="row text-center">
<div class="col-lg-12">
<ul class="pagination">


</div>
</div>  
    
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
    </div>
  </div>
    <!-- /.container -->
    <!-- jQuery -->
    
</body>
</html>
