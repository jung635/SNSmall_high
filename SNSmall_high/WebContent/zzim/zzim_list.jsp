<%@page import="web.zzim.db.ZzimBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="web.cart.db.CartDAO"%>
<%@page import="web.cart.db.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%String id = "test";
%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../inc/myinfo_left.jsp"/>
            </div>
            <div class="col-md-9">
<h1>찜 목록</h1>
<form action="">
<%
List<ZzimBean> list=(List)request.getAttribute("list");
ZzimBean zb = new ZzimBean();
%>
<table border="1">
<tr><th>물품번호</th><th>물품명</th><th>가격</th><th>날짜</th><th>삭제</th></tr>
<%
for(int i=0;i<list.size();i++){
	zb = list.get(i);
	%>
	<tr><a href="#"><td><%=zb.getProduct_num() %></td><td>aaa</td><td><%=zb.getPrice() %></td><td><%=zb.getDate() %></td></a><td>

	<a href="./ZzimDeleteAction.zz?product_num=<%=zb.getProduct_num()%>"><input type="button" name="delete" value="삭제"></a></td></tr>

	<%
}


%>
</a>
</table>




 </form>
</div>
</div>
</div>
</div>




</body>
</html>