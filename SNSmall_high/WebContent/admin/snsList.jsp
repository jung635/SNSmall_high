<%@page import="web.sns.db.SnsBean"%>
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
<%List<SnsBean> list = (List<SnsBean>)request.getAttribute("sns_list");

%>
</body>
</html>