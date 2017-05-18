
<%@page import="web.memo.db.MemoBean"%>
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

// MemoBean meb = request 저장된 meb값 가져오기
// String pageNum= request 저장된 pageNum값 가져오기
// 		request.setAttribute("meb", meb);
// 		request.setAttribute("pageNum", pageNum);
MemoBean meb=(MemoBean)request.getAttribute("meb");
String pageNum=(String)request.getAttribute("pageNum");

%>

<h1>WebContent/mypage/memo_content.jsp</h1>
<h1>글내용 보기</h1>
<table border=1>
<tr><td>쪽지번호</td><td><%=meb.getNum()%></td></tr>
<tr><td>받는사람</td><td><%=meb.getTo_id()%></td><td>작성일</td><td><%=meb.getDate()%></td></tr>
<tr><td>쪽지제목</td><td colspan=3><%=meb.getSubject()%></td></tr>
<tr><td>쪽지내용</td><td colspan=3><%=meb.getContent()%></td></tr>
<tr><td colspan=4>

<input type="button" value="쪽지삭제" onclick="location.href='./MemoDelete.me?num=<%=meb.getNum()%>&pageNum=<%=pageNum%>'">
<input type="button" value="답글쓰기" onclick="location.href='./MemoReWrite.me?num=<%=meb.getNum()%>'">
<input type="button" value="쪽지목록" onclick="location.href='./MemoList.me?pageNum=<%=pageNum%>'"></td></tr>
</table>
</body>
</html>