<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/memo/writeForm.jsp</h1>
<h1>쪽지 쓰기</h1>
<form action="./MemoWriteAction.me" method="post" name="fr">

보낸사람 : <input type="text" name="from_id"><br>
받는사람: <input type="text" name="to_id"><br>
제목 : <input type="text" name="subject"><br>
내용 : <textarea rows="10" cols="20" name="content"></textarea><br>
<input type="submit" value="글쓰기">

</form>
</body>
</html>