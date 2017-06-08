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
<%	ProductBean productbean = (ProductBean)request.getAttribute("productbean"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    $(".reviewbtn").click(function(){
        	$("#writing").toggle();
    	});
	    
	    var star = 1;
	    star *= 1;
	    
		$('#qnastar').find('#star4').click(function(){
			if($(this).attr('class')=="glyphicon glyphicon-star-empty"){
				$('#qnastar').find('#star1, #star2, #star3, #star4').attr('class', "glyphicon glyphicon-star");
				star = 5;
			}else{
				$(this).attr('class', "glyphicon glyphicon-star-empty");
				star = 4;
			}$('input[name=stars]').val(star);
		});
		
		$('#qnastar').find('#star3').click(function(){
			if($(this).attr('class')=="glyphicon glyphicon-star-empty"){
				$('#qnastar').find('#star1, #star2, #star3').attr('class', "glyphicon glyphicon-star");
				star = 4;
			}else{
				$('#qnastar').find('#star3, #star4').attr('class', "glyphicon glyphicon-star-empty");
				star = 3;
			}$('input[name=stars]').val(star);
		});
		
		$('#qnastar').find('#star2').click(function(){
			if($(this).attr('class')=="glyphicon glyphicon-star-empty"){
				$('#qnastar').find('#star1, #star2').attr('class', "glyphicon glyphicon-star");
				star = 3;
			}else{
				$('#qnastar').find('#star2, #star3, #star4').attr('class', "glyphicon glyphicon-star-empty");
				star = 2;
			}$('input[name=stars]').val(star);
		});
		
		$('#qnastar').find('#star1').click(function(){
			if($(this).attr('class')=="glyphicon glyphicon-star-empty"){
				$('#qnastar').find('#star1').attr('class', "glyphicon glyphicon-star");
				star = 2;
			}else{
				$('#qnastar').find('#star1, #star2, #star3, #star4').attr('class', "glyphicon glyphicon-star-empty");
				star = 1;
			}$('input[name=stars]').val(star);
		});
		
	});
	
	function gocart(){
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
function LiveGoWin(){
	window.open('LiveGo.li?product_num=<%=productbean.getProduct_num()%>', 'live_view' , 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')
}	
</script>

</head>
<body>

	<%
	String returnUrl = request.getHeader("referer");
	
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
			
            <div class="col-md-4" id="ourproduct">
            	<div>
                <h3><%=productbean.getSubject() %></h3>
                <p><%=content %></p>
                
                 <select name="option1">
 					<option value=""><%=o1[0] %> 선택하세요</option>
 					<%for(int i=1; i<o1.length; i++){ %>
						<option value="<%=o1[i]%>"><%=o1[i] %></option>
					<%} %>
 				</select>
  				<br>
				<%if(productbean.getOption2() != null){ 
				String [] o2 = productbean.getOption2().split(",");%>
				<select name="option2">
 					<option value=""><%=o2[0] %> 선택하세요</option>
 						<%for(int i=1; i<o2.length; i++){ %>
	 						<option value="<%=o2[i]%>"><%=o2[i] %></option>
 						<%} %>
 				</select>
 				<br>
				<%}if(productbean.getOption3() != null){ 
				String [] o3 = productbean.getOption3().split(",");%>
 				<select name="option3">
 					<option value=""><%=o3[0] %> 선택하세요</option>
 						<%for(int i=1; i<o3.length; i++){ %>
  							<option value="<%=o3[i]%>"><%=o3[i] %></option>
  						<%} %>
  				</select>
  				</div>
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
                <div>
				잔여수량: <input type="text" name="rest_amount" value="<%=peace%> / <%=productbean.getAmount()%>"><br>
				<%
				if(peace==0){%>
					<h2>SOLD OUT</h2>
				<%}else{%>
				선택수량: <input type="text" name="amount" value="1">
				<button type="button" onclick="plus()">+</button>
				<button type="button" onclick="minus()">-</button><br>
				구매가격: <input type="text" id="allprice" name="allprice" value="<%=productbean.getPrice()%>">
				<%} %>
				</div>
				<br>
				<div>
				<%if(peace!=0){%>
                <a class="btn btn-success" onclick="gocart()">카트담기</a>
                <a class="btn btn-success" onclick="return gobuy()">사러가기</a>
                <% if(type.equals("sns")){%>
                <button id="login" onclick="LiveGoWin()">라이브 방송 시작하기</button>
				</div>
				<br>
                <div class="socials_pro">
				<a href="#" onclick="sendSns('facebook', 'http://sunju635.cafe24.com/SNSmall_high/ProductDetail.pr?product_num=<%=productbean.getProduct_num()%>&sns_id=<%=sns_id %>', '안녕')"><i class="fa fa-facebook"></i></a>
				<a href="#" onclick="sendSns('twitter', 'http://sunju635.cafe24.com/SNSmall_high/ProductDetail.pr?product_num=<%=productbean.getProduct_num()%>&sns_id=<%=sns_id %>', '안녕')"><i class="fa fa-twitter"></i></a>
				<a href="#" onclick="sendSns('blog', 'http://sunju635.cafe24.com/SNSmall_high/ProductDetail.pr?product_num=<%=productbean.getProduct_num()%>&sns_id=<%=sns_id %>', '안녕')"><i class="fa fa-bold"></i></a>
                <%}} %>
                </div>
            </div>
			</form>
        </div>
        <!-- /.row -->

        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">상 세 내 용</h3>
            </div>

            <div class="col-sm-3 col-xs-6" id="product_detail_img">
                <a href="#">
                <%if(productbean.getDetail_img()==null){ %>
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                    <%} else{%>
                    <img class="img-responsive portfolio-item" src="./vendor_img/<%=productbean.getDetail_img() %>" style="width: 100% !important;" alt="">
                    <% }%>
                </a>
            </div>

        </div>
        <div class="well">
        	<%if(type!=null){ %>
				<%if(type.equals("client")){ %>
                    <div class="text-right">
                     	<div id="writing" style="margin-bottom: 14px; display: none;">
                    	 	<form action="./QnaInsertAction.qn?product_num=<%=productbean.getProduct_num() %>&pageNum=<%=pageNum%>&vendor_id=<%=productbean.getVendor_id() %>" method="post" enctype="multipart/form-data">
								<input type="hidden" name="client_id" value="<%=id%>">
								<input type="hidden" name="stars" value="">
								<div><textarea rows="3" cols="120" name="content" style="width: 100%;"></textarea><br></div>
								<div id="qnastar"><span class="glyphicon glyphicon-star"></span>
								<span id="star1" class="glyphicon glyphicon-star-empty"></span>
								<span id="star2" class="glyphicon glyphicon-star-empty"></span>
								<span id="star3" class="glyphicon glyphicon-star-empty"></span>
								<span id="star4" class="glyphicon glyphicon-star-empty"></span></div>
								<input type="file" name="q_img">
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
						String qInsertUrl = "./QnaPopular.qn?product_num="+productbean.getProduct_num()+"&pageNum="+pageNum+"&q_num="+qnabean.getQ_num();
						String qDelUrl = "./QnaDelete.qn?product_num="+productbean.getProduct_num()+"&pageNum="+pageNum+"&q_num="+qnabean.getQ_num();
						int restStar = 5 - qnabean.getStars();
					%>
					<div class="row">
						<div class="col-md-12">
							<%for(int j=0; j<qnabean.getStars(); j++){%>
								<span class="glyphicon glyphicon-star"></span>
							<%}
							if(restStar<5){
								for(int k=0; k<restStar; k++){%>
									<span class="glyphicon glyphicon-star-empty"></span>
							<%}}%>
							<%=qnabean.getClient_id() %> / <%=qnabean.getPopular() %>
							<input type="button" value="++" onclick="location.href='<%=qInsertUrl%>'">
							<%if(id.equals(qnabean.getClient_id())){%>
							<input type="button" value="del" onclick="location.href='<%=qDelUrl%>'">
							<%} %>
							<span class="pull-right"><%=qnabean.getDate() %></span>
							<p><%=qnabean.getContent() %></p>
							<%if(qnabean.getQ_img()!=null){ %>
								<p><img src="./qna_img/<%=qnabean.getQ_img()%>" width="200px" height="100px"></p>
							<%} %>
						</div>
					</div>
					<%} %>
				</div>
				<a name="policy_info"></a>
		<div id="policy_info_box">
			<div><h3>교환 / 반품 제한사항</h3></div>
			<div>
				<table border="1">
					<tr><th>배송방법</th><td>순차배송</td><th rowspan="2">배송비</th><td rowspan="2">무료배송<br>  - 도서산간 지역의 경우, 추가비용 발생가능</td></tr>
					<tr><th>배송사</th><td>CJ GLS</td></tr>
					<tr><th>묶음배송 여부</th><td colspan="3">가능</td></tr>
				</table>
				<br>
				<ul>
					<li>주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
					<li>고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
					<li>세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
					<li>모니터 해상도의 차이로 인해 색상, 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</li>
					<li>제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
				</ul>
			</div>
		</div>
        <!-- /.row -->
		<hr>
        <!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Your Website 2017</p>
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