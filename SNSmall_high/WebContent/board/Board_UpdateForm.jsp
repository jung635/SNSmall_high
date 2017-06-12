<%@page import="web.board.db.BoardBean"%>
<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	BoardBean bb = (BoardBean)request.getAttribute("bb");
	/* 이전페이지 받아옴 */
	String returnUrl = request.getHeader("referer");
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
	<link href="./css/board.css" rel="stylesheet">
	
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
                <h1 class="page-header">매칭게시판</h1>
                <p>
                SNS 스타와 판매자들간의 매칭을 위한 공간입니다.<br>
               	매칭 외의 글 작성 시, 불이익이 생기니 주의해주시기 바랍니다.<br>
               	비속어, 비방글 작성 시 제약이 생길 수 있습니다.
                </p>
            </div>
        </div>
	
		<!-- 테이블 모양 테스트 -->
		<div class="row">
		<div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="panel panel-default text-center" style="border:none;">
						<form action="./BoardUpdateAction.bo" method="post" name="fr">
							<table style="border-collapse: collapse;">
								<input type="hidden" name="num" value=<%=bb.getNum()%>>
								<input type="hidden" name="returnUrl" value=<%=returnUrl%>>
								<tr>
									<td colspan="2"><input type="text" size="93" name="subject" class="board-write-subject-box"  style="margin: 20px;" placeholder="　제목" value="<%=bb.getSubject() %>"></td>
								</tr>
								
								<tr>
									<td colspan="2"><textarea rows="20" class="board-write-content-box" cols="94" name="content"  placeholder="　내용"><%=bb.getContent() %></textarea></td>
								</tr>
								
								<tr>

								</tr>
							</table>
							
							<div class="col-md-2"></div>
							<div class="col-md-8">
							<input type="submit" class="board-write-commit-btn" value="수정">
							<input type="reset" class="board-write-cancel-btn" value="취소" onclick="history.back()">
							</div>
							<div class="col-md-2"></div>
							
						</form>
                    
                </div>
            </div>
            <div class="col-md-2"></div>                     
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