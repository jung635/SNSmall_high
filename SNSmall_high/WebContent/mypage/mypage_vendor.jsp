<%@page import="web.product.db.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
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
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/product.css" rel="stylesheet">  
<title>Insert title here</title>
	<script type="text/javascript">
		/* 경고문 */
		function d_confirm(){
			if(confirm("삭제하시겠습니까?")==true){
			}else{
				return false;
			}
		}		
	</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	<%
		String type = (String) session.getAttribute("type");
		String id = (String) session.getAttribute("id");
		List productList = (List) request.getAttribute("productList");
		String pageNum = (String) request.getAttribute("pageNum");
		int count = ((Integer) request.getAttribute("count")).intValue();
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		if (id == null) {
			response.sendRedirect("./login.ve");
		}
	%>
	<!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
<%--                 <p class="lead"><%=id %></p> --%>
                <jsp:include page="../inc/myinfo_vendor_left.jsp"/>               
            </div>
            <div class="col-md-9">
                <div style="margin: 50px 0 50px 0">
						<div class="product-top-tit" style="font-size: 25px; padding: 7px 0 7px 0;">							　등록된 상품목록 
							<span style="font-size: 12px;">
							&nbsp;&nbsp;　[　상품 개수　:　<%=count%>　]
							</span>
						</div>
							<div class="col-md-10"></div>
							<div class="col-md-2">
								<a href="./ProductInsert.pr">
								<span class="pro-regist-go-btn">상품등록</span>
								</a>
							</div>
							<br>
						<div class="table-responsive">

						<table class="regist_product">
							<tr class="top-pro-tr">
								<td>번호</td>
								<td style="padding: 10px 0 10px 0;">이미지</td>
								<td style="min-width: 200px;">제목</td>
								<td>수량</td>
								<td>가격</td>
								<td>날짜</td>
								<td>변경사항</td>
							</tr>
							<%
								if(productList != null){
								for (int i = 0; i < productList.size(); i++) {
									ProductBean prb = (ProductBean) productList.get(i);
							%>
							<tr>
								<td><%=prb.getProduct_num()%></td>
								<td style="padding: 10px 0 10px 0;"><img src="./vendor_img/<%=prb.getMain_img()%>"
									width="100" height="80"></td>
								<td style="min-width: 200px; overflow: hidden;"><%=prb.getSubject()%></a></td>
								<td><%=prb.getAmount()%></td>
								<td><%=prb.getPrice()%></td>
								<td><%=prb.getDate()%></td>
								<td><a
									href="./ProductUpdate.pr?product_num=<%=prb.getProduct_num()%>">수정</a>
									/ <a
									href="./ProductDelete.pr?product_num=<%=prb.getProduct_num()%>" onclick="return d_confirm()">삭제</a></td>
							</tr>
							<%
								}
							%>
						</table>
						</div>
						<%
							if (count != 0) {
								if (startPage > pageBlock) {
						%><a href="./ProductListAction.pr?pageNum=<%=startPage - pageBlock%>">[이전]</a>
						<%
							}
								// 1..10  11..20  21...30
								for (int i = startPage; i <= endPage; i++) {
						%><a href="./ProductListAction.pr?pageNum=<%=i%>">[<%=i%>]
						</a>
						<%
							}
									if (endPage < pageCount) {
						%><a href="./ProductListAction.pr?pageNum=<%=startPage + pageBlock%>">[다음]</a>
						<%
							}
								}
							}
						%>
					</div>
            </div>
        </div>
    </div>
    <!-- /.container -->
    <div class="container">
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