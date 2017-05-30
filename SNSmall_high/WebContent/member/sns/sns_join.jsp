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

<script type="text/javascript">
	var idDubClicked = false;
	var account_count = 0;
	var id_reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/;
	var pass_reg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{10,20}$/;
	var iamge_extend_count = false;

	//아이디 중복 확인                                           
	function idDupCheck() {
		if (document.fr.sns_id.value == "") {
			alert("아이디를 입력해 주세요!");
			document.fr.sns_id.focus();
		}

		if (document.fr.sns_id.value != "") {
			idDubClicked = true;
			var sns_id = document.fr.sns_id.value;
			var url = "./IdCheckAction.sn?sns_id=" + sns_id;
			window.open(url, 'idCheck', "height=400 width=400");
		}
	}

	function submitCheck() {

		//////아이디 체크
		if (document.fr.sns_id.value == "") {
			alert("아이디를 입력해 주세요!");
			document.fr.sns_id.focus();
			return false;
		} else if (!id_reg.test(document.fr.sns_id.value)) {
			alert("아이디는 영어,숫자조합 5-10자리로 구성해주세요");
			document.fr.sns_id.focus();
			return false;

		} else if (!idDubClicked) {
			alert("아이디 중복확인을 해주세요");
			return false;
		}

		//////비밀번호 유형 체크
		if (document.fr.pass.value == "") {
			alert("비밀번호를 입력해 주세요!");
			document.fr.pass.focus();
			return false;
		} else if (!pass_reg.test(document.fr.pass.value)) {
			alert("비밀번호는 영문, 숫자, 특수문자 조합 10-20자리로 구성해주세요.");
			document.fr.pass.focus();
			return false;
		}
		//////비밀번호 일치 체크
		if (document.fr.pass2.value == "") {
			alert("비밀번호를 확인해 주세요!");
			document.fr.pass2.focus();
			return false;
		}
		if (document.fr.pass.value != document.fr.pass2.value) {
			alert("비밀번호가 일치하지 않습니다!");
			document.fr.pass2.focus();
			return false;
		}

		//////이름 체크
		if (document.fr.name.value == "") {
			alert("이름을 입력해 주세요!");
			document.fr.name.focus();
			return false;
		}
		//////이미지 갯수체크
		if (iamge_extend_count == false) {
			alert("이미지를 8개 이하로 선택해주세요");
			return false;
		}
		//////서브이미지 체크
		if (document.fr.file_names.value == "") {
			alert("서브이미지를 선택해주세요");
			return false;
		}
		/////메인이미지 체크
		if (document.fr.file.value == "") {
			alert("메인이미지를 선택해주세요");
			return false;
		}
		/////자기소개 체크
		if (document.fr.content.value == "") {
			alert("자기소개를 입력해주세요");
			return false;
		}
		
		/////sns계정 체크
		
		account_count
		
		if(document.fr.instagram_ac.value != ""){
			account_count+=1;
		}
		if(document.fr.facebook_ac.value != ""){
			account_count+=1;
		}
		if(document.fr.twitter_ac.value != ""){
			account_count+=1;
		}
		if(document.fr.blog_ac.value != ""){
			account_count+=1;
		}
		if(document.fr.etc_ac.value != ""){
			account_count+=1;
		}
		
		if(account_count==0){
		alert("SNS계정을 1개이상 입력해주세요");
		return false;
		}
	}

	//비밀번호 일치 체크 디스플레이
	function passCheck() {
		if (document.fr.pass.value == document.fr.pass2.value) {
			document.getElementById("passdbCheckDisplay").innerHTML = "비밀번호가 일치합니다";
		} else {
			document.getElementById("passdbCheckDisplay").innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	}

	//비밀번호 유형 체크 디스플레이
	function passFormCheck() {
		var pwd = document.fr.pass.value;

		if (!pass_reg.test(pwd)) {
			document.getElementById("passCheckDisplay").innerHTML = "영문,숫자,특수문자 조합 10-20자리로 구성해주세요.";
		} else {
			document.getElementById("passCheckDisplay").innerHTML = "OK!";

		}
	}

	//아이디 유형 체크 디스플레이
	function idCheck() {
		var id = document.fr.sns_id.value;
		if (!id_reg.test(id)) {
			document.getElementById("idCheckDisplay").innerHTML = "영어,숫자조합 5-10자리로 구성해주세요";

		} else {
			document.getElementById("idCheckDisplay").innerHTML = "OK!";
		}

	}
	
	

	//프로필메인이미지 미리보기 구현
	var InputImage = (function loadImageFile() {
		if (window.FileReader) {
			var ImagePre;
			var ImgReader = new window.FileReader();
			var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

			ImgReader.onload = function(Event) {

				if (!ImagePre) {
					var newPreview = document.getElementById("imagePreview");
					ImagePre = new Image();
					ImagePre.style.width = "200px";
					ImagePre.style.height = "140px";
					newPreview.appendChild(ImagePre);
				}
				ImagePre.src = Event.target.result;

			};

			return function() {

				var img = document.getElementById("image").files;

				if (!fileType.test(img[0].type)) {
					alert("이미지 파일을 업로드 하세요");
					return;
				}
				if (pre_img.style.display == 'block') {
					pre_img.style.display = 'none';
				}
				ImgReader.readAsDataURL(img[0]);
			}

		}

		document.getElementById("imagePreview").src = document
				.getElementById("image").value;

	})();

	//다중 파일 업로드 
	var selDiv = "";
	document.addEventListener("DOMContentLoaded", init, false);
	function init() {
		document.querySelector('#files').addEventListener('change',
				handleFileSelect, false);
		selDiv = document.querySelector("#selectedFiles");
	}
	function handleFileSelect(e) {

		var file_names = "";
		if (!e.target.files)
			return;
		selDiv.innerHTML = "";
		var files = e.target.files;

		if (files.length >= 9) {
			iamge_extend_count = false;
			alert("이미지는 8개까지만 선택가능합니다.");
			selDiv.innerHTML = "8개 이하로 이미지를 업로드 해주세요."

		} else {
			for (var i = 0; i < files.length; i++) {
				var f = files[i];
				//selDiv.innerHTML += f.name + "<br/>";
				if (i == files.length - 1)
					file_names += f.name;
				else
					file_names += f.name + ",";

			}
			selDiv.innerHTML += file_names + "<br/>";
			document.fr.file_names.value = file_names;
			iamge_extend_count = true;
		}
	}

	
	//체크박스 디스플레이
	function snschecked(){
		
		if(document.fr.ckb1.checked==true){
			dp_insta.style.display='block';
 		}else if(document.fr.ckb1.checked==false){
 			dp_insta.style.display='none';
 			document.fr.instagram_ac.value="";
 		}
		if(document.fr.ckb2.checked==true){
			dp_face.style.display='block';
		}else if(document.fr.ckb2.checked==false){
			dp_face.style.display='none';
			document.fr.facebook_ac.value="";
		}
		if(document.fr.ckb3.checked==true){
			dp_twit.style.display='block';
		}else if(document.fr.ckb3.checked==false){
			dp_twit.style.display='none';
			document.fr.twitter_ac.value="";
		}
		if(document.fr.ckb4.checked==true){
			dp_blog.style.display='block';
		}else if(document.fr.ckb4.checked==false){
			dp_blog.style.display='none';
			document.fr.blog_ac.value="";
		}
		if(document.fr.ckb5.checked==true){
			dp_etc.style.display='block';
		}else if(document.fr.ckb5.checked==false){
			dp_etc.style.display='none';
			document.fr.etc_ac.value="";
		}
	}
	
	//sns계정 체크
	
	
</script>
</head>
<body>

	<jsp:include page="../../inc/header.jsp" />

	<div class="container">
		<div class="content">
			<div class="col-md-2"></div>
				 <div class="col-md-8">
				<div class="join_subject">　SNS celeb Join Us</div>

				<form action="./SnsJoinAction.sn" id="join" name="fr" method="post"
					onsubmit="return submitCheck()" enctype="multipart/form-data">
					<input type="hidden" name="type" value="client"> <input
						type="hidden" name="idDubOk">
					<fieldset>
						<legend class="join-mini-subject">　Basic Info</legend>
						<table class="join_table" style="margin-left: 20px;">
							<tr>
								<td><label>User ID</label></td>
								<td><input type="text" name="sns_id" class="sns_id"
									onkeyup="idCheck()"> <input type="button"
									value="dup. check" class="dup" onclick="idDupCheck()"></td>
								<td><span id="idCheckDisplay"></span></td>
							</tr>
							<tr>
								<td><label>Password</label></td>
								<td><input type="password" name="pass"
									onkeyup="passFormCheck()"></td>
								<td><span id="passCheckDisplay"></span></td>
							</tr>
							<tr>
								<td><label>Retype Password &nbsp; </label></td>
								<td><input type="password" name="pass2"
									onkeyup="passCheck()"></td>
								<td><span id="passdbCheckDisplay"></span></td>
							</tr>
							<tr>
								<td><label>Name</label></td>
								<td><input type="text" name="name"></td>
							<tr>
								<td><label for="mySelect">category</label></td>
								<td><div class="form-group">
										<select id="mySelect" name="myselect" class="form-control"
											style="width: 160px;">
											<option>fashion</option>
											<option>beauty</option>
											<option>baby</option>
											<option>daily</option>
											<option>gym</option>
											<option>etc</option>
										</select>
									</div></td>
								<td></td>
							</tr>
						</table>
					</fieldset>
					
					<legend class="join-mini-subject">
					<lable>　SNS Account</lable>
					<span style="font-size: 7px;"> (SNS계정은 최소 1개이상 기입하세요.)</span>
					</legend>
					<div style="margin-left: 20px">
						<table class="Snsaccount" >
							<tr>
								<td> Instagram <input type="checkbox" name="ckb1" id="ckb1" onchange="snschecked()"> </td>
								<td> facebook <input type="checkbox" name="ckb2" id="ckb2" onchange="snschecked()"></td>
								<td> twitter <input type="checkbox" name="ckb3" id="ckb3" onchange="snschecked()"></td>
								<td> blog <input type="checkbox" name="ckb4" id="ckb4" onchange="snschecked()"></td>
								<td> etc <input type="checkbox" name="ckb5" id="ckb5" onchange="snschecked()"></td>
							</tr>
						</table>
					
							<div id="dp_insta" style="display: none; margin: 10px;">
								<span style="padding-right: 10px;">Instagram</span>
								<input type="text" name="instagram_ac" size=40>
							</div>
							
							<div id="dp_face" style="display: none;  margin: 10px;">
								<span style="padding-right: 15px;">facebook</span> 
								<input type="text" name="facebook_ac" size=40> 
							</div>
						
							<div id="dp_twit" style="display: none; margin: 10px;">
								 <span style="padding-right: 34px;">twitter</span>
								 <input type="text" name="twitter_ac" size=40> 
							</div>
							
							<div id="dp_blog" style="display: none; margin: 10px;">
								<span style="padding-right: 46px;">blog</span>
								<input type="text" name="blog_ac" size=40>
							</div>
							
							<div id="dp_etc" style="display: none; margin: 10px;">
								<span style="padding-right: 54px;">etc</span>
								<input type="text" name="etc_ac" size=40> 
							</div>
						</div>
					<legend  class="join-mini-subject" style="margin-top: 10px;">
						　Profile Image
					</legend>
					<div id="imagePreview" style="margin-left: 20px">
						<img alt="이미지를등록하세요" src="./member/sns/sns_image/default_img.JPG" id="pre_img" style="display: block; width: 200px; height: 140px;">
					</div>
					<input type="file" name="file" id="image" onchange="InputImage()" style="margin-left: 20px"><br>
					<legend  class="join-mini-subject">
						<lable>　Sub Image</lable>
						<span style="font-size: 7px;"> (이미지는 최대 8개까지 업로드하세요.)</span>
					</legend>
					<input type="hidden" name="file_names" id="file_names" value="">
					<input type="file" id="files" name="files" multiple><br>
					　　Selected file
					<div id="selectedFiles"></div>
					<br>
					<!-- <input type="button" value="체크" onclick="check()"> -->
					<legend></legend>
					<div style="margin-left: 20px">
					<label>　Introduce</label><br>
					<textarea rows="3" cols="80" name="content"></textarea>
					</div>
					<br>

					<!-- <label>Phone Number</label> -->
					<!-- <input type="text" name="phone" id="phone"><br> -->


							<div class="clear"></div>
						<hr>
							<div class="col-md-1"></div>
							<div class="col-md-5"><input type="submit" value="Join" class="join-btn"> </div>
							<div class="col-md-5"><input type="button" value="Cancel" class="join-btn" onclick="history.back()"> </div>
							<div class="col-md-1"></div>
					</form>
				</div>
				
				
			</div>
			
		</div>

<jsp:include page="../../inc/footer.jsp"/>
	

</body>
</html>