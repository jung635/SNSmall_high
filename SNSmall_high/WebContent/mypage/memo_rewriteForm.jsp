
<%@page import="web.memo.db.MemoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
	<link href="./css/memo.css" rel="stylesheet"> 
	
<title>Insert title here</title>

<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>

<script type="text/javascript">
function check(){

/* 	if(document.fr.to_id.value==""){
		//받는사람 아이디를 입력하세요. 커서 깜박 되돌아가기
		alert("받는사람 아이디를 입력하세요");
		document.fr.to_id.focus();
		return false;
	} */
	if(document.fr.subject.value==""){
		//제목을 입력하세요. 커서 깜박 되돌아가기
		alert("제목를 입력하세요");
		document.fr.subject.focus();
		return false;
	}
	if(document.fr.content.value==""){
		//내용을 입력하세요. 커서 깜박 되돌아가기
		alert("내용을 입력하세요");
		document.fr.content.focus();
		return false;
	}
	
	if(confirm("답글를 보내시겠습니까?")){
		
		/* window.close(); */
	}else{
		document.fr.reset();
		return false;
	}

}
</script>

</head>
<body>
<%-- <jsp:include page="../inc/header.jsp"/> --%>
<%
String id = (String)session.getAttribute("id");

%>
<%
String to_id = request.getParameter("to_id");
String from_id = request.getParameter("from_id");
String num = request.getParameter("num");


%>

<h3>쪽지글 답하기</h3>

<article>
<fieldset>
<form action="./MemoReWriteAction.me" method="post" name="fr" onsubmit="return check()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="from_id" value="<%=to_id %>">
<label for="to_id">받는사람 </label> <input type="text" name="to_id" value="<%=from_id%>"   id="to_id" class="to_id" readonly><br>
<label for="subject">제목 </label> <input type="text" name="subject" value="[답글]"  id="subject" class="subject"><br>
<label for="content">내용 </label> <textarea rows="10" cols="50" name="content"  id="content" class="content"></textarea><br>
<input type="submit" value="쪽지 답하기" class="submit">
	<input type="reset" value="다시 쓰기" class="cancel">
</form>
</fieldset>
</article>


</body>
</html>
