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
	if(document.fr.name.value == "") {
		alert("이름을 입력하세요");
		document.fr.name.focus();
		if(err_empty_name.style.display == 'none'){
			err_empty_name.style.display = 'block'
			err_empty_phone.style.display = 'none'
			err_empty_email.style.display = 'none'}
		return false;
	}else if(document.fr.phone.value == ""){
		alert("연락처를 입력하세요");
		document.fr.phone.focus();
		if(err_empty_phone.style.display == 'none'){
			err_empty_phone.style.display = 'block'
			err_empty_email.style.display = 'none'
			err_empty_name.style.display = 'none'}
		return false;
	}else if(document.fr.email.value == ""){
		alert("이메일을 입력하세요");
		document.fr.email.focus();
		if(err_empty_email.style.display == 'none'){
			err_empty_email.style.display = 'block'
			err_empty_phone.style.display = 'none'
			err_empty_name.style.display = 'none'}
		return false;
	}
	
}

	</script>
	
</head><!--/head-->
<body>

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
			
				 <div class="login_subject">ID 찾기 페이지</div> 
				<form action="SearchIdAction.cl" id="join" name="fr" onsubmit="return confirmSubmit()">
					<fieldset class="login_form">				
					
					<div class="input_row" id="name_area">
						<span class="input_box1">
							<label for="name" id="label_name_area" class="lbl"   >이름</label>
							<input type="text" id="name" name="name" tabindex="7" accesskey="L" placeholder="이름" class="int" maxlength="41" value="">
						</span>
<!-- 						<button type="button" disabled="" title="delete" id="id_clear" class="wrg">삭제</button> -->
					</div>
					<div  id="err_empty_name" class="error" style="display:none; ">이름을 입력해주세요.</div>
					
					<div class="input_row" id="phone_area">
						<span class="input_box">
							<label for="phone" id="label_phone_area"  class="lbl">연락처</label>
							<input type="text" id="phone" name="phone" tabindex="8" placeholder="연락처" class="int" maxlength="16">
						</span>
			
<!-- 						<button type="button" disabled="" title="delete" id="pw_clear" class="wrg">삭제</button> -->
<!-- 						<div class="ly_v2" id="err_capslock" style="display:none;"> -->
<!-- 							<div class="ly_box"> -->
<!-- 								<p><strong>Caps Lock</strong>이 켜져 있습니다.</p>							</div> -->
<!-- 							<span class="sp ly_point"></span> -->
<!-- 						</div> -->
					</div>
					<div class="error" id="err_empty_phone" style="display:none;">연락처를 입력해주세요.</div>
					
					<div class="input_row" id="email_area">
						<span class="input_box1">
							<label for="email" id="label_email_area" class="lbl"   >이메일</label>
							<input type="email" id="email" name="email" tabindex="7" accesskey="L" placeholder="이메일" class="int" maxlength="41" value="">
						</span>
<!-- 						<button type="button" disabled="" title="delete" id="id_clear" class="wrg">삭제</button> -->
					</div>
					<div  id="err_empty_email" class="error" style="display:none; ">이메일을 입력해주세요.</div>
					<input type="submit" title="아이디찾기" alt="아이디찾기" tabindex="12" value="아이디찾기" class="btn_global">									
				</fieldset>

					<legend class="blind"></legend>
					
					<div class="sub_member">
					<a href="./common_join.sn" >회원가입</a>&nbsp;|
					<a href="./login.cl" >로그인</a>&nbsp;|
					<a href="./SearchPass.cl">비밀번호 찾기</a><br>
					<a href="./SearchIdForSns.cl">SNS 아이디 찾기</a>
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