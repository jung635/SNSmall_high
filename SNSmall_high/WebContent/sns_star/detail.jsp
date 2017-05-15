<%@page import="web.product.db.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="web.sns.db.SnsBean"%>
<%@page import="web.product.db.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="csstransforms csstransforms3d csstransitions">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
		<link href="./css/font-awesome.min.css" rel="stylesheet"> 
<title>Insert title here</title>
<style>
#our-team{
	float: right;
}
#our-team .socials i {
    border-radius: 0px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">

//scroll menu
window.onscroll = changePos;
function changePos() {
	var skill_y = $('#skill').offset().top + $('#skill').height()-300;
	var nav_y = $('#navigation .navbar').height()+8;
	var sell_popular_y = $('#sell_popular_box').offset().top + $('#sell_popular_box').height()-300;
	var sell_latest_y = $('#sell_latest_box').offset().top + $('#sell_latest_box').height()-500;
	var policy_info_y = $('#policy_info_box').offset().top + $('#policy_info_box').height();
    var tab = document.getElementById("tab");
    if (window.pageYOffset > 750) {
        tab.style.position = "absolute";
        tab.style.top = pageYOffset+nav_y+ "px";
        tab.style.width = "1110px";
        if (window.pageYOffset >= 680&&window.pageYOffset<=skill_y) {
        	$('#t_skill').addClass('active');
        } else{
        	$('#t_skill').removeClass('active');
        }
        if (window.pageYOffset >=skill_y&&window.pageYOffset<=sell_popular_y) {
        	$('#t_sell_popular').addClass('active');
        }else{
        	$('#t_sell_popular').removeClass('active');
        }
        if (window.pageYOffset >= sell_popular_y&&window.pageYOffset<=sell_latest_y) {
        	$('#t_sell_latest').addClass('active');
        }else{
        	$('#t_sell_latest').removeClass('active');
        }
         if (window.pageYOffset >= sell_latest_y) {
        	$('#t_policy_info').addClass('active');
        }else{
        	$('#t_policy_info').removeClass('active');
        } 
    } else {
        tab.style.position = "";
        tab.style.top = "";
    }
}

$(document).ready(function(){
	var width=10;
	
	$('.skillbar-bar').css('width','width+10+"%"');
	$(".btn-success").click(function(){
        $("#writing").toggle();
    });
	showSlides(0,5);
}); 

//이미지 크게 띄우기
function view(img){
	var src = $(img).attr('src');
	$('#big_img').attr("src", src);
}
function imageOn(path, count){
	var divform = document.getElementById("up"+count);
	divform.style.display = '';
	document.getElementById("upImg"+count).src = path;
}
function imageOut(count){
	var divform = document.getElementById("up"+count);
	divform.style.display = 'none';
} 
//slide
function plusSlides(n,length) {
	showSlides(n, length);
}
function showSlides(n, full_length) {
	slides = document.getElementsByClassName("mySlides");
	if(full_length>=5){
		if(n==0){
			for (i = 0; i < 4; i++) {
				slides[i].style.display = "block";
				if((4+i)<full_length) slides[4+i].style.display = "none";	
			}
		}
		if(n==4){
			for (i = 4; i < 8; i++) {
				if(i<full_length) slides[i].style.display = "block";
				slides[7-i].style.display = "none";
			}
		}
	}
} 

</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%SnsBean sb= (SnsBean)request.getAttribute("sb");
List<Integer> latest_list= (List<Integer>)request.getAttribute("latest_list");
int latest_size = (latest_list.size()>4) ? 4:latest_list.size();
List<Integer> popular_list= (List<Integer>)request.getAttribute("popular_list");
int popular_size = (popular_list.size()>4) ? 4:popular_list.size();
ProductDAO pdao = new ProductDAO();
ProductBean pb;
int all_price_rank = (Integer)request.getAttribute("all_price_rank");
int cat_price_rank = (Integer)request.getAttribute("cat_price_rank");
int all_amount_rank = (Integer)request.getAttribute("all_amount_rank");
int cat_amount_rank = (Integer)request.getAttribute("cat_amount_rank");
int rank_percent = (Integer)request.getAttribute("rank_percent");
%>
<!-- Page Content -->
<div class="container">
	<div class="content">
		<!-- Portfolio Item Heading -->
        <div class="row">
			<div class="col-lg-12">
                <h1 class="page-header"><%=sb.getName() %>
                    <small><%=sb.getCategory() %>/<%=sb.getRank() %></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive" style="margin: auto;" src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="">
            </div>
            <div class="col-md-4">              
                <h3>상세 정보</h3>
                <ul>
                    <li>이름:<%=sb.getName()  %></li>
                    <li>주력 카테고리: <%=sb.getCategory() %></li>
                    <li>등급: <%=sb.getRank() %></li>
                    <li>Adipiscing Elit</li>
                </ul>
                 <h3>자기 소개</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
            </div>
            <section id="our-team">
				<div class="socials">
							<%if(sb.getFacebook()!=null){%>
								<a href="<%=sb.getFacebook()%>"><i class="fa fa-facebook"></i></a>
							<%}if(sb.getTwitter()!=null){%>							
							<a href="<%=sb.getTwitter()%>"><i class="fa fa-twitter"></i></a>
							<%}if(sb.getInstagram()!=null){%>			
							<a href="<%=sb.getInstagram()%>"><i class="fa fa-instagram"></i></a>
							<%}if(sb.getBlog()!=null){%>	
							<a href="<%=sb.getBlog()%>"><i class="fa fa-bold"></i></a>
							<%}if(sb.getEtc()!=null){%>	
							<a href="<%=sb.getEtc()%>"><i class="fa fa-smile-o"></i></a>
							<%} %>
				</div>
			</section>
        </div>
        <!-- /.row -->
        <%if(sb.getDetail_img()!=null){
        	String[] detail_img = sb.getDetail_img().split(","); %>
        <!-- Related Projects Row -->
        <div class="row">
            <div id="img_wrap">
            	<div>
            		<a class="prev" onclick="plusSlides(0,'<%=detail_img.length%>')">&#10094;</a>
           		</div>
				<div id="img_list">
					<%for(int i=0; i<detail_img.length; i++){ %>
            		<div class="col-sm-3 col-xs-6 mySlides" style="position: relative;" >
						<a href="#"><img class="img-responsive portfolio-item" id="sns_imgs" src="./sns_pro_upload/<%=detail_img[i] %>" alt="" onclick="view(this)" onmouseover="imageOn('./sns_pro_upload/<%=detail_img[i] %>', <%=i%>)" onmouseout="imageOut(<%=i%>)"></a>
						<div id="up<%=i %>" style="position:absolute; width:100%; max-width: 300px; left:35%; top: 150px; display:none; z-index: 10;">
							<img id="upImg<%=i %>" src="" width="100%" height="100%"/>
						</div>
          	  		</div><%} %>
           		</div>
				<div>
  					<a class="next" onclick="plusSlides(4,'<%=detail_img.length%>')">&#10095;</a>
           		</div>
			</div>
		</div><%} %>
		<div id="tab">
			<a href="#skill" id="t_skill">스타 스킬 확인</a>
			<a href="#sell_popular" id="t_sell_popular">많이 판매한 상품</a>
			<a href="#sell_latest" id="t_sell_latest">최근 판매한 상품</a>
			<a href="#policy_info" id="t_policy_info">안내사항 확인</a>
		</div>
        <div id="bigimg_active">
        	<img src="" id="big_img">
        </div>
		<!-- skill bar start -->
		<a name="skill"></a>
        <div id="skill">
			<div class="col-sm-6">
				<h3>Star Skills</h3>
				<div class="skill-bar">
					<div class="skillbar clearfix " data-percent="<%=all_price_rank%>%">
						<div class="skillbar-title">
							<span>전체 판매액</span>
						</div>
						<div class="skillbar-bar"></div>
						<div class="skill-bar-percent"><%=all_price_rank%>%</div>
					</div> <!-- End Skill Bar -->
					<div class="skillbar clearfix" data-percent="<%=all_amount_rank%>%">
						<div class="skillbar-title"><span>전체 판매량</span></div>
						<div class="skillbar-bar"></div>
						<div class="skill-bar-percent"><%=all_amount_rank%>%</div>
					</div> <!-- End Skill Bar -->
					<div class="skillbar clearfix " data-percent="<%=cat_price_rank%>%">
						<div class="skillbar-title"><span>주력 카테고리 내 판매액</span></div>
						<div class="skillbar-bar"></div>
						<div class="skill-bar-percent"><%=cat_price_rank%>%</div>
					</div>	
					<div class="skillbar clearfix " data-percent="<%=cat_amount_rank%>%">
						<div class="skillbar-title"><span>주력 카테고리 내 판매량</span></div>
						<div class="skillbar-bar"></div>
						<div class="skill-bar-percent"><%=cat_amount_rank%>%</div>
					</div>	
					<div class="skillbar clearfix " data-percent=<%=rank_percent%>%>
						<div class="skillbar-title"><span>등급</span></div>
						<div class="skillbar-bar"></div>
						<div class="skill-bar-percent"><%=rank_percent%>%</div>
					</div> <!-- End Skill Bar -->
				</div>
			</div>
        </div>
        <!-- skill bar end -->
      	<div class="clear">
      	<a name="sell_popular"></a>
		<div class="well" id="sell_popular_box">
			<div><h3>가장 많이 판매한 상품</h3></div>
			<%for(int i=0; i<popular_size; i++){
				pb = pdao.getProduct(popular_list.get(i));%>
			<div class="col-sm-3 col-xs-6">
				<div>
				<a href="#">
					<img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/<%=pb.getMain_img() %>" alt="" onclick="view(this)">
               	</a>
               	</div>
               	<div>
               		이름: <%=pb.getSubject() %><br>
               		가격: <%=pb.getPrice() %>
               	</div>
 			</div><%} %>
		</div>
		<a name="sell_latest"></a>
		<div class="well" id="sell_latest_box">
			<div><h3>최근 판매한 상품</h3></div>
			<%for(int i=0; i<latest_size; i++){
				pb = pdao.getProduct(latest_list.get(i));%>
			<div class="col-sm-3 col-xs-6">
				<a href="#">
					<img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/<%=pb.getMain_img() %>" alt="" onclick="view(this)">
               	 </a>
               	 <div>
               		이름: <%=pb.getSubject() %><br>
               		가격: <%=pb.getPrice() %>
               	</div>
            </div> <%} %>
		</div>
		
		<a name="policy_info"></a>
		<div id="policy_info_box">
			<div><h3>안내 사항 확인</h3></div>
			<div>
				<ul>
					<li>SNS 스타들의 정보와 우리 회사와는 전혀 무관합니다.</li>
					<li>SNS 스타들과 물건 정보 및 판매 과정은 전혀 무관합니다.</li>
					<li>SNS 스타들의 skill과 실제 판매 물건은 다소 차이가 있을 수 있습니다.</li>
					<li>자세한 판매 사항은 판매자에게 문의하시기 바랍니다.</li>
					<li>SNS 스타의 개인적인 연락처는 요청 하시더라도 회사에서 제공하지 않습니다.</li>
					<li>SNS 스타와 컨텍은  쪽지를 이용해주시기 바랍니다.</li>
					<li>SNS 스타에 제공되는  profit은 등급마다 다릅니다.</li>
				</ul>
				<table border="1">
					<tr><td>등급</td><td>Premium</td><td>Plus</td><td>Basic</td></tr>
					<tr><td>기준</td><td>1천만원 이상</td><td>500만원 이상</td><td>기본</td></tr>
					<tr><td>profit</td><td>20%</td><td>10%</td><td>5%</td></tr>
				</table>
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
    <!-- content end -->
	</div>
</div>
<!-- /.container -->
	<script type="text/javascript" src="js/jquery.js"></script> 
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/smoothscroll.js"></script> 
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script> 
	<script type="text/javascript" src="js/jquery.parallax.js"></script> 
	<script type="text/javascript" src="js/main.js"></script> 
</body>
</html>