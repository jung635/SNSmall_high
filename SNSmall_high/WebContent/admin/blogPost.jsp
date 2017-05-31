<%@page import="java.text.SimpleDateFormat"%>
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

function d_confirm(){
	if (confirm("삭제하시겠습니까?") == true){
	}else{ return false;}
}
	
</script>

</head>
<body>
	

  <div class="container">
    <div class="content">
<jsp:include page="../inc/admin_left.jsp"/>

<div class="row">

            <!-- Blog Post Content Column -->
            <div class="col-lg-8">

                <!-- Blog Post -->
		<%BlogBean bb = (BlogBean)request.getAttribute("bb");
		String returnUrl = request.getHeader("referer");
  		String pageNum = (String)request.getAttribute("pageNum");%>
  		
<%--   		<a href="./OurBlogPostUpdate.ad?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">수정하기</a>&nbsp;| --%>
<%-- 				<a href="./OurBlogPostDeleteAction.ad?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>" onclick="return d_confirm()">삭제</a> --%>
                <!-- Title -->
                <div style="font-size: 15px;">
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
				
				<span style="font-size: 10px; margin-left: 10px">_ by admin</span>
                </div>
                <hr style="margin: 0 0 10px 0;">
                <div style="background-color:#e3e3e3;">
                <div class="col-lg-8">
                <div class="subject_size">
				<%=bb.getSubject() %>
				<hr>	
				</div>
				</div>
				 <div class="col-lg-4">
				 <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span>
                 <%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
                 <%=sdf.format(bb.getDate())%>
                </p>
				</div>
				</div>
                
 				
 				
               
				
                <hr>
				<%if(bb.getFile()!=null){ %>
                <!-- Preview Image -->
                <img class="img-responsive" src="./blog_upload/<%=bb.getFile()%>" alt="">

                <br>
				<%} %>
                <!-- Post Content -->

                <p> 
                <%String content = bb.getContent();
				if(content!=null){
				content = bb.getContent().replace("\r\n", "<br>");}%>
				<%=content %>
				</p>
                
                <hr>
                
				<div class="col-lg-4"></div>
                <div class="col-lg-4">
                <%if(pageNum!=null){ %>
             			<input type="button" value="List View" class="btn_submit"
             			onclick="location.href='./OurBlog.ad?pageNum=<%=pageNum%>&returnUrl=<%=returnUrl%>'">
             			<%} %>
             	
             	</div>
                <div class="col-lg-4"></div>
  

         

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