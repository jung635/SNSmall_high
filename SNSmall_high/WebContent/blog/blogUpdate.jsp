<%@page import="web.blog.db.BlogBean"%>
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
<script type="text/javascript">

function fileName(){

	if(document.fr.file.value!=""){
	dp_file.style.display='none';
	}else{
	dp_file.style.display='block';
	}
}

function empty(){
	
	if(document.fr.subject.value==""){
		alert("제목을 입력하세요");
		document.fr.subject.focus();	
		return false;
	}else if(document.fr.content.value==""){
		alert("내용을 입력하세요");
		document.fr.content.focus();	
		return false;
	}
}


</script>
</head>
<body>

<%
String id = (String)session.getAttribute("id");
if(id==null || !id.equals("admin")){
	response.sendRedirect("./login.cl");
}
%>
	
<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">


<div class="row">

            <div class="col-lg-8">

                <span class="fontBig">Blog Posting</span><span class="fontSmall">by. admin</span>

			<form action="./OurBlogPostUpdateAction.bl" name="fr" method="post" onsubmit="return empty()" enctype="multipart/form-data">
				<%String pageNum = (String)request.getAttribute("pageNum");
				BlogBean bb=(BlogBean)request.getAttribute("bb");%>
				
					<input type="hidden" name="num" value="<%=bb.getNum()%>" >
				
					<select style="width: 200px; margin-top: 20px;" id="category" name="category">
						<option <%if(bb.getCategory().equals("notice")){ %>selected<%} %>>notice</option>
						<option <%if(bb.getCategory().equals("contribution")){ %>selected<%} %>>contribution</option>
						<option <%if(bb.getCategory().equals("Event")){%>selected<%} %>>Event</option>
						<option <%if(bb.getCategory().equals("service")){%>selected<%} %>>service</option>
						<option <%if(bb.getCategory().equals("advertising")){ %>selected<%} %>>advertising</option>
					</select>
				
				
					<input type="text" name="subject" placeholder="Title" value="<%=bb.getSubject() %>" class="form-control" style="margin-top: 15px;">
				
				
				
                <hr>

                <input type="hidden" name="one_file" value="<%=bb.getFile()%>" > 
                <input type="file" name="file" id="image" onchange="fileName()">
                <span id="dp_file"><%if(bb.getFile()!=null){%> <%=bb.getFile() %> <%}%></span>



                <hr>
  				
                <textarea rows="20" cols="100" class="form-control" name="content"><%=bb.getContent() %></textarea>

                <hr>
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
             		<input type="submit" value="Update Post" class="btn_submit">
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