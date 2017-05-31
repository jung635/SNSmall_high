<%@page import="web.client.db.ClientBean"%>
<%@page import="web.sns.db.SnsBean"%>
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

String pageNum = (String)request.getAttribute("pageNum");
int count = (Integer)request.getAttribute("count");
int pageSize = (Integer)request.getAttribute("pageSize");
int currentPage=Integer.parseInt(pageNum);
int start = (Integer)request.getAttribute("start");
int end = (Integer)request.getAttribute("end");
List<ClientBean> list = (List<ClientBean>)request.getAttribute("list");
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
          	<%if(list==null){ %>
          		리스트가 없습니다.
          	<%}else{ %>
	            <div class="col-sm-6 col-md-3">
	            	<table style="width: 900px;">
						<tr><td>이름</td><td>아이디</td><td>주소</td><td>전화번호</td><td>이메일</td><td>포인트</td><td>가입날짜</td></tr>
						<%for(int i=0; i<list.size(); i++){
							ClientBean cb = (ClientBean)list.get(i);
						%>
							<tr><td><%=cb.getName() %></td><td><%=cb.getClient_id() %></td><td><%=cb.getAddress() %></td>
							<td><%=cb.getPhone() %></td><td><%=cb.getEmail() %></td>
							<td><%=cb.getPoint() %></td><td><%=cb.getDate() %></td></tr>
						<%} %>
					</table>
				</div>
	            <%}%>
        		<div class="clear"></div>
				<div class="row text-center">
					<div class="col-lg-12">
	                	<ul class="pagination">
	                 	<%if(count!=0){
							int pageCount = (Integer)request.getAttribute("pageCount");
							int pageBlock = (Integer)request.getAttribute("pageBlock");
							int startPage = (Integer)request.getAttribute("startPage");
							int endPage = (Integer)request.getAttribute("endPage");
							if(endPage > pageCount){endPage=pageCount;}
								if(currentPage<=10){ %>
		                    		<li>
		                    	  	  	<a>&laquo;</a>
		                   			</li>
		                 		<%}else{ %>
		                 			<li>
		                        		<a href="ClientList.ad?pageNum=<%=startPage-pageBlock %>">&laquo;</a>
		                  			</li>
								<%}
								
							for(int i=startPage; i<=endPage; i++){
								if(i==currentPage){%>
									<li class="active">
										<a href="#"><%=i %></a>
		                    		</li>
		                   		 <%}else{ %>
		                    		<li>
										<a href="ClientList.ad?pageNum=<%=i %>"><%=i %></a>
		                    		</li>
		                    	<%}} %>
		                    <%if(endPage>=pageCount){ %>
		                    	<li>
		                        	<a>&raquo;</a>
		                    	</li>
		                    <%}else{ %>
		                    	<li>
		                        	<a href="ClietnList.ad?pageNum=<%=startPage+pageBlock %>">&raquo;</a>
		                    	</li>
	                    	<%}} %>
	                	</ul>
	            	</div>
		   			<div class="clear"></div>
		            <div>
		        		<form action="SearchClientList.ad">
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