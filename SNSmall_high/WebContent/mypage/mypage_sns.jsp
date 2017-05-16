<%@page import="java.util.StringTokenizer"%>
<%@page import="web.sns.db.SnsBean"%>
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
<%
String id = (String)session.getAttribute("id"); 
String type= (String)session.getAttribute("type");

if(id==null){
	response.sendRedirect("./Login.ve");  
}

SnsBean sb = (SnsBean)request.getAttribute("sb");

//서브이미지 분해
String[] array;
String s = sb.getDetail_img();
array=s.split(",");

%>
<div class="container">
 <div class="content">
  <div class="more_content">
     <div class="col-md-3">
   <jsp:include page="../inc/myinfo_sns_left.jsp"/>
     </div>
     <div class="col-md-9">

<legend>Basic info</legend>
<table>
<tr> <td>아이디</td><td><%=id %></td> </tr>
<tr> <td>이름</td><td><%=sb.getName() %></td> </tr>
<tr> <td>카테고리</td><td><%=sb.getCategory() %></td> </tr>
</table>
<legend>SNS Acount</legend>
<table>
<tr> <td></td><td></td> </tr>
<tr> <td></td><td></td> </tr>
</table>
<legend>total sale</legend>
<table>
<tr> <td>sell</td><td><%=sb.getSell() %></td> </tr>
<tr> <td>profit</td><td><%=sb.getSns_profit() %></td> </tr>
</table>
<legend>introduce</legend>
<%=sb.getContent() %>
<legend>Profile Image</legend>
<img src="./sns_pro_upload/<%=sb.getProfile_img()%>" width="200" height="100">


<legend>Sub Image</legend>
<table>
 <tr><td>
  <% for(int i=0; i<array.length;i++){%>
    <img src="./sns_pro_upload/<%=array[i]%>"  width="100" height="100">
  <%} %>
 </td><tr>
				</table>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>