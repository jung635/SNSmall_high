<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id = (String)session.getAttribute("id");
	String type = (String)session.getAttribute("type");
%>
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
                
                    <h1>글쓰기 페이지</h1>
						<form action="./writeAction.bo" method="post" name="fr">
							<table style="border-collapse: collapse;">
								<input type="hidden" name="id" value=<%=id%>>
								<input type="hidden" name="type" value=<%=type%>>
								<tr>
									<th>제목</th><td><input type="text" size="93" name="subject"></td>
								</tr>
								
								<tr>
									<th>내용</th>
									<td><textarea rows="20" cols="94" name="content"></textarea></td>
								</tr>
								
								<tr>
									<td colspan="2"><input type="submit" value="글등록">
										<input type="reset" value="취소" onclick="history.back()"></td>
								</tr>
							</table>
						</form>
                    
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