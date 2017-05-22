
<%@page import="web.memo.db.MemoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>

</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = (String)session.getAttribute("id");

%>
<%
//  num   re_ref   re_lev   re_seq 파라미터 가져오기
String to_id = request.getParameter("to_id");
String from_id = request.getParameter("from_id");
int num = Integer.parseInt(request.getParameter("num"));
int re_ref = Integer.parseInt(request.getParameter("re_ref"));
int re_lev = Integer.parseInt(request.getParameter("re_lev"));
int re_seq = Integer.parseInt(request.getParameter("re_seq"));

%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../inc/myinfo_sns_left.jsp"/>
            </div>
            <div class="col-md-9">

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">쪽지글 목록
            <small></small>
        </h1>
     </div>
</div>
<div class="row">

<h1>쪽지글 답하기</h1>
<form action="./MemoReWriteAction.me" method="post" name="fr">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev%>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">
<input type="hidden" name="from_id" value="<%=to_id %>">
받는사람 : <input type="text" name="to_id" value="<%=from_id%>"><br>
제목 : <input type="text" name="subject" value="[답글]"><br>
내용 : <textarea rows="10" cols="20" name="content"></textarea><br>
<input type="submit" value="답글쓰기">
</form>


    <!-- /.container -->
<!--     <div class="container"> -->
    
<div class="row text-center">
<div class="col-lg-12">
<ul class="pagination">

</div>
</div>  
    
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
    </div>
  </div>
    <!-- /.container -->
    <!-- jQuery -->
</body>
</html>
