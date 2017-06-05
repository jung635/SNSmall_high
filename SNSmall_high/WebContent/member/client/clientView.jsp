<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
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
	<link href="./css/member.css" rel="stylesheet"> 
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../inc/header.jsp"/>
	<%
		/* 아이디 없을경우 제어 구간 */
		String id = (String) session.getAttribute("id");
		
		if (id == null) {
			response.sendRedirect("./login.cl");
		}
		/* 아이디 없을경우 제어 구간 */
		ClientBean clb = (ClientBean)request.getAttribute("clb");
		String postcode = (String)request.getAttribute("postcode");
		String address = (String)request.getAttribute("address");
		String address2 = (String)request.getAttribute("address2");
	%>
	<!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
<%--                 <p class="lead"><%=id %></p> --%>
                <jsp:include page="../../inc/myinfo_client_left.jsp"/>               
            </div>
            <div class="col-md-9">
            
            <div style="margin: 50px 0 50px 0">
				<div class="top-subject">내 정보 보기</div>

					<div class="col-md-12 table-liner-top">
						<div class="col-md-4 table-colorBg-top">
						<span class="table-txt">아이디</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=id %></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">이름</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=clb.getName()%></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">연락처</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=clb.getPhone()%></div>
					</div>
					
					<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg">
						<span class="table-txt">주소</span>
						</div>
						<div class="col-md-8 pass-conf-text">
						<%=postcode%><br>
						<%=address%><br>
						<%=address2%>
						</div>
					</div>
			
				
				<div class="col-md-12" style="margin-top: 50px;"><div class="top-subject" style="border-color: #B2D8AC">SN# 개인 정보</div></div>
				s
				<div class="col-md-12 table-liner">
						<div class="col-md-4 table-colorBg" style="background-color: #B2D8AC">
						<span class="table-txt">포인트</span>
						</div>
						<div class="col-md-8 pass-conf-text"><%=clb.getPoint()%></div>
					</div>
							<input type="hidden" name="pass" value="<%=clb.getPass()%>">
							<input type="hidden" name="id" value="<%=id%>">
							
						
					</div>
					
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