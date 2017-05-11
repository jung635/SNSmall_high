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
                <jsp:include page="../../inc/myinfo_left.jsp"/>               
            </div>
            <div class="col-md-9">
                <div class="thumbnail">
						

							<table>
								<tr>
									<td class="left"><label>아이디</label></td>
									<td class="left"><%=id%></td>
								</tr>
								<tr>
									<td class="left"><label>이름</label></td>
									<td class="left"><%=clb.getName()%></td>
								</tr>
								<tr>
									<td class="left"><label>주소</label></td>
									<td class="left"><%=postcode%></td></tr>
								<tr>
									<td class="left"></td><td><%=address%></td>
								</tr>
								<tr>
									<td class="left"></td><td><%=address2%></td>
								</tr>
								<tr>
									<td class="left"><label>연락처</label></td>
									<td class="left"><%=clb.getPhone()%></td>
								</tr>
								<tr>
									<td class="left"><label>포인트</label></td>
									<td class="left"><%=clb.getPoint()%></td>
								</tr>								
							</table>
							<input type="hidden" name="pass" value="<%=clb.getPass()%>">
							<input type="hidden" name="id" value="<%=id%>">
							
							<div id="buttons">
								<input type="button" value="확인" class="cancel" onclick="location.href='./MyPage.cl'">

							</div>
						
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