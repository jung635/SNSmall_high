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
String rank = request.getParameter("rank");
%>
<%=rank %>로 랭킹 DOWN되셧어요.<br>
하지만 곧 업그레이드 되실 수 있으실 거에요!<br>

변화된 사항<br>
<%if(rank.equals("plus")){%>
10%의 profit을  받을 수 있습니다.
<%}else if(rank.equals("premium")){%>
20%의 profit을  받을 수 있습니다.	
<%}else if(rank.equals("basic")){%>
5%의 profit을  받을 수 있습니다.	
<%} %>
</body>
</html>