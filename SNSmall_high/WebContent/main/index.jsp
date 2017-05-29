<%@page import="web.product.db.ProductBean"%>
<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/prettyPhoto.css" rel="stylesheet"> 
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/animate.css" rel="stylesheet"> 
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/responsive.css" rel="stylesheet"> 
	<link href="./css/header.css" rel="stylesheet"> 
	<!--[if lt IE 9]> <script src="js/html5shiv.js"></script> 
	<script src="js/respond.min.js"></script> <![endif]--> 
	<link rel="shortcut icon" href="images/ico/favicon.png"> 
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png"> 
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png"> 
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png"> 
	<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$('#mainimg_item').
function snsSearch_exe(){
	search = document.getElementById('product_name').value;
	location.href = 'SearchSnsList.sn?search='+search;
}
function productSearch_exe(){
	search = document.getElementById('product_name').value;
	location.href = './ProductSearchList.pr?search='+search;
}

</script>
</head>
<body>
<script type="text/javascript" src=".main/alarm.js"></script> 
	<div class="preloader">
		<div class="preloder-wrap">
			<div class="preloder-inner"> 
				<div class="ball"></div> 
				<div class="ball"></div> 
				<div class="ball"></div> 
				<div class="ball"></div> 
				<div class="ball"></div> 
				<div class="ball"></div> 
				<div class="ball"></div>
			</div>
		</div>
	</div><!--/.preloader-->
<jsp:include page="../inc/header.jsp"/>
	<section id="home">
		<div class="home-pattern"></div>
		<div id="main-carousel" class="carousel slide" data-ride="carousel"> 
			<ol class="carousel-indicators">
				<li data-target="#main-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#main-carousel" data-slide-to="1"></li>
				<li data-target="#main-carousel" data-slide-to="2"></li>
			</ol><!--/.carousel-indicators--> 
			<div class="carousel-inner">
				<div class="item active" style="background-image: url(images/slider/main001.gif)"> 
					<div class="carousel-caption"> 
						<div> 
							<h2 class="heading animated bounceInDown">'Himu' Onepage HTML Template</h2> 
							<p class="animated bounceInUp">Fully Professional one page template</p> 
 							<!-- <a class="btn btn-default slider-btn animated fadeIn" href="#">상품 검색</a> 
							<a class="btn btn-default slider-btn animated fadeIn" href="#">SNS STAR 검색</a>   -->
						</div> 
					</div> 
				</div>
				<div class="item" style="background-image: url(images/slider/main02.gif)"> 
					<div class="carousel-caption"> <div> 
						<h2 class="heading animated bounceInDown">Get All in Onepage</h2> 
						<p class="animated bounceInUp">Everything is outstanding </p>
<!-- 						<a class="btn btn-default slider-btn animated fadeIn" href="#">상품 검색</a> 
						<a class="btn btn-default slider-btn animated fadeIn" href="#">SNS STAR 검색</a>  -->
					</div> 
				</div> 
			</div> 
			<div class="item" style="background-image: url(images/slider/main004.gif)"> 
				<div class="carousel-caption"> 
					<div> 
						<h2 class="heading animated bounceInRight">Fully Responsive Template</h2> 
						<p class="animated bounceInLeft">100% Responsive HTML template</p> 
<!-- 						<a class="btn btn-default slider-btn animated fadeIn" href="#">상품 검색</a> 
						<a class="btn btn-default slider-btn animated fadeIn" href="#">SNS STAR 검색</a>  -->
					</div> 
				</div> 
			</div>

			
		</div><!--/.carousel-inner-->

 
		<a class="carousel-left member-carousel-control hidden-xs" href="#main-carousel" data-slide="prev"><i class="fa fa-angle-left"></i></a>
		<a class="carousel-right member-carousel-control hidden-xs" href="#main-carousel" data-slide="next"><i class="fa fa-angle-right"></i></a>
		<div class="carousel-caption"> 
		<div id="search">
			<div class="col-sm-7">
			<div class="input_row" id="id_area">
						<span class="input_box1">
							<input type="text" id="product_name" placeholder="SNS Celeb or Prodoct Name Search" class="int" maxlength="80" value="" size="100">
							
						</span>
					</div>
			</div>
		<div class="col-sm-3"><input type="button" class="Sns_SearchBtn" value="" onclick="snsSearch_exe();" style="height: 60px; width: 60px;">
							<input type="button" class="product_SearchBtn" value="" onclick="productSearch_exe()" style="width:60px; height:60px;"></div>
		<div class="col-sm-2"></div>					
		</div>
		</div>
	</div> 


</section><!--/#home-->

<section id="about-us">
	<div class="container">
		<div class="text-center">
			<div class="col-sm-8 col-sm-offset-2">
				<h2 class="title-one">Why With Us?</h2>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
			</div>
		</div>
		<div class="about-us">
			<div class="row">
				<div class="col-sm-6">
					<h3>Why with us?</h3>
					<ul class="nav nav-tabs">
						<li class="active"><a href="#about" data-toggle="tab"><i class="fa fa-chain-broken"></i> About</a></li>
						<li><a href="#mission" data-toggle="tab"><i class="fa fa-th-large"></i> Mission</a></li>
						<li><a href="#community" data-toggle="tab"><i class="fa fa-users"></i> Community</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="about">
							<div class="media">
								<img class="pull-left media-object" src="images/about-us/about.jpg" alt="about us"> 
								<div class="media-body">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="mission">
							<div class="media">
								<img class="pull-left media-object" src="images/about-us/mission.jpg" alt="Mission"> 
								<div class="media-body">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci </p>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="community">
							<div class="media">
								<img class="pull-left media-object" src="images/about-us/community.jpg" alt="Community"> 
								<div class="media-body">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<h3>Our Skills</h3>
					<div class="skill-bar">
						<div class="skillbar clearfix " data-percent="90%">
							<div class="skillbar-title">
								<span>HTML5 &amp; CSS3</span>
							</div>
							<div class="skillbar-bar"></div>
							<div class="skill-bar-percent">90%</div>
						</div> <!-- End Skill Bar -->
						<div class="skillbar clearfix" data-percent="85%">
							<div class="skillbar-title"><span>UI Design</span></div>
							<div class="skillbar-bar"></div>
							<div class="skill-bar-percent">85%</div>
						</div> <!-- End Skill Bar -->
						<div class="skillbar clearfix " data-percent="70%">
							<div class="skillbar-title"><span>jQuery</span></div>
							<div class="skillbar-bar"></div>
							<div class="skill-bar-percent">70%</div>
						</div> <!-- End Skill Bar -->
						<div class="skillbar clearfix " data-percent="60%">
							<div class="skillbar-title"><span>PHP</span></div>
							<div class="skillbar-bar"></div>
							<div class="skill-bar-percent">60%</div>
						</div> <!-- End Skill Bar -->
						<div class="skillbar clearfix " data-percent="75%">
							<div class="skillbar-title"><span>Wordpress</span></div>
							<div class="skillbar-bar"></div>
							<div class="skill-bar-percent">75%</div>
						</div> <!-- End Skill Bar --></div>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#about-us-->

	<section id="services" class="parallax-section">
		<div class="container">
			<div class="row text-center">
				<div class="col-sm-8 col-sm-offset-2">
					<h2 class="title-one">Services</h2>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="our-service">
						<div class="services row">
							<div class="col-sm-4">
								<div class="single-service">
									<i class="fa fa-th"></i>
									<h2>Modern Design</h2>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore.</p>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="single-service">
									<i class="fa fa-html5"></i>
									<h2>Web Development</h2>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy </p>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="single-service">
									<i class="fa fa-users"></i>
									<h2>Online Marketing</h2>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore.</p>
								</div>
							</div></div>
						</div>
					</div>
				</div>
			</div>
		</section><!--/#service-->

		<section id="our-team">
			<div class="container">
				<div class="row text-center">
					<div class="col-sm-8 col-sm-offset-2">
						<h2 class="title-one">Meet The Team</h2>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.</p>
					</div>
				</div>
				<div id="team-carousel" class="carousel slide" data-interval="false">
					<a class="member-left" href="#team-carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
					<a class="member-right" href="#team-carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					<div class="carousel-inner team-members">
						<div class="row item active">
							<%List<SnsBean> list = (List<SnsBean>)request.getAttribute("list");
							for(int i=0; i<4; i++){
								SnsBean sb = list.get(i);%>
								<div class="col-sm-6 col-md-3">
									<div class="single-member">
										<div id="profile_img_wrap">
											<%if(i==0){%>
												<span id="ranking_sns_first">1등!</span>
											<%}else{ %>
												<span id="ranking_sns"><%=i+1 %>등</span>
											<%} %>
											<img src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="team member" />
										</div>
										<div id="star_list_detail">
											<h3><a href="SnsDetailAction.sn?sns_id=<%=sb.getSns_id()%>"><%=sb.getName() %></a>
											<small><%=sb.getCategory() %>/<%=sb.getRank() %></small></h3>
											<p><%=sb.getContent() %></p>
										</div>
										<div class="socials">
											<%if(sb.getFacebook().trim().length()!=0){%>
												<a href="<%=sb.getFacebook()%>"><i class="fa fa-facebook"></i></a>
											<%}if(sb.getTwitter().trim().length()!=0){%>							
											<a href="<%=sb.getTwitter()%>"><i class="fa fa-twitter"></i></a>
											<%}if(sb.getInstagram().trim().length()!=0){%>			
											<a href="<%=sb.getInstagram()%>"><i class="fa fa-instagram"></i></a>
											<%}if(sb.getBlog().trim().length()!=0){%>	
											<a href="<%=sb.getBlog()%>"><i class="fa fa-bold"></i></a>
											<%}if(sb.getEtc().trim().length()!=0){%>	
											<a href="<%=sb.getEtc()%>"><i class="fa fa-smile-o"></i></a>
											<%} %>
										</div>
									</div>
								</div>
							<%} %>
						</div>
						<div class="row item">
							<%for(int i=4; i<8; i++){
								SnsBean sb = list.get(i);%>
								<div class="col-sm-6 col-md-3">
									<div class="single-member">
										<div id="profile_img_wrap">
											<%if(i==0){%>
												<span id="ranking_sns_first">1등!</span>
											<%}else{ %>
												<span id="ranking_sns"><%=i+1 %>등</span>
											<%} %>										
											<img src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="team member" />
										</div>
										<div id="star_list_detail">
											<h3><a href="SnsDetailAction.sn?sns_id=<%=sb.getSns_id()%>"><%=sb.getName() %></a>
											<small><%=sb.getCategory() %>/<%=sb.getRank() %></small></h3>
											<p><%=sb.getContent() %></p>
										</div>
										<div class="socials">
											<%if(sb.getFacebook().trim().length()!=0){%>
												<a href="<%=sb.getFacebook()%>"><i class="fa fa-facebook"></i></a>
											<%}if(sb.getTwitter().trim().length()!=0){%>							
											<a href="<%=sb.getTwitter()%>"><i class="fa fa-twitter"></i></a>
											<%}if(sb.getInstagram().trim().length()!=0){%>			
											<a href="<%=sb.getInstagram()%>"><i class="fa fa-instagram"></i></a>
											<%}if(sb.getBlog().trim().length()!=0){%>	
											<a href="<%=sb.getBlog()%>"><i class="fa fa-bold"></i></a>
											<%}if(sb.getEtc().trim().length()!=0){%>	
											<a href="<%=sb.getEtc()%>"><i class="fa fa-smile-o"></i></a>
											<%} %>
										</div>
									</div>
								</div>
								<%} %>
						</div>
					</div>
				</div>
			</div>
		</section><!--/#Our-Team-->

		<section id="portfolio">
			<div class="container">
				<div class="row text-center">
					<div class="col-sm-8 col-sm-offset-2">
						<h2 class="title-one">Portfolio</h2>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.</p>
					</div>
				</div>
				<ul class="portfolio-filter text-center">
					<li><a class="btn btn-default active" href="#" data-filter="*">All</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".fashion">Fashion</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".beauty">Beauty</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".baby">Baby</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".daily">Daily</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".gym">WorkOut</a></li>
					<li><a class="btn btn-default" href="#" data-filter=".etc">Etc</a></li>
				</ul><!--/#portfolio-filter-->
				<div class="portfolio-items">
					<%
					List<ProductBean> product_list = (List<ProductBean>)request.getAttribute("product_list");
					for(int i=0; i<product_list.size(); i++){
						ProductBean prob = product_list.get(i);
					%>
					<div class="col-sm-3 col-xs-12 portfolio-item <%=prob.getCategory()%>">
						<div class="view efffect">
							<div class="portfolio-image">
								<%if(prob.getMain_img()==null){ %>
    	            		    		<div><img src="./qna_img/default.jpg" style="" alt=""></div>
        			            <%} else{%>
										<img id="mainimg_item" src="./vendor_img/<%=prob.getMain_img() %>" alt=""></div>
								<%} %> 
								<div class="mask text-center">
									<h3>Novel</h3>
									<h4>Lorem ipsum dolor sit amet consectetur</h4>
									<a href="#"><i class="fa fa-link"></i></a>
									<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
								</div>
							</div>
						</div>
						<%} %>
<!--					<div class="col-sm-3 col-xs-12 portfolio-item html">
						<div class="view efffect">
							<div class="portfolio-image">
								<img src="images/portfolio/1.jpg" alt=""></div> 
								<div class="mask text-center">
									<h3>Novel</h3>
									<h4>Lorem ipsum dolor sit amet consectetur</h4>
									<a href="#"><i class="fa fa-link"></i></a>
									<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
								</div>
							</div>
						</div>
 						<div class="col-sm-3 col-xs-12 portfolio-item jooma">
							<div class="view efffect" >
								<div class="portfolio-image">
									<img src="images/portfolio/2.jpg" alt="">
								</div> 
								<div class="mask text-center">
									<h3>Novel</h3>
									<h4>Lorem ipsum dolor sit amet consectetur</h4>
									<a href="#"><i class="fa fa-link"></i></a>
									<a href="images/portfolio/big-item4.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 portfolio-item wordpress">
							<div class="view efffect">
								<div class="portfolio-image">
									<img src="images/portfolio/3.jpg" alt="">
								</div> 
								<div class="mask text-center">
								<h3>Novel</h3>
								<h4>Lorem ipsum dolor sit amet consectetur</h4>
								<a href="#"><i class="fa fa-link"></i></a>
								<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12 portfolio-item megento">
						<div class="view efffect">
							<div class="portfolio-image">
								<img src="images/portfolio/4.jpg" alt="">
							</div> 
							<div class="mask text-center">
								<h3>Novel</h3>
								<h4>Lorem ipsum dolor sit amet consectetur</h4>
								<a href="#"><i class="fa fa-link"></i></a>
								<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12 portfolio-item html">
						<div class="view efffect">
							<div class="portfolio-image">
								<img src="images/portfolio/5.jpg" alt="">
							</div> <div class="mask text-center">
							<h3>Novel</h3>
							<h4>Lorem ipsum dolor sit amet consectetur</h4>
							<a href="#"><i class="fa fa-link"></i></a>
							<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-xs-12 portfolio-item wordpress">
					<div class="view efffect">
						<div class="portfolio-image">
							<img src="images/portfolio/6.jpg" alt="">
						</div> 
						<div class="mask text-center">
							<h3>Novel</h3>
							<h4>Lorem ipsum dolor sit amet consectetur</h4>
							<a href="#"><i class="fa fa-link"></i></a>
							<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-xs-12 portfolio-item html">
					<div class="view efffect">
						<div class="portfolio-image">
							<img src="images/portfolio/7.jpg" alt="">
						</div> 
						<div class="mask text-center">
							<h3>Novel</h3>
							<h4>Lorem ipsum dolor sit amet consectetur</h4>
							<a href="#"><i class="fa fa-link"></i></a>
							<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-xs-12 portfolio-item joomla">
					<div class="view efffect">
						<div class="portfolio-image">
							<img src="images/portfolio/8.jpg" alt=""></div> 
							<div class="mask text-center">
								<h3>Novel</h3>
								<h4>Lorem ipsum dolor sit amet consectetur</h4>
								<a href="#"><i class="fa fa-link"></i></a>
								<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12 portfolio-item html">
						<div class="view efffect">
							<div class="portfolio-image">
								<img src="images/portfolio/9.jpg" alt="">
							</div> 
							<div class="mask text-center">
								<h3>Novel</h3>
								<h4>Lorem ipsum dolor sit amet consectetur</h4>
								<a href="#"><i class="fa fa-link"></i></a>
								<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xs-12 portfolio-item wordpress">
						<div class="view efffect">
							<div class="portfolio-image">
								<img src="images/portfolio/10.jpg" alt=""></div> 
								<div class="mask text-center">
									<h3>Novel</h3>
									<h4>Lorem ipsum dolor sit amet consectetur</h4>
									<a href="#"><i class="fa fa-link"></i></a>
									<a href="images/portfolio/big-item.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12 portfolio-item joomla">
							<div class="view efffect">
								<div class="portfolio-image">
									<img src="images/portfolio/11.jpg" alt=""></div> 
									<div class="mask text-center">
										<h3>Novel</h3>
										<h4>Lorem ipsum dolor sit amet consectetur</h4>
										<a href="#"><i class="fa fa-link"></i></a>
										<a href="images/portfolio/big-item3.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
									</div>
								</div>
							</div>
							<div class="col-sm-3 col-xs-12 portfolio-item megento">
								<div class="view efffect">
									<div class="portfolio-image">
										<img src="images/portfolio/12.jpg" alt=""></div> 
										<div class="mask text-center">
											<h3>Novel</h3>
											<h4>Lorem ipsum dolor sit amet consectetur</h4>
											<a href="#"><i class="fa fa-link"></i></a>
											<a href="images/portfolio/big-item4.jpg" data-gallery="prettyPhoto"><i class="fa fa-search-plus"></i></a>
										</div>
									</div>
								</div> -->
							</div>
						</div> 

					</section> <!--/#portfolio-->

					<section id="clients" class="parallax-section">
						<div class="container">
							<div class="clients-wrapper">
								<div class="row text-center">
									<div class="col-sm-8 col-sm-offset-2">
										<h2 class="title-one">Clients Say About Us</h2>
										<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit. Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>
									</div>
								</div>
								<div id="clients-carousel" class="carousel slide" data-ride="carousel"> <!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#clients-carousel" data-slide-to="0" class="active"></li>
										<li data-target="#clients-carousel" data-slide-to="1"></li>
										<li data-target="#clients-carousel" data-slide-to="2"></li>
									</ol> <!-- Wrapper for slides -->
									<div class="carousel-inner">
										<div class="item active">
											<div class="single-client">
												<div class="media">
													<img class="pull-left" src="images/clients/client1.jpg" alt="">
													<div class="media-body">
														<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p><small>Someone famous in Source Title</small><a href="">www.yourwebsite.com</a></blockquote>
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="single-client">
												<div class="media">
													<img class="pull-left" src="images/clients/client3.jpg" alt="">
													<div class="media-body">
														<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p><small>Someone famous in Source Title</small><a href="">www.yourwebsite.com</a></blockquote>
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="single-client">
												<div class="media">
													<img class="pull-left" src="images/clients/client2.jpg" alt="">
													<div class="media-body">
														<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p><small>Someone famous in Source Title</small><a href="">www.yourwebsite.com</a></blockquote>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section><!--/#clients-->

					<section id="blog"> 
						<div class="container">
							<div class="row text-center clearfix">
								<div class="col-sm-8 col-sm-offset-2">
									<h2 class="title-one">Our Blog</h2>
									<p class="blog-heading">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
								</div>
							</div> 
							<div class="row">
								<div class="col-sm-4">
									<div class="single-blog">
										<img src="images/blog/1.jpg" alt="" />
										<h2>Lorem ipsum dolor sit amet</h2>
										<ul class="post-meta">
											<li><i class="fa fa-pencil-square-o"></i><strong> Posted By:</strong> John</li>
											<li><i class="fa fa-clock-o"></i><strong> Posted On:</strong> Apr 15 2014</li>
										</ul>
										<div class="blog-content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
										</div>
										<a href="" class="btn btn-primary" data-toggle="modal" data-target="#blog-detail">Read More</a>
									</div>
									<div class="modal fade" id="blog-detail" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<img src="images/blog/3.jpg" alt="" />
													<h2>Lorem ipsum dolor sit amet</h2>
													<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
												</div> 
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="single-blog">
										<img src="images/blog/2.jpg" alt="" />
										<h2>Lorem ipsum dolor sit amet</h2>
										<ul class="post-meta">
											<li><i class="fa fa-pencil-square-o"></i><strong> Posted By:</strong> John</li>
											<li><i class="fa fa-clock-o"></i><strong> Posted On:</strong> Apr 15 2014</li>
										</ul>
										<div class="blog-content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
										</div>
										<a href="" class="btn btn-primary" data-toggle="modal" data-target="#blog-two">Read More</a>
									</div>
									<div class="modal fade" id="blog-two" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<img src="images/blog/2.jpg" alt="" />
													<h2>Lorem ipsum dolor sit amet</h2>
													<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="single-blog">
										<img src="images/blog/3.jpg" alt="" />
										<h2>Lorem ipsum dolor sit amet</h2>
										<ul class="post-meta">
											<li><i class="fa fa-pencil-square-o"></i><strong> Posted By:</strong> John</li>
											<li><i class="fa fa-clock-o"></i><strong> Posted On:</strong> Apr 15 2014</li>
										</ul>
										<div class="blog-content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
										</div>
										<a href="" class="btn btn-primary" data-toggle="modal" data-target="#blog-three">Read More</a>
									</div>
									<div class="modal fade" id="blog-three" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<img src="images/blog/3.jpg" alt="" />
													<h2>Lorem ipsum dolor sit amet</h2>
													<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
												</div> 
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="single-blog">
										<img src="images/blog/3.jpg" alt="" />
										<h2>Lorem ipsum dolor sit amet</h2>
										<ul class="post-meta">
											<li><i class="fa fa-pencil-square-o"></i><strong> Posted By:</strong> John</li>
											<li><i class="fa fa-clock-o"></i><strong> Posted On:</strong> Apr 15 2014</li>
										</ul>
										<div class="blog-content">
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
										</div>
										<a href="" class="btn btn-primary" data-toggle="modal" data-target="#blog-four">Read More</a></div>
										<div class="modal fade" id="blog-four" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-body">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														<img src="images/blog/3.jpg" alt="" />
														<h2>Lorem ipsum dolor sit amet</h2>
														<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
													</div> 
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="single-blog">
											<img src="images/blog/2.jpg" alt="" />
											<h2>Lorem ipsum dolor sit amet</h2>
											<ul class="post-meta">
												<li><i class="fa fa-pencil-square-o"></i><strong> Posted By:</strong> John</li>
												<li><i class="fa fa-clock-o"></i><strong> Posted On:</strong> Apr 15 2014</li>
											</ul>
											<div class="blog-content">
												<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
											</div>
											<a href="" class="btn btn-primary" data-toggle="modal" data-target="#blog-six">Read More</a>
										</div>
										<div class="modal fade" id="blog-six" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-body">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														<img src="images/blog/2.jpg" alt="" />
														<h2>Lorem ipsum dolor sit amet</h2>
														<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
													</div> 
												</div>
											</div>
										</div>
									</div>

									<div class="col-sm-4">
										<div class="single-blog">
											<img src="images/blog/1.jpg" alt="" />
											<h2>Lorem ipsum dolor sit amet</h2>
											<ul class="post-meta">
												<li><i class="fa fa-pencil-square-o"></i><strong> Posted By:</strong> John</li>
												<li><i class="fa fa-clock-o"></i><strong> Posted On:</strong> Apr 15 2014</li>
											</ul>
											<div class="blog-content">
												<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
											</div>
											<a href="" class="btn btn-primary" data-toggle="modal" data-target="#blog-seven">Read More</a>
										</div>
										<div class="modal fade" id="blog-seven" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-body">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														<img src="images/blog/1.jpg" alt="" />
														<h2>Lorem ipsum dolor sit amet</h2>
														<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
													</div> 
												</div>
											</div>
										</div>
									</div> 
								</div> 
							</div> 
						</section> <!--/#blog-->

						<section id="contact">
							<div class="container">
								<div class="row text-center clearfix">
									<div class="col-sm-8 col-sm-offset-2">
										<div class="contact-heading">
											<h2 class="title-one">Contact With Us</h2>
											<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>
										</div>
									</div>
								</div>
							</div>
							<div class="container">
								<div class="contact-details">
									<div class="pattern"></div>
									<div class="row text-center clearfix">
										<div class="col-sm-6">
											<div class="contact-address"><address><p><span>Devs</span>Cluster</p><strong>36 North Kafrul<br>Dhaka Cantonment Area<br> Dhaka-1206, Bangladesh</strong><br><small>( Lorem ipsum dolor sit amet, consectetuer adipiscing elit )</small></address>
												<div class="social-icons">
													<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a>
													<a href="#"><i class="fa fa-google-plus"></i></a><a href="#"><i class="fa fa-dribbble"></i></a>
													<a href="#"><i class="fa fa-linkedin"></i></a>
												</div>
											</div>
										</div>
										<div class="col-sm-6"> 
											<div id="contact-form-section">
												<div class="status alert alert-success" style="display: none"></div>
												<form id="contact-form" class="contact" name="contact-form" method="post" action="SendMail.cl">
													<div class="form-group">
														<input type="text" name="name" class="form-control name-field" required="required" placeholder="Your Name"></div>
														<div class="form-group">
															<input type="email" name="email" class="form-control mail-field" required="required" placeholder="Your Email">
														</div> 
														<div class="form-group">
															<textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Message"></textarea>
														</div> 
														<div class="form-group">
															<button type="submit" class="btn btn-primary">Send</button>
														</div>
													</form> 
												</div>
											</div>
										</div>
									</div>
								</div> 
							</section> <!--/#contact--> 

	<footer id="footer"> 
		<div class="container"> 
			<div class="text-center"> 
				<p>Copyright &copy; 2014 - <a href="http://mostafiz.me/">Mostafiz</a> | All Rights Reserved</p> 
			</div> 
		</div> 
	</footer> <!--/#footer--> 

	<script type="text/javascript" src="js/jquery.js"></script> 
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/smoothscroll.js"></script> 
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script> 
	<script type="text/javascript" src="js/jquery.parallax.js"></script> 
	<script type="text/javascript" src="js/main.js"></script> 
</body>
</html>