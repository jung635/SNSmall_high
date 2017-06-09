<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Creative One Page Parallax Template">
<meta name="keywords"
	content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" />
<meta name="author" content="">
<title>HIMU - OnePage HTML Parallax template</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/inner.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link href="./css/member.css" rel="stylesheet">  

<script src='https://www.google.com/recaptcha/api.js'></script>
<!-- <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
/*  var onloadCallback = function(){
	greCAPTCHA.render('html_element',{
		'sitekey' : '6Lf_KyQUAAAAAB40DEHrPNa5X9ScueVN-a__pwYl',
		'theme' : 'light'
	}); 
 }; */
 
 var authMailClicked=false;
 var authCheckChecked=false;
 var authNumCheck=false;
 var idDubClicked=false;
 var id_reg=  /^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/;
//  var pass_reg =/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{10,20}$/;
var pass_reg =/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{8,20}$/;
 var authnum =(Math.floor)(Math.random()*1000000);

 //이메일 전송
 function sendmail(){
	 authMailClicked=true;
	 if(document.fr.email.value==""){
			alert("이메일을 입력하세요");
			document.fr.email.focus();
			return;
		}
	 var email = document.fr.email.value;
	 window.open("./mailAction.cl?email="+email+"&authNum="+authnum,"","height=400 width=400");
}

 //이메일 인증 체크
 function authCheck(){
 	authCheckChecked=true;
	authInputNum = document.fr.authInputNum.value;
 	if(authInputNum==authnum){
		alert('인증성공!');
		authNumCheck=true;
	}else{
		alert('인증실패!'); 
		authNumCheck=false;

	}  	
}

 //아이디 중복 확인
 function idDupCheck(){
	 if(document.fr.id.value==""){
			alert("id를 입력하세요");
			document.fr.id.focus();
			return;
		}
		fid=document.fr.id.value;
	 window.open("./dupIdCheck.cl?userid="+fid,"","height=400 width=400");
 }

 
 function submitCheck(){
	 

 	//////아이디 체크
 	if(document.fr.id.value==""){
 		alert("아이디를 입력해 주세요!");
 		document.fr.id.focus();
 		return false;
 	}else if(!id_reg.test(document.fr.id.value)){
		alert("아이디는 영어,숫자조합 5-10자리로 구성해주세요");
		document.fr.id.focus();
		return false;
	}
 	
 	//////비밀번호 유형 체크
 	if(document.fr.pass.value==""){
 		alert("비밀번호를 입력해 주세요!");
 		document.fr.pass.focus();
 		return false;
 	}else if(!pass_reg.test(document.fr.pass.value)){
 		alert("비밀번호는 영문자, 숫자, 특수문자 조합 8-20자리로 구성해주세요.");
 		document.fr.pass.focus();
 		return false;
 	}
	//////비밀번호 일치 체크
 	if(document.fr.pass2.value==""){
 		alert("비밀번호를 확인해 주세요!");
 		document.fr.pass2.focus();
 		return false;
 	}if(document.fr.pass.value!=document.fr.pass2.value){
 		alert("비밀번호가 일치하지 않습니다!");
 		document.fr.pass2.focus();
 		return false;
 	}
 	
	//////이름 체크
 	if(document.fr.name.value==""){
 		alert("이름을 입력해 주세요!");
 		document.fr.name.focus();
 		return false;
 	}
	//////우편번호 체크
 	if(document.fr.postcode.value==""){
 		alert("우편번호을 입력해 주세요!");
 		document.fr.postcode.focus();
 		return false;
 	}
 	
	//////주소 체크
 	if(document.fr.address.value==""){
 		alert("주소을 입력해 주세요!");
 		document.fr.address.focus();
 		return false;
 	}
	
	//////상세주소 체크
 	if(document.fr.address2.value==""){
 		alert("상세주소을 입력해 주세요!");
 		document.fr.address2.focus();
 		return false;
 	}
 	
 	//////이름 체크
 	if(document.fr.name.value==""){
 		alert("이름을 입력해 주세요!");
 		document.fr.name.focus();
 		return false;
 	}
	//////연락처 체크
 	if(document.fr.phone.value==""){
 		alert("연락처을 입력해 주세요!");
 		document.fr.phone.focus();
 		return false;
 	}
 	//////이메일 체크
 	if(document.fr.email.value==""){
 		alert("이메일을 입력해 주세요!");
 		document.fr.name.focus();
 		return false;
 	}else if(!authMailClicked){
		alert("메일 인증을 해주세요");
		return false;
 	}else if(document.fr.authInputNum.value==""){
 		document.fr.authInputNum.focus();
		alert("메일 인증번호를 입력해주세요");
		return false;
 	}else if(!authCheckChecked){
		alert("인증번호를 확인해주세요");
		return false;
	}else if(!authNumCheck){
		document.fr.authInputNum.focus();
		alert("인증번호가 맞지 않습니다.");
		return false;
	}/* else if(typeof(greCAPTCHA) != 'undefined'){
		if(greCAPTCHA.getResponse()==""){
			alert("스팸방지코드를 확인해 주세요.");
			return false;
		}
	} */
 }

//비밀번호 일치 체크 디스플레이
 function passCheck(){
 	if(document.fr.pass.value==document.fr.pass2.value){
 		document.getElementById("passdbCheckDisplay").innerHTML="비밀번호가 일치합니다";
 	}else{
 		document.getElementById("passdbCheckDisplay").innerHTML="비밀번호가 일치하지 않습니다.";	
 }	
 }

//비밀번호 유형 체크 디스플레이
 function passFormCheck(){
 	var pwd=document.fr.pass.value;
 	
 	if(!pass_reg.test(pwd)){
 		document.getElementById("passCheckDisplay").innerHTML="영문자, 숫자, 특수문자 조합 10-20자리로 구성해주세요.";	
 	}else{
 		document.getElementById("passCheckDisplay").innerHTML="OK!";	
 		
 	}
 }

//아이디 유형 체크 디스플레이
 function idCheck(){
 	var id=document.fr.id.value;
 		if(!id_reg.test(id)){
 			document.getElementById("idCheckDisplay").innerHTML="아이디는 영어,숫자조합 5-10자리로 구성해주세요";

 		}else{
 			document.getElementById("idCheckDisplay").innerHTML="OK!";
 		}
 	
 }
 
//우편번호 검색
 function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('address').value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
             document.getElementById('phone').focus();
         }
     }).open();
 }
 </script>
</head>
<body>

	<jsp:include page="../../inc/header.jsp" />

	<div class="container">
		<div class="content">
			<div class="col-md-2"></div>
				 <div class="col-md-8">
				<div class="join_subject">　Client Join Us</div>

				<form action="./clientJoinAction.cl" id="join" name="fr"
					onsubmit="return submitCheck()">
					<input type="hidden" name="type" value="client"> <input
						type="hidden" name="idDubOk">

					<fieldset>
						<legend class="join-mini-subject">　Basic Info</legend>
						<table class="join_table" style="margin-left: 20px;">
							<tr>
								<td><label>User ID</label></td>
								<td><input type="text" name="id" class="id"
									onkeyup="idCheck()"> <input type="button" value="dup. check"
									class="dup" onclick="idDupCheck()"></td>
								<td><span id="idCheckDisplay"></span></td>
							</tr>
							<tr>
								<td><label>Password</label></td>
								<td><input type="password" name="pass"
									onkeyup="passFormCheck()"></td>
								<td><span id="passCheckDisplay"></span></td>
							</tr>
							<tr>
								<td><label>Retype Password</label></td>
								<td><input type="password" name="pass2"
									onkeyup="passCheck()"></td>
								<td><span id="passdbCheckDisplay"></span></td>
							</tr>
							<tr><td colspan="2"></td></tr>
							<tr>
								<td><label>Name</label></td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td><label>Phone</label></td>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<td><label>Email</label></td>
								<td><input type="email" name="email"> <input type="button" value="인증메일 발송" class="dup2" onclick="sendmail()"></td>
							</tr>
							<tr>
								<td><label></label></td>
								<td><input type="text" name="authInputNum"> <input
									type="button" value="인증확인" class="dup2" onclick="authCheck()"></td>
							</tr>
							<tr>
								<td><label>Address</label></td>
								<td><input type="text" name="postcode" id="postcode"
									placeholder="우편번호"> <input type="button"
									onclick="sample6_execDaumPostcode()"  value="우편번호 찾기" class="dup2"></td>
							</tr>
							<tr>
								<td><label></label></td>
								<td><input type="text" name="address" id="address"
									placeholder="주소"></td>
							</tr>
							<tr>
								<td><label></label></td>
								<td><input type="text" name="address2" id="address2"
									placeholder="상세주소"></td>
							</tr>
						</table>
								</fieldset>
<!-- 								<div class="g-recaptcha" data-sitekey="6Lf_KyQUAAAAAB40DEHrPNa5X9ScueVN-a__pwYl"></div> -->
								<div class="clear"></div>
						<hr>
							<div class="col-md-1"></div>
							<div class="col-md-5"><input type="submit" value="Join" class="join-btn"> </div>
							<div class="col-md-5"><input type="button" value="Cancel" class="join-btn" onclick="history.back()"> </div>
							<div class="col-md-1"></div>
								</form>
								</div>
								</div>
								</div></body>
</html>