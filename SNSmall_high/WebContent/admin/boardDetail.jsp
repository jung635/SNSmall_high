<%@page import="web.reply.db.ReplyBean"%>
<%@page import="web.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</head>
<body>
<%
BoardBean bb = (BoardBean)request.getAttribute("bb");
String pageNum = (String)request.getAttribute("pageNum");
List replyList = (List)request.getAttribute("replyList");
String id = (String)session.getAttribute("id");
String content = bb.getContent();
if(content != null){content=bb.getContent().replace("\r\n","<br>");}
%>
<div class="container">
	<div class="more_content">
    <!-- Page Content -->
		<div class="row">
            <div class="col-md-3">
                <p class="lead">Admin입니다.</p>
                <jsp:include page="../inc/admin_left.jsp"/>
            </div>
            <div id="our-team">
	            <div class="col-sm-6 col-md-3">
	            	<table style="width: 900px;">
							<tr>
								<th>제목</th><td colspan="3"><%=bb.getSubject() %></td>
							</tr>
						
							<tr>
								<th>글쓴이</th><td><%=bb.getId() %></td><th>등록일</th><td><%=bb.getDate() %></td>
							</tr>
						
							<tr>
								<th>내용</th>
								<td colspan="3"><%=content %></td>
							</tr>
					</table>
					<div class="clear"></div>
					<hr>
					댓그르
					<hr>					
					<% 
						for(int i = 0; i < replyList.size(); i++){
						ReplyBean rb = (ReplyBean)replyList.get(i);	
						String replyContent = rb.getContent();
						if(replyContent != null){replyContent = rb.getContent().replace("\r\n","<br>");}
					%>
					<table style="width: 900px;">
						
						<tr>
						<td style="text-align: left;"><%=rb.getId() %><br>
						<%=replyContent %>
						</td>
						<td style="text-align: right;"><%=rb.getDate() %><br>
						<%if(id != null && id.equals(rb.getId())){%>							
						<a href="./replyDelete.re?num=<%=rb.getNum()%>" onclick="return d_confirm()">[삭제]</a>
						<%} %>
						</td></tr>
					</table>
					<%} %>	
				</div>
        		<div class="clear"></div>
				<div class="row text-center">
					<div class="col-lg-12">

	            	</div>
		   			<div class="clear"></div>
		            <div>
		        		<form action="SearchProductList.ad">
		        			<input type="text" name="search">
		        			<input type="submit" value="검색">
	        			</form>
	        		</div>
	        	</div>
        	</div>
        </div>
    </div>
</div>
</body>
</html>