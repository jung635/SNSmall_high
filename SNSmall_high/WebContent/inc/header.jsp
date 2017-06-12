<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/font-awesome.min.css" rel="stylesheet"> 
<header id="navigation">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    alarm_view(); 
    alarm_access(); 
    $("#alarm_btn").click(function(){
        $("#alarm_list").toggle();
    });
});
function openLiveWin(){
	//window.open("LiveList.li", "live_list")
	window.open("LiveList.li", "live_list" , "height=830 ,width=1500,top=0,left=0")
}
function openVodWin(){
	//window.open("VodList.li", "live_list")
	window.open("VodList.li", "live_list" , "height=830 ,width=1500,top=0,left=0")
}
</script>
<%	
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String type = (String) session.getAttribute("type");
%> 
<script type="text/javascript" src="inc/alarm.js"></script> 
		<div class="navbar navbar-inverse navbar-fixed-top" role="banner"> 
			<div class="container">
			<div style="position: relative;">
			
			<!-- 로그인/조인 부분 수정 --> 
				<%if(id==null){ %>
				<div style="float: right;">				|
					<span><a href="./common_join.sn">Join</a> </span> 
				</div>
				<div style="float: right;">
					<span><a href="./login.cl">Login &nbsp;</a></span>
				</div>
				<%}else{ %>
				<div id="alarm_box" style="float: right;">		
					<div id="alarm_btn"><i class="fa fa-bell" aria-hidden="true"></i></div> 
					<div id="alarm_count" style="display: none;"></div>
					<div id="alarm_list">
					</div>
					<div id="alert_box">
					</div>
				</div>
				<div style="float: right;">				|
					<span><a href="./logOut.cl">Logout</a></span> 
				</div>
				<div style="float: right;">
					<span><a href="#"><%=name %>&nbsp;</a> </span>				
				</div>
				<%} %>
				</div>
			<!-- 로그인/조인 부분 수정 -->
			
				<div class="navbar-header"> 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> 
					</button> 
					<a class="navbar-brand" style="height: 70px !important;" href="Main.cl"><h1><img src="./images/logo2.gif" alt="logo" style="padding-top: 12px;"></h1></a> 
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
						<li class="scroll"><a href="Service.cl">Our Service</a></li>
					
					<!-- vendor,client,sns mypage 구분 -->
						<%if(type !=null){
						if(type.equals("client")){ %>
						<li class="scroll"><a href="MyPage.cl">MyPage</a></li>
						<%}else if(type.equals("vendor")){ %>
						<li class="scroll"><a href="MyPage.ve">MyPage</a></li>
						<%}else if(type.equals("sns")){%>
						<li class="scroll"><a href="MyPage.sn">MyPage</a></li>
						<%} %>
					<!-- vendor,client,sns mypage 구분 -->
						<%if(type.equals("vendor") || type.equals("sns")){ %>
						<li class="scroll"><a href="BoardList.bo">Contact</a></li>
						<%}} %>
						<li class="scroll"><a href="Price.cl">Price</a></li>
					</ul> 
				</div> 
				<div style="float: right;">
					<button onclick='openLiveWin()' class="main-live-btn">
					<i class="fa fa-play" aria-hidden="true"></i>
					LIVE
					</button>
					<button onclick='openVodWin()' class="main-live-btn">
					<i class="fa fa-video-camera" aria-hidden="true"></i>
					Popular VOD
					</button>
				</div>
			</div> 
		</div><!--/navbar--> 
	</header> <!--/#navigation--> 
