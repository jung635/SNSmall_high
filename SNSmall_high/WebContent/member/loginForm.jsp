<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head> 
	<meta charset="UTF-8"> 
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
	<link href="./css/member.css" rel="stylesheet"> 
	<!--[if lt IE 9]> <script src="js/html5shiv.js"></script> 
	<script src="js/respond.min.js"></script> <![endif]--> 
	<link rel="shortcut icon" href="images/ico/favicon.png"> 
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png"> 
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png"> 
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png"> 
	<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
	
	<script type="text/javascript">
	
	//Id,pass제어 
	function confirmSubmit() {
	if(document.fr.id.value == "") {
		alert("ID를 입력하세요");
		document.fr.id.focus();
		if(err_empty_id.style.display == 'none'){
			err_empty_id.style.display = 'block'
			err_empty_pw.style.display = 'none'}
		return false;
	}else if(document.fr.pass.value == ""){
		alert("Password를 입력하세요");
		document.fr.pass.focus();
		if(err_empty_pw.style.display == 'none'){
			err_empty_pw.style.display = 'block'
			err_empty_id.style.display = 'none'}
		return false;
	}
	
}

	</script>
	
</head><!--/head-->
<body>
<%
String returnUrl = request.getParameter("returnUrl");
if(returnUrl==null){returnUrl = request.getHeader("referer");}
System.out.println(returnUrl);
%>
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
	</div>
<jsp:include page="../inc/header.jsp"/>

<section id="about-us">
	<div class="container">
		<div class="text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
			
				 <div class="login_subject">comming soon Logo</div> 
		
				<form action="./loginAction.cl" id="join" name="fr" onsubmit="return confirmSubmit()">
					<input type="hidden" name="returnUrl" value="<%=returnUrl%>">
					<fieldset class="login_form">
					
					<div class="input_row" id="id_area">
						<span class="input_box1">
							<label for="id" id="label_id_area" class="lbl"   >아이디</label>
							<input type="text" id="id" name="id" tabindex="7" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
						</span>
<!-- 						<button type="button" disabled="" title="delete" id="id_clear" class="wrg">삭제</button> -->
					</div>
					<div  id="err_empty_id" class="error" style="display:none; ">아이디를 입력해주세요.</div>
					<div class="input_row" id="pw_area">
						<span class="input_box">
							<label for="pw" id="label_pw_area"  class="lbl">비밀번호</label>
							<input type="password" id="pass" name="pass" tabindex="8" placeholder="비밀번호" class="int" maxlength="16">
						</span>
			
<!-- 						<button type="button" disabled="" title="delete" id="pw_clear" class="wrg">삭제</button> -->
						<div class="ly_v2" id="err_capslock" style="display:none;">
							<div class="ly_box">
								<p><strong>Caps Lock</strong>이 켜져 있습니다.</p>							</div>
							<span class="sp ly_point"></span>
						</div>
					</div>
					<div class="error" id="err_empty_pw" style="display:none;">비밀번호를 입력해주세요.</div>
					<input type="submit" title="로그인" alt="로그인" tabindex="12" value="로그인" class="btn_global" onclick="nclks('log.login',this,event)">
					
				</fieldset>

					<legend class="blind"></legend>
					
					<div class="sub_member">
					<a href="#" >회원가입</a>&nbsp;|
					<a href="#">아이디 찾기</a>&nbsp;|
					<a href="#">비밀번호 찾기</a>
					</div>
					
					<div class="clear"></div>
				</form>
			</div>
			
			<div class="col-sm-3"></div>
		</div>
	</div>
	</section><!--/#about-us-->

	<footer id="footer"> 
	
		<div class="container"> 
			<div class="text-center"> 
				<p>Copyright &copy; 2017 - <a href="http://mostafiz.me/">Mostafiz</a> | All Rights Reserved</p> 
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