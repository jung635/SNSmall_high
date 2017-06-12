<%@page import="web.product.db.ProductBean"%>
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
<script src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
	// 가격, 수량에 숫자만 입력
	$(document).ready(function(){
		$('input:text[name=price]').keyup(function(){
			$(this).val( $(this).val().replace(/[^0-9]/g,"") );
		});
		$('input:text[name=amount]').keyup(function(){
			$(this).val( $(this).val().replace(/[^0-9]/g,"") );
		});
	});
	
	function submitCheck(){		
		if(document.fr.price.value==""){
	 		alert("판매가를 입력해 주세요!");
	 		document.fr.price.focus();
	 		return false;
	 	}
		if(document.fr.price.value != ""){	 		
	 		var regNumber = /^[0-9]*$/;
			var inputNumber = document.fr.price.value;
			if(!regNumber.test(inputNumber)){
				alert("판매가는 숫자만 입력가능합니다.");
				return false;
			}
	 	}
		if(document.fr.amount.value==""){
	 		alert("수량을 입력해 주세요!");
	 		document.fr.amount.focus();
	 		return false;
	 	}
		if(document.fr.price.value != ""){	 		
	 		var regNumber = /^[0-9]*$/;
			var inputNumber = document.fr.amount.value;
			if(!regNumber.test(inputNumber)){
				alert("수량은 숫자만 입력가능합니다.");
				return false;
			}
	 	}
		if(document.fr.opt_name1.value==""&&document.fr.opt_name2.value==""&&document.fr.opt_name3.value==""){
			alert("옵션을 하나이상은 입력해야합니다.");
			document.fr.amount.focus();
			return false;
		}
		
	}
	

</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
ProductBean prb=(ProductBean)request.getAttribute("prb");
String opt_name1 = (String)request.getAttribute("opt_name1");
String opt_name2 = (String)request.getAttribute("opt_name2");
String opt_name3 = (String)request.getAttribute("opt_name3");
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
						<div class="product-top-tit">　Product Update Page</div>
						<form action="./ProductUpdateAction.pr" name="fr" method="post" enctype="multipart/form-data" class="product-form" onsubmit="return submitCheck()">
							<input type="hidden" name="product_num" value=<%=prb.getProduct_num()%>>
							<input type="hidden" name="pre_main_img" value=<%=prb.getMain_img() %>>
							<input type="hidden" name="pre_detail_img" value=<%=prb.getDetail_img() %>>
			
							<div class="col-md-3 product-tit">카테고리</div>
							<div class="col-md-9 product-con">
								<select name="category" style="width: 160px;">
									<option value="fashion" <%if(prb.getCategory().equals("fashion")){%>selected<%} %>>패션</option>
									<option value="beauty" <%if(prb.getCategory().equals("beauty")){%>selected<%} %>>뷰티</option>
									<option value="baby" <%if(prb.getCategory().equals("baby")){%>selected<%} %>>육아</option>
									<option value="daily" <%if(prb.getCategory().equals("daily")){%>selected<%} %>>일상</option>
									<option value="gym" <%if(prb.getCategory().equals("gym")){%>selected<%} %>>운동</option>
									<option value="etc" <%if(prb.getCategory().equals("etc")){%>selected<%} %>>기타</option>
								</select>
							</div>
							
							<div class="col-md-3 product-tit">상품명</div>
							<div class="col-md-9 product-con">
								<input type="text" name="subject" value="<%=prb.getSubject() %>" width="100">
							</div>
							
							<div class="col-md-3 product-tit">제품정보</div>
							<div class="col-md-9 product-con">
								<textarea rows="15" cols="80" name="content"><%=prb.getContent() %></textarea>
							</div>
							
							<div class="col-md-3 product-tit">메인제품이미지</div>
							<div class="col-md-9 product-con"><input type="file" name="main_img" value=<%=prb.getMain_img() %>><%=prb.getMain_img() %></div>
							<div class="col-md-3 product-tit">상세이미지</div>
							<div class="col-md-9 product-con"><input type="file" name="detail_img" value=<%=prb.getDetail_img() %>><%=prb.getDetail_img() %></div>
							<div class="col-md-3 product-tit">옵션1</div>
							<div class="col-md-9 product-con">
								옵션명　<input type="text" name="opt_name1" placeholder="ex)사이즈" value="<%=opt_name1 %>">
								옵션　<input type="text" name="option1" placeholder="ex)small,medium,large" value="<%=prb.getOption1() %>">
							</div>
							<div class="col-md-3 product-tit">옵션2</div>
							<div class="col-md-9 product-con">
								<%if(opt_name2 != null){ %>
								옵션명　<input type="text" name="opt_name2" placeholder="ex)사이즈" value="<%=opt_name2 %>">
								옵션　<input type="text" name="option2" placeholder="ex)220,225,230,235" value="<%=prb.getOption2() %>">
								<%}else{ %>
								옵션명　<input type="text" name="opt_name2" placeholder="ex)사이즈">
								옵션　<input type="text" name="option2" placeholder="ex)220,225,230,235">
								<%} %>
							</div>
							<div class="col-md-3 product-tit">옵션3</div>
							<div class="col-md-9 product-con">
								<%if(opt_name3 != null){ %>
								옵션명　<input type="text" name="opt_name3" placeholder="ex)세트" value="<%=opt_name3 %>">
								옵션　<input type="text" name="option3" placeholder="ex)A,B,C" value="<%=prb.getOption3() %>">
								<%}else{ %>
								옵션명　<input type="text" name="opt_name3" placeholder="ex)세트">
								옵션　<input type="text" name="option3" placeholder="ex)A,B,C">
								<%} %>
							</div>
							<div class="col-md-3 product-tit">판매가</div>
							<div class="col-md-9 product-con">
								<input type="text" name="price" style="ime-mode:disabled;" value="<%=prb.getPrice() %>">
							</div>
							<div class="col-md-3 product-tit">수량</div>
							<div class="col-md-9 product-con">
								<input type="text" name="amount" style="ime-mode:disabled;" value="<%=prb.getAmount() %>">
							</div>
							
							<div class="col-md-12">
							<hr>
							</div>
							<div class="col-md-6">
								<input type="submit" class="pro-in-btn" value="수정완료">
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