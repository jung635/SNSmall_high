<%@page import="java.util.Locale"%>
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
<title>Insert title here</title>
</head>
<body>
<%
	String category = (String)request.getAttribute("category");
	List categoryBlogList =(List)request.getAttribute("categoryBlogList");
	String pageNum=(String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
%>
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">
		<div class="row">
            <!-- Blog Entries Column -->
			<div class="col-md-9">
				<h1 class="page-header">
                    <%= category%>
                    <small><%=count%></small>         
                </h1>
			<hr style="border: 0; height: 2px; background: #ddd;">
			
			<%
			for(int i=0;i<categoryBlogList.size();i++){
				BlogBean bb = (BlogBean)categoryBlogList.get(i);	
			%>

                <!-- First Blog Post -->
               
                <div class="blog-subject">
                 
                    <span style="font-size: 20px;"><%=bb.getSubject() %></span>
                    <span style="font-size: 12px; ">　
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
                   </span>

	                <span class="blog-subject-date">
	               		 <small>
	               		   <span class="glyphicon glyphicon-time"></span> 
								Posted on 
								<%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
								<%=sdf.format(bb.getDate())%>
	                	</small>
	                </span>	
                </div>
                	
                	
                  <!-- Posted on August 28, 2013 at 10:00 PM -->
                
                <%if(bb.getFile()!=null){ %>
             
                	<a href="./OurBlogPostAction.bl?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
                  
    				<img src="./blog_upload/<%=bb.getFile()%>" style="border-radius:5px; max-width: 820px;"></img></a>
    			 
    			 <hr>
			<%} %>
             
               
                <div style="overflow:hidden; height:100px;"><%=bb.getContent()%></div>
                <a class="btn btn-primary" href="./OurBlogPostAction.bl?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>

               <hr style="border: 0; height: 2px; background: #e3e3e3;">
        <%}%>

<!-- Pager -->
	<%
	if(count!=0){
	%><ul class="pager">
		<li class="previous">
	<%
	if(startPage > pageBlock){
	%><a href="./OurBlogCategory.bl?category=<%=category %>&pageNum=<%=startPage-pageBlock%>">&larr; Older</a>
	<%
	}                   
	%>
		</li>
	<li class="next" style="position: relative;"><%

	if(endPage<pageCount){
		%><a href="./OurBlogCategory.bl?category=<%=category %>&pageNum=<%=startPage+pageBlock%>">Newer &rarr;</a><%
	}
	%></li> 
	  </ul>
<%
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