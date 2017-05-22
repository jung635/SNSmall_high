<%@page import="web.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	List boardList = (List)request.getAttribute("boardList");
	String pageNum = (String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
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
                    <table>
                    	<h3>
							<a href="./writeForm.bo">글쓰기</a>
						</h3>
                    	<tr style="border-bottom: 1px double gray;"><th>구분</th><th>제목</th><th>글쓴이</th><th>등록일</th></tr>
						
						<!-- 조건 for문 시작할 부분 -->
						<%for(int i=0; i<boardList.size(); i++){
							BoardBean bb = (BoardBean)boardList.get(i);
							%>
						
						<tr><td><%=bb.getType() %></td>
							<td>
							<a href="./BoardDetailAction.bo?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
							<%=bb.getSubject() %>
							</a>	
							</td>							
						<td><%=bb.getId() %></td><td><%=bb.getDate() %></td></tr>
						
						<%} %>
						<!-- 조건 for문 끝낼 부분 -->
						
					</table>
                    <!-- 페이지 넘버 부분 -->
                    <%if(count!=0){
                    		//이전페이지
                    		if(startPage>pageBlock){
                    		%>
                    			<a href="./BoardList.bo?pageNum=<%=startPage-pageBlock%>">Pre</a>
                    		<%
                    		}
                    		//페이지 번호
                    		for(int i=startPage; i<=endPage; i++){
                    		%>
                    			<a href="./BoardList.bo?pageNum=<%=i%>"><%=i%></a>
                    		<%
                    		}
                    		//다음페이지
                    		if(endPage<pageCount){
                    		%>
                    			<a href="./BoardList.bo?pageNum=<%=startPage+pageBlock%>">Next</a>
                    		<%
                    		}
                    		%>
                    
                    <%} %>
                    <!-- 페이지 넘버 부분 -->
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