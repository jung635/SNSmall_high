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
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/product.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%String id = (String)session.getAttribute("id");
%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../inc/myinfo_client_left.jsp"/>
            </div>
            <div class="col-md-9">
            
              <div style="margin: 50px 0 50px 0">
				<div class="top-subject">
				<span style="color: red;"><i class="fa fa-heart" aria-hidden="true"></i></span>
				찜 리스트</div>

<%
List<ZzimBean> list=(List)request.getAttribute("list");
ZzimBean zb = new ZzimBean();
if(list.size()==0){
	%>찜을 해주세요. <%
}else{
%>
<div class="col-md-12">
 <div class="panel panel-default text-center" style="border-color: white;">
<table class="zzim-table">

<tr>
<th>상품정보</th>
<th>찜한 날짜</th>
<th>관리</th></tr>
<%
for(int i=0;i<list.size();i++){
	zb = list.get(i);
	%>
	<tr>
	<td class="zzim_subject" style="padding-left: 40px !important;">
		<span class="zzim-sub"><%=zb.getSubject() %></span><br>
		<span class="zzim-pri"><%=zb.getPrice() %><span style="font-size: 10px;">원</span></span>
	</td>
	<td class="zzim_date"><%=zb.getDate() %></td>
	<td class="zzim_mang">
	<a href="./ProductDetail.pr?product_num=<%=zb.getProduct_num()%>"><input type="button" class="zzim-pg-btn" value="해당 상품으로 이동"></a><br>
	<a href="./ZzimDeleteAction.zz?product_num=<%=zb.getProduct_num()%>"><input type="button" class="zzim-pg-btn2" name="delete" value="삭제"></a>
	</td>
	</tr>

	<%
}
}


%>

</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>



</body>
</html>