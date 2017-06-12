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
<%
String id = (String)session.getAttribute("id");
if(id==null || !id.equals("admin")){
	response.sendRedirect("./login.cl");}
%>

  <!-- Page Content -->
  <div class="container">
    <div class="content">
    <jsp:include page="../inc/admin_left.jsp"/>
		<div class="row">
		
            <div class="col-lg-8">

                <span class="fontBig">Blog Posting</span><span class="fontSmall">by. admin</span>

				<form action="./OurBlogPostingAction.bl" name="fr" method="post" onsubmit="return empty()" enctype="multipart/form-data">
				
					<select style="width: 200px; margin-top: 20px;" id="category" name="category">
						<option>notice</option>
						<option>contribution</option>
						<option>Event</option>
						<option>service</option>
						<option>advertising</option>
					</select>
				
					<input type="text" name="subject" placeholder="Title" class="form-control" style="margin-top: 15px;">

                <hr>
                
                <input type="file" name="file">

                <hr>

                <textarea rows="20" cols="100" class="form-control" name="content"></textarea>

                <hr>
                
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
             		<input type="submit" value="posting" class="btn_submit">
             	</div>
                <div class="col-lg-4"></div>
				
				</form>
               
                <hr>


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
                    <p>Copyright &copy; Your Website 2017</p>
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