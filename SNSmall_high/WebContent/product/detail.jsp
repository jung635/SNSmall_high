<%@page import="javax.crypto.interfaces.PBEKey"%>
<%@page import="web.qna.db.QnaBean"%>
<%@page import="java.util.List"%>
<%@page import="web.product.db.ProductBean"%>
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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    $(".reviewbtn").click(function(){
        	$("#writing").toggle();
    	});
	});
	
	function gocart(){
		document.gfr.action="./CartAdd.ca";
		document.gfr.method="post";
		document.gfr.submit();
	}
	
	function gobuy() {
		if(document.gfr.option1.value == ""){
			alert("option1을 선택하세요");
			document.gfr.option1.focus();
			return false;
		}else if(document.gfr.option2 != null){
			if(document.gfr.option2.value == ""){
				alert("option2을 선택하세요");
				document.gfr.option2.focus();
				return false;
			}else if(document.gfr.option3 != null){
				if(document.gfr.option3.value == ""){
					alert("option3을 선택하세요");
					document.gfr.option3.focus();
					return false;
				}
			}
		}
		document.gfr.action="Pay.pa";
		document.gfr.method="post";
		document.gfr.submit();
	}
	
	function sendSns(sns, url, txt){
		alert(sns+", "+url+", "+txt);
	    var o;
	    var _url = encodeURIComponent(url);
	    var _txt = encodeURIComponent(txt);
	    var _br  = encodeURIComponent('\r\n');
	 
	    switch(sns){
	        case 'facebook':
	            o = {
	                method:'popup',
	                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
	      		  };
	            break;
	 
	        case 'twitter':
	            o = {
	                method:'popup',
	                url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
	            };
	            break;
	 
	         case 'blog':
	            o = {
	                method:'popup',
	                url:"http://blog.naver.com/openapi/share?url=" + _url + "&title=" + _txt
	            };
	            break; 
	 
	        default:
	            alert('지원하지 않는 SNS입니다.');
	            return false;
	    }
	 
	    switch(o.method){
	    
	        case 'popup':
	            window.open(o.url);
	            break;
	 
	        case 'web2app':
	            if(navigator.userAgent.match(/android/i)){
	                // Android
	                setTimeout(function(){ location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'}, 100);
	            }else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)){
	                // Apple
	                setTimeout(function(){ location.href = o.a_store; }, 200);          
	                setTimeout(function(){ location.href = o.a_proto + o.param }, 100);
	            }else{
	                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
	            }
	            break;
	    }
	}
</script>

</head>
<body>

	<%
	String returnUrl = request.getHeader("referer");
	System.out.println(returnUrl);
	
	ProductBean productbean = (ProductBean)request.getAttribute("productbean");
	String sns_id = (String)request.getAttribute("sns_id");
	if(sns_id == null){sns_id = "";}
	
	String id = (String)session.getAttribute("id");
	if(id==null){response.sendRedirect("./login.cl?returnUrl="+returnUrl+"&product_num="+productbean.getProduct_num()+"&sns_id="+sns_id);}
	
	String type =(String)session.getAttribute("type");
	if(type==null){type = "client";}
	
	if(type.equals("sns")){sns_id = id;}
	
	String pageNum = (String)request.getAttribute("pageNum");
	if(pageNum == null){pageNum="1";}
	
	String [] o1 = productbean.getOption1().split(",");
	String [] o2 = productbean.getOption2().split(",");
	String [] o3 = productbean.getOption3().split(",");
	int amount = productbean.getAmount();
	int allprice = productbean.getPrice();
	String content = productbean.getContent().replace("\r\n", "<br>");
	int peace = productbean.getAmount()-productbean.getCount();
	
	List qnaList = (List)request.getAttribute("qnaList");
// 	int count = ((Integer)request.getAttribute("count")).intValue();
// 	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
// 	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
// 	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
// 	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	%>
	<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">
    <!-- Page Content -->

        <!-- Portfolio Item Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><%=productbean.getSubject() %>
                    <small><%=productbean.getCategory() %></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8" >
            <%
            if(productbean.getMain_img()==null){
            	%>
            	<img class="img-responsive" src="http://placehold.it/750x500" alt="">
            	<%
            }else{
            %>
                <img class="img-responsive" src="./vendor_img/<%=productbean.getMain_img() %>" alt="">
                <%} %>
            </div>
			
			<form action="" method="post" name="gfr">
			<input type="hidden" name="subject" value="<%=productbean.getSubject()%>">
			<input type="hidden" name="product_num" value="<%=productbean.getProduct_num()%>">
			<input type="hidden" name="sns_id" value="<%=sns_id%>">
			<input type="hidden" name="vendor_id" value="<%=productbean.getVendor_id()%>">
			
            <div class="col-md-4">
                <h3><%=productbean.getSubject() %></h3>
                <p><%=content %></p>
                <h3>Product Details</h3>
                 <select name="option1">
 					<option value=""><%=o1[0] %> 선택하세요</option>
 					<%for(int i=1; i<o1.length; i++){ %>
						<option value="<%=o1[i]%>"><%=o1[i] %></option>
					<%} %>
 				</select>
  				<br>
				<%if(o2 != null){ %>
				<select name="option2">
 					<option value=""><%=o2[0] %> 선택하세요</option>
 						<%for(int i=1; i<o2.length; i++){ %>
	 						<option value="<%=o2[i]%>"><%=o2[i] %></option>
 						<%} %>
 				</select>
 				<br>
				<%}if(o3 != null){ %>
 				<select name="option3">
 					<option value=""><%=o3[0] %> 선택하세요</option>
 						<%for(int i=1; i<o3.length; i++){ %>
  							<option value="<%=o3[i]%>"><%=o3[i] %></option>
  						<%} %>
  				</select>
                 <br>
                 <%}%>
                 <script type="text/javascript">
                 	function plus(){
                		if(document.gfr.amount.value<<%=peace%>){
                			document.gfr.amount.value++;
							document.getElementById("allprice").value=<%=allprice%>*document.gfr.amount.value;
                		}
                	}
                	function minus(){
                		if(document.gfr.amount.value>1){
                			document.gfr.amount.value--;
                			document.getElementById("allprice").value=<%=allprice%>*document.gfr.amount.value;
                		}
                	}
                	</script>
				잔여수량: <input type="text" name="rest_amount" value="<%=peace%> / <%=productbean.getAmount()%>"><br>
				<%
				if(peace==0){%>
					<h2>SOLD OUT</h2>
				<%}else{%>
				수량: <input type="text" name="amount" value="1">
				<button type="button" onclick="plus()">+</button>
				<button type="button" onclick="minus()">-</button><br>
				가격: <input type="text" id="allprice" name="allprice" value="<%=productbean.getPrice()%>">
				<%} %>
				<br>
				<%if(peace!=0){%>
                <a class="btn btn-success" onclick="gocart()">Into Cart</a>
                <a class="btn btn-success" onclick="return gobuy()">Get it</a>
                <% if(type.equals("sns")){%>
                <br>
				<i class="fa fa-facebook-square" aria-hidden="true" 
					onclick="sendSns('facebook', 'http://sunju635.cafe24.com/SNSmall_high/ProductDetail.pr?product_num=<%=productbean.getProduct_num()%>&sns_id=<%=sns_id %>', '안녕')"></i>
				<i class="fa fa-twitter" aria-hidden="true" 
					onclick="sendSns('twitter', 'http://sunju635.cafe24.com/SNSmall_high/ProductDetail.pr?product_num=<%=productbean.getProduct_num()%>&sns_id=<%=sns_id %>', '안녕')"></i>
				<i class="fa fa-bold" aria-hidden="true" 
					onclick="sendSns('blog', 'http://sunju635.cafe24.com/SNSmall_high/ProductDetail.pr?product_num=<%=productbean.getProduct_num()%>&sns_id=<%=sns_id %>', '안녕')"></i>
                <%}} %>
            </div>
			</form>
        </div>
        <!-- /.row -->

        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>

            <div class="col-sm-3 col-xs-6" id="product_detail_img">
                <a href="#">
                <%if(productbean.getDetail_img()==null){ %>
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                    <%} else{%>
                    <img class="img-responsive portfolio-item" src="./vendor_img/<%=productbean.getDetail_img() %>" alt="">
                    <% }%>
                </a>
            </div>

		<script type="text/javascript">
			function qnaStar() {
				
			}
		</script>
        </div>
        <div class="well">
        	<%if(type!=null){ %>
				<%if(type.equals("client")){ %>
                    <div class="text-right">
                     	<div id="writing" style="margin-bottom: 14px; display: none;">
                    	 	<form action="./QnaInsertAction.qn?product_num=<%=productbean.getProduct_num() %>&pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
								<input type="hidden" name="client_id" value="<%=id%>">
								<span class="glyphicon glyphicon-star"></span>
								<span class="glyphicon glyphicon-star-empty" onclick=""></span>
								<span class="glyphicon glyphicon-star-empty" onclick=""></span>
								<span class="glyphicon glyphicon-star-empty" onclick=""></span>
								<span class="glyphicon glyphicon-star-empty" onclick=""></span>
								<textarea rows="3" cols="120" name="content"></textarea><br>
								<input type="file" name="q_img"><br>
								<input type="submit" value="submit">
							</form>
						</div>
						<a class="btn btn-success reviewbtn">Leave a Review</a>
					</div>
				<%} %>
			<%} %>
					<hr>
					
					<%for(int i=0; i<qnaList.size(); i++){
						QnaBean qnabean = (QnaBean)qnaList.get(i);
						String qUrl = "./QnaPopular.qn?product_num="+productbean.getProduct_num()+"&pageNum="+pageNum+"&q_num="+qnabean.getQ_num();
					%>
					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star"></span>
							<span class="glyphicon glyphicon-star-empty"></span>
							<%=qnabean.getClient_id() %> / <%=qnabean.getPopular() %>
							<input type="button" value="++" onclick="location.href='<%=qUrl%>'">
							<span class="pull-right"><%=qnabean.getDate() %></span>
							<p><%=qnabean.getContent() %></p>
							<%if(qnabean.getQ_img()!=null){ %>
								<p><img src="./qna_img/<%=qnabean.getQ_img()%>" width="200px" height="100px"></p>
							<%} %>
						</div>
					</div>
					<%} %>
					
					<hr>

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