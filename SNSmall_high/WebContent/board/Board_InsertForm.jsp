<%@page import="web.sns.db.SnsBean"%>
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
						<form action="./writeAction.co" method="post" name="fr"
							enctype="multipart/form-data" onsubmit="return submitCheck()">
							<table border="1">
								<tr>
									<td>구분</td>
									<td><select name="type">
											<option value="fashion">패션</option>
											<option value="beauty">뷰티</option>
											<option value="baby">육아</option>
											<option value="daily">일상</option>
											<option value="gym">운동</option>
											<option value="etc">기타</option>
									</select></td>
								</tr>
<%-- 								<input type="hidden" name="vendor_id" value=<%=id%>> --%>
								<tr>
									<td>상품명</td>
									<td><input type="text" name="subject"></td>
								</tr>
								<tr>
									<td>제품정보</td>
									<td><input type="text" name="content"></td>
								</tr>
								<tr>
									<td>메인제품이미지</td>
									<td><input type="file" name="main_img"></td>
								</tr>
								<tr>
									<td>상세이미지</td>
									<td><input type="file" name="detail_img"></td>
								</tr>
								<tr>
									<td>옵션1</td>
									<td>옵션명<input type="text" name="opt_name1">옵션<input
										type="text" name="option1"></td>
								</tr>
								<tr>
									<td>옵션2</td>
									<td>옵션명<input type="text" name="opt_name2">옵션<input
										type="text" name="option2"></td>
								</tr>
								<tr>
									<td>옵션3</td>
									<td>옵션명<input type="text" name="opt_name3">옵션<input
										type="text" name="option3"></td>
								</tr>
								<tr>
									<td>판매가</td>
									<td><input type="text" name="price"></td>
								</tr>
								<tr>
									<td>수량</td>
									<td><input type="text" name="amount"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="상품등록">
										<input type="reset" value="다시등록"></td>
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