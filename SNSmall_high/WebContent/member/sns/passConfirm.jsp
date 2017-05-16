<%@page import="web.sns.db.SnsBean"%>
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
<script type="text/javascript">
function submitpassCheck(){
	if(document.fr.pass.value==""){
 		alert("비밀번호를 입력해 주세요");
 		document.fr.pass.focus();
 		return false;
 	}	
}
</script>

</head>
<body>
<jsp:include page="../../inc/header.jsp"/>
<div class="container">
 <div class="content">
  <div class="more_content">
     <div class="col-md-3">
   <jsp:include page="../../inc/myinfo_sns_left.jsp"/>
     </div>
     <div class="col-md-9">
<form onsubmit="return submitpassCheck()" name="fr" action="./passComfirmAction.sn">
비밀번호 확인 : <input type="password" name="pass" id="pass">
<input type="submit" value="비밀번호확인">
</form> 
</div></div></div></div>
</body>
</html>