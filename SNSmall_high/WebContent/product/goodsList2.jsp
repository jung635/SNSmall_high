<%@page import="web.zzim.db.ZzimDAO"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="css/header.css" rel="stylesheet">
	<link href="css/inner.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/product.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">

</script>

</head>
<body>

<%
	String id = (String)session.getAttribute("id");
	String type = (String)session.getAttribute("type");
	if(id==null){type = "client";}
	String pageNum = (String)request.getAttribute("pageNum");
	String category = (String)request.getAttribute("category");
	String order = (String)request.getAttribute("order");
	int count = ((Integer)request.getAttribute("count")).intValue();
	int currentPage = Integer.parseInt(pageNum);
	List productList = (List)request.getAttribute("productList");
%>
	<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">

        <!-- Page Header -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
             <br>
            <hr>    
			<div class="detail-header">
			<div style="display: inline-block; padding-top:7px;">
                SN# Home　<b>>　</b>
                <b>
                <%if(category.equals("not")){ %>
                		상품 전체 보기 <%}else{ %>
                <%=category %>
                <%} %>
                </b>
            </div>
                <div class="li-search-box">
				<form action="./ProductSearchList.pr">
					<input type="text" name="search">
					<i class="fa fa-search" aria-hidden="true"><input type="submit" value=""></i>
	    	   	</form>
				</div>
              </div>
              <div class="clear"></div>
        <hr>
        
       
        
        <!-- Team Members Row -->
        <div class="row">
			<div id="order"><ul id="order_option"><li style="font-weight: bold;color: darkblue;">정렬방법</li>
				<li><a href="./ProductList.pr?category=<%=category %>&order=date">최신순</a></li>
				<li><a href="./ProductList.pr?category=<%=category %>&order=count">인기순</a></li>
				<li><a href="./ProductList.pr?category=<%=category %>&order=price">가격순</a></li></ul>
			</div>

        <!-- Projects Row -->
        <div id="our-team">
        <%if(productList==null){%>
        	리스트가 없습니다.
        <%}else{%>
		<%for(int i=0; i<productList.size(); i++){
			ProductBean pb = (ProductBean)productList.get(i);
			ZzimDAO zdao = new ZzimDAO();
			int product_num = pb.getProduct_num();
			int check = zdao.ZzimCheckAction(id,product_num);
			
		%>
            <div class="col-md-3 portfolio-item pro-item">
            <div class="pro-item-in">
                <a href="./ProductDetail.pr?product_num=<%=pb.getProduct_num() %>&pageNum=<%=pageNum%>">
                    <%if(pb.getMain_img()==null){ %>
                    <img class="img-responsive" src="./qna_img/default.jpg" style="height: 250px !important; width:100%; background-image: url('./qna_img/default.jpg');" alt="">
                    <%} else{%>
                    <img class="img-responsive" src="./vendor_img/<%=pb.getMain_img() %>" style="height: 250px !important; width:100%;"  alt="">
                    <%} %>
                </a>
                <div class="pro-list-con">
                <div class="pro-list-sub">
                    <a href="./ProductDetail.pr?product_num=<%=pb.getProduct_num() %>&pageNum=<%=pageNum%>">
                    <div style="height: 60px; overflow: hidden;"><%=pb.getSubject() %></div>
                    <span class="pro-live-state">
                    <%
                    String state=pb.getLive_state();
                    if(state.equals("on")){%><span class="on">Live on</span>
                    <%}else{ %><span class="off">Live off</span><%} %>
                    </span>
                    </a>
                </div>
                <p class="pro-list-pri"><b><%=pb.getPrice() %>원</b></p>
                <p><%=pb.getDate() %><a href="ZzimAddAction.zz?product_num=<%=pb.getProduct_num() %>&subject=<%=pb.getSubject() %>&price=<%=pb.getPrice() %>">
                <hr>
                	<div style="text-align: right;">
						<%if(type.equals("client")){
						if(check==0){ %><i class="fa fa-heart-o" aria-hidden="true"></i> 찜하기
					<%}else if(check==1){ %> <span style="color: red;"><i class="fa fa-heart" aria-hidden="true"></i></span> 찜한상품<%} %></a></p>
					<%}else{}%>
				</div>
				</div>
			</div>
		  </div>
		<%}} %>

		<div class="clear"></div>
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                <%
                if(count!=0){
                	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
                	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
                	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
                	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
					if(currentPage<=10){%>
                    <li>
                    	<a>&laquo;</a>
                    </li>
                    <%}else{ %>
                    <li>
                        <a href="./ProductList.pr?pageNum=<%=startPage-pageBlock%>&category=<%=category %>&order=<%=order%>">&laquo;</a>
                 	</li>	
                 	<%} %>
			<%for(int i=startPage; i<=endPage; i++){
						if(i==currentPage){%>
					<li class="active">
                        <a href="#"><%=i%></a>
                    </li>
				<%}else{ %>
                    <li>
                        <a href="./ProductList.pr?pageNum=<%=i%>&category=<%=category %>&order=<%=order%>"><%=i %></a>
					</li>
                 	<%}} %>
                 <%if(endPage<pageCount){%>
                 	<li>
                 		<a>&laquo;</a>
                 	</li>
               	<%}else{ %>
                 	<li>
                 		<a href="./ProductList.pr?pageNum=<%=startPage+pageBlock%>&category=<%=category %>&order=<%=order%>">&raquo;</a>
                 	</li>
                 <%}} %>
                </ul>
			</div>
			<div class="clear"></div>
			
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
            <!-- /.row -->
        </footer>

    </div>
  </div>
    <!-- /.container -->
	<script src="js/jquery.js"></script>
    <!-- jQuery -->
    

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>