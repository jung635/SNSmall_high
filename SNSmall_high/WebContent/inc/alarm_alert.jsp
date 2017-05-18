<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
List<Map<String, Object>> list = (List)request.getAttribute("list"); 
Map<String, Object> map = new HashMap<String, Object>();
String color = "";
if(list == null){
%>
nothing
<%}else{ %>
<ul>

<%for(int i=0; i<5; i++){
		map = list.get(i);%>

	<li><%=map.get("content") %></li>
<%} %>
</ul>
<%if(list.size()>5){%>
<input type="button" value="더보기">
<%} %>
<%} %>

</body>
</html>