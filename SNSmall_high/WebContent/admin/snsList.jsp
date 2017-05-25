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
String category = (String)request.getAttribute("category");
String order = (String)request.getAttribute("order");
String realfilePath = request.getRealPath("/sns_pro_upload");
String pageNum = (String)request.getAttribute("pageNum");
int count = (Integer)request.getAttribute("count");
int pageSize = (Integer)request.getAttribute("pageSize");
int currentPage=Integer.parseInt(pageNum);
int start = (Integer)request.getAttribute("start");
int end = (Integer)request.getAttribute("end");
List<Object> list = (List<Object>)request.getAttribute("list");
%>
<div class="container">
	<div class="more_content">
    <!-- Page Content -->
		<div class="row">
            <div class="col-md-3">
                <p class="lead">Admin입니다.</p>
                <jsp:include page="../inc/admin_left.jsp"/>
            </div>
            			<div id="order"><ul id="order_option"><li style="font-weight: bold;color: darkblue;">정렬방법</li>
          	<li><a href="SnsList.ad?category=<%=category %>&order=date">최신순</a></li>
          	<li><a href="SnsList.ad?category=<%=category %>&order=sell">판매량순</a></li>
          	<li><a href="SnsList.ad?category=<%=category %>&order=sns_profit">판매액순</a></li>
          	<li class="dropbtn"><a href="snsList.sn?category=<%=category %>&order=sns_profit">등급별</a>
  				<div class="dropdown-content-rank">
  				<a href="SnsList.ad?category=basic&order=sell">basic</a>
  				<a href="SnsList.ad?category=plus&order=sell">plus</a>
  				<a href="SnsList.ad?category=premium&order=sell">premium</a>
				</div>
			</li>
          	</ul>
          	</div>
          	<div id="our-team">
          	<%if(list==null){ %>
          		리스트가 없습니다.
          	<%}else{ %>
	            <div class="col-sm-6 col-md-3">
	            	<table style="width: 900px;">
						<tr><td>이름</td><td>아이디</td><td>카테고리</td><td>Profit</td><td>판매갯수</td><td>가입날짜</td></tr>
						<%for(int i=0; i<list.size(); i++){
							SnsBean sb = (SnsBean)list.get(i);
						%>
							<tr><td><%=sb.getName() %></td><td><%=sb.getSns_id() %></td><td><%=sb.getCategory() %></td><td><%=sb.getSns_profit() %></td><td><%=sb.getSell() %></td><td><%=sb.getDate() %></td></tr>
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
		                        		<a href="SnsList.ad?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage-pageBlock %>">&laquo;</a>
		                  			</li>
								<%}
							for(int i=startPage; i<=endPage; i++){
								if(i==currentPage){%>
									<li class="active">
										<a href="#"><%=i %></a>
		                    		</li>
		                   		 <%}else{ %>
		                    		<li>
										<a href="SnsList.ad?order=<%=order %>&category=<%=category %>&pageNum=<%=i %>"><%=i %></a>
		                    		</li>
		                    	<%}} %>
		                    <%if(endPage>=pageCount){ %>
		                    	<li>
		                        	<a>&raquo;</a>
		                    	</li>
		                    <%}else{ %>
		                    	<li>
		                        	<a href="SnsList.ad?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage+pageBlock %>">&raquo;</a>
		                    	</li>
	                    	<%}} %>
	                	</ul>
	            	</div>
		   			<div class="clear"></div>
		            <div>
		        		<form action="SearchSnsList.ad">
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