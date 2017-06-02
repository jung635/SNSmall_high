<%@page import="web.live.db.LiveBean"%>
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
<%List<LiveBean> list = (List<LiveBean>)request.getAttribute("list"); 
for(int i=0; i<list.size(); i++){
	LiveBean lb = list.get(i);%>
<%=lb.getSns_id() %>
<%} %>
</body>
</html>