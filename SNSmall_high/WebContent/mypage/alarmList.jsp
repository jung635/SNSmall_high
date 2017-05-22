<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<%String id = (String)session.getAttribute("id");
String type = (String)session.getAttribute("type");
%>
<div class="container">
	<div class="more_content">
		<div class="row">
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <%if(type.equals("vendor")){ %>
               		<jsp:include page="../inc/myinfo_vendor_left.jsp"/>
                <%}else{ %>
                	<jsp:include page="../inc/myinfo_left.jsp"/>
                <%} %>
            </div>
<%List<Map<String, Object>> list = (List)request.getAttribute("list"); 
Map<String, Object> map = null;
String color = "";
int limit = (int)request.getAttribute("limit");
%>
<%if(list == null){
	%>
	nothing
	<%}else{
	if(list.size()<5 || list.size()<limit) limit = list.size();%>

<table>
<tr><td>메시지</td></tr>
<%for(int i=0; i<limit; i++){
	map = list.get(i);
	if(map.get("state").equals("on")){
		color = "#ddd";
	}else if(map.get("state").equals("now")){
		color = "red";
	}
%>
	<tr style="background-color: <%=color%>"><td><a href="OffAlarm.al?num=<%=map.get("num")%>"><%=map.get("content")%></a> </td></tr>
<%} %> 
</table>
<%if(list.size()>=5){%>
<input type="button" value="더보기" onclick="alarmViewMore(<%=limit %>)" >
<%}} %>
		</div>
	</div>
</div>
</body>
</html>