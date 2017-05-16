<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="navigation">
<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String type = (String) session.getAttribute("type");
%> 
		<div class="navbar navbar-inverse navbar-fixed-top" role="banner"> 
			<div class="container">
			
			<!-- 로그인/조인 부분 수정 --> 
				<%if(id==null){ %>
				<div style="float: right;;">				|
				<span><a href="./common_join.sn">Join</a> </span> 
				</div>
				<div style="float: right;;">
				<span><a href="./login.cl">Login &nbsp;</a></span>
				</div>
				<%}else{ %>
				<div style="float: right;;">				|
				<span><a href="./logOut.cl">Logout</a></span> 
				</div>
				<div style="float: right;;">
				<span><a href="#"><%=name %>&nbsp;</a> </span>				
				</div>
				<%} %>
			<!-- 로그인/조인 부분 수정 -->
			
				<div class="navbar-header"> 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> 
					</button> 
					<a class="navbar-brand" style="height: 70px !important;" href="Main.cl"><h1><img src="./himu/images/logo.png" alt="logo" style="padding-top: 12px;"></h1></a> 
				</div> 
				<div class="collapse navbar-collapse" style="height: 70px !important;">
					<ul class="nav navbar-nav navbar-right">
						<li class="scroll"><a href="./Main.cl">Home</a></li>
						<li class="scroll dropbtn"><a href="./ProductList.pr">GoodsList</a>
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
						%> 
						<li class="scroll"><a href="Service.cl">Our Service</a></li>
						<li class="scroll"><a href="./ProductDetail.pr?product_num=<%=product_num %>&pageNum=<%=pageNum%>">Detail</a></li> 
					
					<!-- vendor,client,sns mypage 구분 -->
						<%if(type !=null){
						if(type.equals("client")){ %>
						<li class="scroll"><a href="MyPage.cl">MyPage</a></li>
						<%}else if(type.equals("vendor")){ %>
						<li class="scroll"><a href="MyPage.ve">MyPage</a></li>
						<%}else if(type.equals("sns")){%>
						<li class="scroll"><a href="MyPage.sn">MyPage</a></li>
						<%}} %>
					<!-- vendor,client,sns mypage 구분 -->
					
						<li class="scroll"><a href="#">Contact</a></li>
						<li class="scroll"><a href="Price.cl">Price</a></li>
					</ul> 
				</div> 
			</div> 
		</div><!--/navbar--> 
	</header> <!--/#navigation--> 
