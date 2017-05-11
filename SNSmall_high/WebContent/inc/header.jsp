<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="navigation"> 
		<div class="navbar navbar-inverse navbar-fixed-top" role="banner"> 
			<div class="container"> 
				<div style="float: right;">
				<span>Join: <a href="sns_join2.sn">snsStar</a> 
				| <a href="clientJoin2.cl">client</a> 
				| <a href="vendorJoin2.ve">vendor</a></span>
				</div>
				<div style="float: right;">
				<span>Login: <a href="login2.cl">client</a> </span>
				</div>
				<div class="navbar-header"> 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> 
					</button> 
					<a class="navbar-brand" style="height: 70px !important;" href="Main.cl"><h1><img src="./himu/images/logo.png" alt="logo" style="padding-top: 12px;"></h1></a> 
				</div> 
				<div class="collapse navbar-collapse" style="height: 70px !important;">
					<ul class="nav navbar-nav navbar-right">
						<li class="scroll"><a href="#navigation">Home</a></li>
						<li class="scroll dropbtn"><a href="ProductList.pr">GoodsList</a>
							<div class="dropdown-content">
     							<a href="ProductList.pr">전체</a>
     					 		<a href="ProductList.pr?category=fashion">패션</a>
     					 		<a href="ProductList.pr?category=beauty">뷰티</a>
     					 		<a href="ProductList.pr?category=baby">육아</a>
     					 		<a href="ProductList.pr?category=daily">일상</a>
     					 		<a href="ProductList.pr?category=gym">운동</a>
     					 		<a href="ProductList.pr?category=etc">기타</a>
    						</div>
    					</li>
						<li class="scroll dropbtn"><a href="snsList.sn">Stars</a>
							<div class="dropdown-content">
     							<a href="snsList.sn">전체</a>
     					 		<a href="snsList.sn?category=fashion">패션</a>
     					 		<a href="snsList.sn?category=beauty">뷰티</a>
     					 		<a href="snsList.sn?category=baby">육아</a>
     					 		<a href="snsList.sn?category=daily">일상</a>
     					 		<a href="snsList.sn?category=gym">운동</a>
     					 		<a href="snsList.sn?category=etc">기타</a>
    						</div>
						</li>
						<%
						String pageNum = (String)request.getAttribute("pageNum");
						if(pageNum == null){pageNum="1";}
						int product_num = 9;
						request.setAttribute("product_num", product_num);
						String id = (String)session.getAttribute("id");
						%> 
						<li class="scroll"><a href="Service.cl">Our Service</a></li>
						<li class="scroll"><a href="./ProductDetail.pr?product_num=<%=product_num %>&pageNum=<%=pageNum%>">Detail</a></li> 
						<li class="scroll"><a href="MyPage.pa">MyPage</a></li>
						<li class="scroll"><a href="#">Contact</a></li>
					</ul> 
				</div> 
			</div> 
		</div><!--/navbar--> 
	</header> <!--/#navigation--> 
