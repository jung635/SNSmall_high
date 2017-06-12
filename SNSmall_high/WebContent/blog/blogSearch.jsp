<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.blog.db.BlogBean"%>
<%@page import="java.util.List"%>
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
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/bootstrap.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/blog-home.css" rel="stylesheet">
	<link href="./css/blog-post.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">


<div class="row">

            <div class="col-lg-8">

                <span class="fontBig">Search result</span><span class="fontSmall">Blog Post</span>

			<%
// 			String returnUrl = request.getHeader("referer");
	List blogList=(List)request.getAttribute("blogList");
	String pageNum=(String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	String search=(String)request.getAttribute("search");
	
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
	
	if(count!=0){
	%>
                <hr>
               		'<%=search%>'에　대해　<%=count %>개의 포스팅이 있습니다.
                <br>
                <br>
				
				<% for(int i=0;i<blogList.size();i++){
    				BlogBean bb = (BlogBean)blogList.get(i); %>
    			
    				<hr style="border: 1px solid white;">
	    			
	    			<%if(bb.getFile()!=null){%>
	    			
		    			<div style="border-bottom: 1px solid #e3e3e3; background-color:#f5f5f5;">
		    			<%if(bb.getCategory().equals("notice")){ %>
		              		<i class="fa fa-file-text-o" aria-hidden="true"></i> notice
		              	<%}else if(bb.getCategory().equals("contribution")){ %>
							<i class="fa fa-globe" aria-hidden="true"></i> contribution
						<%}else if(bb.getCategory().equals("Event")){ %>
							<i class="fa fa-gift" aria-hidden="true"></i> Event
						<%}else if(bb.getCategory().equals("service")){ %>
							<i class="fa fa-star" aria-hidden="true"></i> service
						<%}else if(bb.getCategory().equals("advertising")){ %>
							<i class="fa fa-lightbulb-o" aria-hidden="true"></i> advertising
						<%} %>
		    			</div>
		    			
		    			<div class="search-subject">
		    				<span style="font-size: 15px;"><%=bb.getSubject() %></span>
		    				<span style="position: absolute; right: 10px;">
		    				<span class="glyphicon glyphicon-time"></span> Posted on 
		               		 	<%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
		                	 	<%=sdf.format(bb.getDate())%>    
		                	</span> 
		            	</div>
		            	<hr style="margin-top: 5px;">
		            	
		    			<div class="col-lg-4">
		    			<img alt="" src="./blog_upload/<%=bb.getFile() %>" style="width: 200px; height: 100px; padding: 2px">
		 				</div>
		    			<div class="col-lg-8" style="height: 40px; overflow: hidden;"><a href="./OurBlogPostAction.bl?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getContent()%></a></div>...
		    			
		    			<br>
		    			
	    			<%}else{ %>
	    			<div  style="border-bottom: 1px solid #e3e3e3; background-color:#f5f5f5;">
	    			<%if(bb.getCategory().equals("notice")){ %>
	              	<i class="fa fa-file-text-o" aria-hidden="true"></i> notice
	              	<%}else if(bb.getCategory().equals("contribution")){ %>
					<i class="fa fa-globe" aria-hidden="true"></i> contribution
					<%}else if(bb.getCategory().equals("Event")){ %>
					<i class="fa fa-gift" aria-hidden="true"></i> Event
					<%}else if(bb.getCategory().equals("service")){ %>
					<i class="fa fa-star" aria-hidden="true"></i> service
					<%}else if(bb.getCategory().equals("advertising")){ %>
					<i class="fa fa-lightbulb-o" aria-hidden="true"></i> advertising
					<%} %>
	    			</div>
	    			
	     			<div class="search-subject">
	    			<span style="font-size: 15px;"><%=bb.getSubject() %></span>
	    			<span style="position: absolute; right: 10px;">
	    			<span class="glyphicon glyphicon-time"></span> Posted on 
	               		 	<%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
	                	 	<%=sdf.format(bb.getDate())%>    
	                </span> 
	            	</div>
	            	<hr style="margin-top: 5px;">
	    			<div style="height: 40px; overflow: hidden;">
	    			<a href="./OurBlogPostAction.bl?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
	    			<%=bb.getContent()%>
	    			</a>
	    			</div>...
	    	
	    				<%} %>
	    			
	    			
	    			
    				<%} %>
    			

				<%}else if(count==0){%>
				
				<hr>
				<div class="empty-result">
				검색어와 관련된 포스팅이 없습니다.
				</div>
				<% }%>
				
				
				<!-- Pager -->
				<br>
				<hr>
<%
if(count!=0){
	 %><ul class="pager">
                    <li class="previous"><%
	if(startPage > pageBlock){
		%><a href="./OurBlogSearchAction.bl?search=<%=search %>&pageNum=<%=startPage-pageBlock%>">&larr; Older</a><%
	}                 
	%></li>
	
	<li class="next" style="position: relative;"><%

	if(endPage<pageCount){
		%><a href="./OurBlogSearchAction.bl?search=<%=search %>&pageNum=<%=startPage+pageBlock%>">Newer &rarr;</a><%
	}
	%></li> </ul><%
}
%>
				
            </div>
            
            

<!-- Blog Sidebar Widgets Column -->
<jsp:include page="../inc/blog_right.jsp"/>	

        </div>
        <!-- /.row -->
        
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
   </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="./js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./js/bootstrap.min.js"></script>


</body>
</html>