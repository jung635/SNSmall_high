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
축하드립니다!<br>
<%=rank %>로 랭킹 UP하셧어요!<br>

업그레이드된 혜택들을 확인해보세요!<br>
<%
if(rank.equals("plus")){
%>
10%의 profit을  받을 수 있습니다.
<%	
}else if(rank.equals("premium")){
%>
20%의 profit을  받을 수 있습니다.	
<%}
%>
</body>
</html>