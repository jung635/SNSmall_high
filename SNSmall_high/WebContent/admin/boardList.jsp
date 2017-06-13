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
List boardList = (List)request.getAttribute("boardList");
String pageNum = (String)request.getAttribute("pageNum");
int count=((Integer)request.getAttribute("count")).intValue();
int currentPage=Integer.parseInt(pageNum);

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
          	<%if(boardList==null){ %>
          		리스트가 없습니다.
          	<%}else{ %>
	            <div class="col-sm-6 col-md-3">
	            	<table style="width: 900px;">
						<tr><td>구분</td><td>제목</td><td>글쓴이</td><td>등록일</td></tr>
						<%for(int i=0; i<boardList.size(); i++){
							BoardBean bb = (BoardBean)boardList.get(i);
						%>
							<tr><td><%=bb.getType() %></td>
							<td>
								<a href="./BoardDetail.ad?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
									<%=bb.getSubject() %>
								</a>
							</td>
							<td><%=bb.getId() %></td><td><%=bb.getDate() %></td>
							</tr>
						<%} %>
					</table>
				</div>
	            <%}%>
        		<div class="clear"></div>
				<div class="row text-center">
					<div class="col-lg-12">
	                	<ul class="pagination">
	                 	<%if(count!=0){
	                 		int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	                 		int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	                 		int startPage=((Integer)request.getAttribute("startPage")).intValue();
	                 		int endPage=((Integer)request.getAttribute("endPage")).intValue();
							if(endPage > pageCount){endPage=pageCount;}
								if(currentPage<=10){ %>
		                    		<li>
		                    	  	  	<a>&laquo;</a>
		                   			</li>
		                 		<%}else{ %>
		                 			<li>
		                        		<a href="ProductList.ad?pageNum=<%=startPage-pageBlock %>">&laquo;</a>
		                  			</li>
								<%}
								
							for(int i=startPage; i<=endPage; i++){
								if(i==currentPage){%>
									<li class="active">
										<a href="#"><%=i %></a>
		                    		</li>
		                   		 <%}else{ %>
		                    		<li>
										<a href="ProductList.ad?pageNum=<%=i %>"><%=i %></a>
		                    		</li>
		                    	<%}} %>
		                    <%if(endPage>=pageCount){ %>
		                    	<li>
		                        	<a>&raquo;</a>
		                    	</li>
		                    <%}else{ %>
		                    	<li>
		                        	<a href="ProductList.ad?pageNum=<%=startPage+pageBlock %>">&raquo;</a>
		                    	</li>
	                    	<%}} %>
	                	</ul>
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