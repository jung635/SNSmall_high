<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script type="text/javascript">
 		function fun1() {
		if (document.fr.pass2.value != document.fr.pass.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.fr.pass2.focus();
		return false;		
 		}
 		}
 </script>
</head>
<body>
<jsp:include page="../../inc/header.jsp"/>
	<%
		String pass = (String) session.getAttribute("pass");
	%>
	<!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
<%--                 <p class="lead"><%=id %></p> --%>
                <jsp:include page="../../inc/myinfo_vendor_left.jsp"/>               
            </div>
            <div class="col-md-9">
                <!-- 메인 내용 -->
                <div class="thumbnail">
						<form action="./vendorUpdateForm.ve" id="join" method="post"
							name="fr" onsubmit="return fun1()">
							<fieldset>
								<legend>비밀번호 확인</legend>
								<input type="hidden" name="pass" value="<%=pass%>">
								<label>현재 비밀번호</label> <input type="password" name="pass2"
									required><br>

							</fieldset>

							<div id="buttons">
								<input type="submit" value="확인" class="submit"> <input
									type="reset" value="취소" class="cancel" onclick="location.href='./MyPage.pr'">
							</div>
						</form>
				</div>
				<!-- 메인 내용 -->
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