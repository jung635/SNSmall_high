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
	function submitCheck(){
		if(document.fr.price.value==""){
	 		alert("가격을 입력해 주세요!");
	 		document.fr.price.focus();
	 		return false;
	 	}
		if(document.fr.amount.value==""){
	 		alert("수량을 입력해 주세요!");
	 		document.fr.amount.focus();
	 		return false;
	 	}
	}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = (String)session.getAttribute("id");
%>
	<!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
<%--                 <p class="lead"><%=id %></p> --%>
                <jsp:include page="../inc/myinfo_vendor_left.jsp"/>               
            </div>
            <div class="col-md-9">
                <!-- 마이페이지 메인 -->
                <div class="thumbnail">
						<h1>상품등록 페이지</h1>
						<form action="./ProductInsertAction.pr" method="post" name="fr"
							enctype="multipart/form-data" onsubmit="return submitCheck()">
							<table border="1">
								<tr>
									<td>카테고리</td>
									<td><select name="category">
											<option value="fashion">패션</option>
											<option value="beauty">뷰티</option>
											<option value="baby">육아</option>
											<option value="daily">일상</option>
											<option value="gym">운동</option>
											<option value="etc">기타</option>
									</select></td>
								</tr>
								<input type="hidden" name="vendor_id" value=<%=id%>>
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
				<!-- 마이페이지 메인 -->
            </div>
        </div>
    </div>
    <!-- /.container -->
    <div class="container">
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