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
	List blogList=(List)request.getAttribute("blogList");
	String pageNum=(String)request.getAttribute("pageNum");
	int count=((Integer)request.getAttribute("count")).intValue();
	%>
	
				
					<select style="width: 200px; margin-top: 20px;" id="category" name="category">
						<option>　notice</option>
						<option>　contribution</option>
						<option>　Event</option>
						<option>　service</option>
						<option>　advertising</option>
					</select>
				
				
                <hr>
                <%=count %>개의 포스팅이 있습니다.
				<table border=1;>
				
				
				<% for(int i=0;i<blogList.size();i++){
    			BlogBean bb = (BlogBean)blogList.get(i); %>
    			
    			
    			<%if(bb.getFile()!=null){%>
    			<tr>
    			<td rowspan="2"> <%=bb.getCategory() %> </td>
    			<td rowspan="2" style="width: 200px; height: 100px;"> <img alt="" src="./blog_upload/<%=bb.getFile() %>" style="width: 200px; height: 100px; padding: 2px"> </td>
    			<td><%=bb.getSubject() %></td>
    			<td style="text-align: right;">
    				<p><span class="glyphicon glyphicon-time"></span> Posted on 
               		 	<%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
                	 	<%=sdf.format(bb.getDate())%>
                	</p>
    			</td>
    			</tr>
    			<tr> <td colspan="2"><%=bb.getContent() %></td> </tr>
    			<%}else{ %>
    			<tr>
    				<td rowspan="2"> <%=bb.getCategory() %> </td>
    				<td colspan="2"> <%=bb.getSubject() %> </td>
    				<td style="text-align: right;">
    					<p><span class="glyphicon glyphicon-time"></span> Posted on 
               		 		<%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
                			<%=sdf.format(bb.getDate())%>
                		</p>
    				</td>
    				
    			<tr> <td colspan="3"><%=bb.getContent() %></td> </tr>
    			<%} %>
    			
    			
    			
    			<%} %>
    			
    			
				</table>

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