<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<script type="text/javascript">
	$(document).ready(function() {
		$('.scroll').click(function(){
			//alert('hi');
			  //$('.active').removeClass('active');
			  $(this).addClass('active');  
			});
	}); 
	
	</script>
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
List<SnsBean> list = (List<SnsBean>)request.getAttribute("list");
%>
<jsp:include page="../inc/header.jsp"/>
<!-- Page Content -->
<div class="container">
	<div class="content">
  		<!-- Introduction Row -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
                <h1 class="page-header">SNS STAR LIST
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
            </div>
        </div>

        <!-- Team Members Row -->
        <div class="row">
			<div id="order"><ul id="order_option"><li style="font-weight: bold;color: darkblue;">정렬방법</li>
          	<li><a href="snsList.sn?category=<%=category %>&order=date">최신순</a></li>
          	<li><a href="snsList.sn?category=<%=category %>&order=sell">판매량순</a></li>
          	<li><a href="snsList.sn?category=<%=category %>&order=sns_profit">판매액순</a></li>
          	<li class="dropbtn"><a href="snsList.sn?category=<%=category %>&order=sns_profit">등급별</a>
  				<div class="dropdown-content-rank">
  				<a href="snsList.sn?category=basic&order=sell">basic</a>
  				<a href="snsList.sn?category=plus&order=sell">plus</a>
  				<a href="snsList.sn?category=premium&order=sell">premium</a>
				</div>
			</li>
          	</ul>
          	</div>
          	<div id="our-team">
          	<%if(list==null){ %>
          		리스트가 없습니다.
          	<%}else{ %>
	            <% for(int i=0; i<list.size(); i++){
	            	SnsBean sb = list.get(i);%>
	            <div class="col-sm-6 col-md-3">
					<div class="single-member">
						<div id="profile_img_wrap">
							<img src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="team member" />
						</div>
						<div id="star_list_detail">
							<h3><a href="SnsDetailAction.sn?sns_id=<%=sb.getSns_id()%>"><%=sb.getName() %></a>
							<small><%=sb.getCategory() %>/<%=sb.getRank() %></small></h3>
							<p><%=sb.getContent() %></p>
						</div>
						<div class="socials">
							<%if(sb.getFacebook()!=null){%>
								<a href="<%=sb.getFacebook()%>"><i class="fa fa-facebook"></i></a>
							<%}if(sb.getTwitter()!=null){%>							
							<a href="<%=sb.getTwitter()%>"><i class="fa fa-twitter"></i></a>
							<%}if(sb.getInstagram()!=null){%>			
							<a href="<%=sb.getInstagram()%>"><i class="fa fa-instagram"></i></a>
							<%}if(sb.getBlog()!=null){%>	
							<a href="<%=sb.getBlog()%>"><i class="fa fa-bold"></i></a>
							<%}if(sb.getEtc()!=null){%>	
							<a href="<%=sb.getEtc()%>"><i class="fa fa-smile-o"></i></a>
							<%} %>
						</div>
					</div>
				</div>
	            <%}}%>
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
		                        		<a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage-pageBlock %>">&laquo;</a>
		                  			</li>
								<%}
							for(int i=startPage; i<=endPage; i++){
								if(i==currentPage){%>
									<li class="active">
										<a href="#"><%=i %></a>
		                    		</li>
		                   		 <%}else{ %>
		                    		<li>
										<a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=i %>"><%=i %></a>
		                    		</li>
		                    	<%}} %>
		                    <%if(endPage>=pageCount){ %>
		                    	<li>
		                        	<a>&raquo;</a>
		                    	</li>
		                    <%}else{ %>
		                    	<li>
		                        	<a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage+pageBlock %>">&raquo;</a>
		                    	</li>
	                    	<%}} %>
	                	</ul>
	            	</div>
		   			<div class="clear"></div>
		            <div>
		        		<form action="SearchSnsList.sn">
		        			<input type="text" name="search">
		        			<input type="submit" value="검색">
	        			</form>
	        		</div>
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