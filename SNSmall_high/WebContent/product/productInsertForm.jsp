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
	<link href="./css/product.css" rel="stylesheet"> 
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
		if(document.fr.opt_name1.value==""&&document.fr.opt_name2.value==""&&document.fr.opt_name3.value==""){
			alert("옵션을 하나이상은 입력해야합니다.");
			document.fr.amount.focus();
			return false;
		}
		
	}
	
	function numkeyCheck(){
		var keyValue = event.keyCode;
		if(!(keyValue==8||keyValue==9||keyValue==13||keyValue==46||keyValue==144||
			      (keyValue>=48&&keyValue<=57)||keyValue==110||keyValue==190)) {
			      event.returnValue = false;
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
              <div style="margin: 50px 0 50px 0">
						<div class="product-top-tit">　Product Registration</div>
						<form action="./ProductInsertAction.pr" method="post" name="fr"
							enctype="multipart/form-data" onsubmit="return submitCheck()" class="product-form">
							<input type="hidden" name="vendor_id" value=<%=id%>>
							<div class="col-md-3 product-tit">카테고리</div>
							<div class="col-md-9 product-con">
								<select name="category" style="width: 160px;">
									<option value="fashion">패션</option>
									<option value="beauty">뷰티</option>
									<option value="baby">육아</option>
									<option value="daily">일상</option>
									<option value="gym">운동</option>
									<option value="etc">기타</option>
								</select>
							</div>
							
							<div class="col-md-3 product-tit">상품명</div>
							<div class="col-md-9 product-con">
								<input type="text" name="subject" width="100" required>
							</div>
							
							<div class="col-md-3 product-tit">제품정보</div>
							<div class="col-md-9 product-con">
								<textarea rows="15" cols="80" name="content"></textarea>
							</div>
							
							<div class="col-md-3 product-tit">메인제품이미지</div>
							<div class="col-md-9 product-con"><input type="file" name="main_img"></div>
							<div class="col-md-3 product-tit">상세이미지</div>
							<div class="col-md-9 product-con"><input type="file" name="detail_img"></div>
							<div class="col-md-3 product-tit">옵션1</div>
							<div class="col-md-9 product-con">
								옵션명　<input type="text" name="opt_name1" placeholder="ex)사이즈">
								옵션　<input type="text" name="option1" placeholder="ex)small,medium,large">
							</div>
							<div class="col-md-3 product-tit">옵션2</div>
							<div class="col-md-9 product-con">
								옵션명　<input type="text" name="opt_name2" placeholder="ex)사이즈">
								옵션　<input type="text" name="option2" placeholder="ex)220,225,230,235">
							</div>
							<div class="col-md-3 product-tit">옵션3</div>
							<div class="col-md-9 product-con">
								옵션명　<input type="text" name="opt_name3" placeholder="ex)세트">
								옵션　<input type="text" name="option3" placeholder="ex)A,B,C">
							</div>
							<div class="col-md-3 product-tit">판매가</div>
							<div class="col-md-9 product-con">
								<input type="number" name="price" onkeypress="numkeyCheck()" onblur="numkeyCheck()" style="ime-mode:disabled;">
							</div>
							<div class="col-md-3 product-tit">수량</div>
							<div class="col-md-9 product-con">
								<input type="number" name="amount" onkeypress="numkeyCheck()" onblur="numkeyCheck()" style="ime-mode:disabled;">
							</div>
							
							<div class="col-md-12">
							<hr>
							</div>
							<div class="col-md-6">
								<input type="submit" class="pro-in-btn" value="상품등록">
							</div>
							<div class="col-md-6">
								<input type="reset" class="pro-in-btn" value="초기화">	
							</div>
						
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