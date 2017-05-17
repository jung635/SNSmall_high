<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>	
</head>
<body>

<jsp:include page="../inc/header.jsp"/>

<!-- 리퀘스트 세션값 받아오기 -->
	<%
		
	%>
<!-- 리퀘스트 세션값 받아오기 -->

<!-- Page Content -->
<div class="container">
	<div class="content">
  		<!-- Introduction Row -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
                <h1 class="page-header">홍보게시판</h1>
                <p>SNS 스타와 판매자들간의 매칭을 위한 공간입니다.</p>
            </div>
        </div>
        	
		<!-- 테이블 모양 테스트 -->
		<div class="row">
            <div class="col-md-8">
                <div class="panel panel-default text-center">
                    <table>
                    	<h3>
							<a href="./writeForm.co">글쓰기</a>
						</h3>
                    	<tr style="border-bottom: 1px double gray;"><th>구분</th><th>제목</th><th>글쓴이</th><th>등록일</th></tr>
						
						<!-- 조건 for문 시작할 부분 -->
						<tr><td></td><td></td><td></td><td></td></tr>
						<!-- 조건 for문 끝낼 부분 -->
						
					</table>
                    
                </div>
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
</body>
</html>