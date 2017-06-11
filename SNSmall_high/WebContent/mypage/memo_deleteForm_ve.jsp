<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
// int num	String pageNum 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>

<h1>쪽지글 삭제하시겠습니까?</h1>
<form action="./MemoDelete_veAction.me?pageNum=<%=pageNum %>" method="post" name="fr" >
       <input type="hidden" name="num" value="<%=num %>">

<input type="submit" value="글삭제">
</form>
</body>
</html>