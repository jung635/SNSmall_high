<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/header.css" rel="stylesheet">
	<link href="css/inner.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%
	String pageNum = (String)request.getAttribute("pageNum");
	String category = (String)request.getAttribute("category");
	String order = (String)request.getAttribute("order");
	int count = ((Integer)request.getAttribute("count")).intValue();
	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	List productList = (List)request.getAttribute("productList");
%>
	<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">
    <!-- Page Content -->

        <!-- Page Header -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
                <h1 class="page-header">Product List
                    <small>Amazing goods</small>
                </h1>
           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
            </div>
        </div>
        <!-- /.row -->
        
        <!-- Team Members Row -->
        <div class="row">
          <div id="order"><ul id="order_option"><li style="font-weight: bold;color: darkblue;">���Ĺ��</li>
          <li><a href="./ProductList.pr?category=<%=category %>&order=date">�ֽż�</a></li>
          <li><a href="./ProductList.pr?category=<%=category %>&order=count">�α��</a></li>
          <li><a href="./ProductList.pr?category=<%=category %>&order=price">���ݼ�</a></li></ul></div>

        <!-- Projects Row -->
        <div class="row"  id="product_list_row">
        <%
		for(int i=0; i<productList.size(); i++){
			ProductBean pb = (ProductBean)productList.get(i);
		%>
            <div class="col-md-4 portfolio-item" id="product_list_img">
                <a href="./ProductDetail.pr?product_num=<%=pb.getProduct_num() %>&pageNum=<%=pageNum%>">
                    <%if(pb.getMain_img()==null){ %>
                    <img class="img-responsive" src="./qna_img/imgX.jpg">
                    <%} else{%>
                    <img class="img-responsive" src="./vendor_img/<%=pb.getMain_img() %>" alt="">
                    <%} %>
                </a>
                <h3>
                    <a href="./ProductDetail.pr?product_num=<%=pb.getProduct_num() %>&pageNum=<%=pageNum%>"><%=pb.getSubject() %></a>
                </h3>
                <p><%=pb.getPrice() %>��</p>
                <p><%=pb.getDate() %></p>
            </div>
		<%} %>
         </div>
<!--         /.row -->

        <hr>

        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                    <%if(endPage > pageBlock){ %>
                        <a href="./ProductList.pr?pageNum=<%=startPage-pageBlock%>&category=<%=category %>&order=<%=order%>">&laquo;</a>
                 	<%} %>
                    </li>
                    <li class="active">
                    <%for(int i=startPage; i<=endPage; i++){ %>
                        <a href="./ProductList.pr?pageNum=<%=i%>&category=<%=category %>&order=<%=order%>"><%=i%></a>
                    </li><li>
                    <%} %>
                    <li>
                    <%if(endPage<pageCount){%>
                        <a href="./ProductList.pr?pageNum=<%=startPage+pageBlock%>&category=<%=category %>&order=<%=order%>">&raquo;</a>
                 	<%} %>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
  </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>