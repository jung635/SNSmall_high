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
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/bootstrap.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/blog-home.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	
<jsp:include page="../inc/blog_header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">

     	        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-9">

                <h1 class="page-header">
                    www's Blog
                    <small>Welcome to our Blog</small>
                    
                 <span >
                    <a href="./OurBlogPosting.bl"><button class="posting_btn">Posting</button></a>
                 </span>     
                </h1>
		 <hr style="border: 0; height: 2px; background: #ddd;">

<%
List blogList=(List)request.getAttribute("blogList");
String pageNum=(String)request.getAttribute("pageNum");
int count=((Integer)request.getAttribute("count")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();
int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();



for(int i=0;i<blogList.size();i++){
	BlogBean bb = (BlogBean)blogList.get(i);
	
%>

                <!-- First Blog Post -->
               
                <h2>
                    <a href="./OurBlogPostAction.bl?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
                    <%=bb.getSubject() %>
                    </a>
                     <small> by admin</small>
                </h2>
               
                <p><span class="glyphicon glyphicon-time"></span> Posted on 
                <%SimpleDateFormat sdf = new SimpleDateFormat("MMMMM dd, yyyy hh:mm a zzz");%>
                 <%=sdf.format(bb.getDate())%>
                </p>
                <hr>  <!-- Posted on August 28, 2013 at 10:00 PM -->
                
                <%if(bb.getFile()!=null){ %>
                
                  <a href="./OurBlogPostAction.bl?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
    			<img src="./blog_upload/<%=bb.getFile()%>" style="border-radius:5px;"></img></a>
    			
    			 <hr>
                <%} %>
                
               
                <div style="overflow:hidden; height:100px;"><%=bb.getContent()%></div>
                <a class="btn btn-primary" href="#">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>

               <hr style="border: 0; height: 1px; background: #ddd;">
               <hr style="border: 0; height: 2px; background: #ddd;">

        <%}%>

<!-- Pager -->
<%
if(count!=0){
	// 이전        시작페이지가1~10인경우 이전이없다! 10초과면 이전글자보이게!
	 %><ul class="pager">
                    <li class="previous"><%
	if(startPage > pageBlock){
		%><a href="./OurBlog.bl?pageNum=<%=startPage-pageBlock%>">&larr; Older</a><%
	}                    //get방식방법에서쓰는방식 파일이름? ...파라미터값 <%=..>쮹쮹~
	%></li>
	
	<li class="next" style="position: relative;"><%
	// 다음
	
	if(endPage<pageCount){
		%><a href="./OurBlog.bl?pageNum=<%=startPage+pageBlock%>">Newer &rarr;</a><%
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