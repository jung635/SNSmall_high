<%@page import="web.sns.db.SnsBean"%>
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
<title>Insert title here</title>
<script src="./js/jquery.js"></script>
<script type="text/javascript">
	var iamge_extend_count = false;
	var id_reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/;
	var pass_reg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{10,20}$/;

	//submit제어
	function submitCheck() {
		if (document.fr.name.value == "") {
			alert("이름을 입력해 주세요!");
			document.fr.name.focus();
			return false;
		}
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
					if (ProimagePreview.style.display == 'block') {
						ProimagePreview.style.display = 'none';
					}
				}
				ImagePre.src = Event.target.result;

			};

			return function() {

				var img = document.getElementById("image").files;

				if (!fileType.test(img[0].type)) {
					alert("이미지 파일을 업로드 하세요");
					return;
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
		selDiv = document.querySelector("#selected_img");
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
			selDiv.innerHTML += file_names;
			document.fr.file_names.value = file_names;
			iamge_extend_count = true;
		}
	}
	//비밀번호변경
	$(document).ready(function() {
		$('#passChange').click(function() {
			$(this).next().toggle('slow', function() {
			});
		});
	});
	
	function passCheck(){
	//////비밀번호 유형 체크
		if (document.pr.newpass.value == "") {
			alert("비밀번호를 입력해 주세요!");
			document.pr.newpass.focus();
			return false;
		} else if (!pass_reg.test(document.pr.newpass.value)) {
			alert("비밀번호는 영문, 숫자, 특수문자 조합 10-20자리로 구성해주세요.");
			document.pr.newpass.focus();
			return false;
		}
		//////비밀번호 일치 체크
		if (document.pr.newpass2.value == "") {
			alert("비밀번호를 확인해 주세요!");
			document.pr.newpass2.focus();
			return false;
		}
		if (document.pr.newpass.value != document.pr.newpass2.value) {
			alert("비밀번호가 일치하지 않습니다!");
			document.pr.pass2.focus();
			return false;
		}
	}
	
	//비밀번호 일치 체크 디스플레이
	function passCheck() {
		if (document.pr.newpass.value == document.pr.newpass2.value) {
			document.getElementById("passdbCheckDisplay").innerHTML = "비밀번호가 일치합니다";
		} else {
			document.getElementById("passdbCheckDisplay").innerHTML = "비밀번호가 일치하지 않습니다.";
		}
		
		
	}

	//비밀번호 유형 체크 디스플레이
	function passFormCheck() {
		var pwd = document.pr.newpass.value;

		if (!pass_reg.test(pwd)) {
			document.getElementById("passCheckDisplay").innerHTML = "비밀번호는 영문, 숫자, 특수문자 조합 10-20자리로 구성해주세요.";
		} else {
			document.getElementById("passCheckDisplay").innerHTML = "OK!";

		}
	}
	
	//체크박스 디스플레이
	function snschecked(){
		
		if(document.fr.ckb1.checked==true){
			dp_insta.style.display='block';
 		}else if(document.fr.ckb1.checked==false){
 			dp_insta.style.display='none';
 			document.fr.instagram_ac.value="";
 			document.fr.instagram_ac2.value="";
 		}
	}
	
function snschecked2(){
	if(document.fr.ckb2.checked==true){
		dp_face.style.display='block';
	}else if(document.fr.ckb2.checked==false){
		dp_face.style.display='none';
		document.fr.facebook_ac.value="";
		document.fr.facebook_ac2.value="";
	}
}
	
function snschecked3(){
	if(document.fr.ckb3.checked==true){
		dp_twit.style.display='block';
	}else if(document.fr.ckb3.checked==false){
		dp_twit.style.display='none';
		document.fr.twitter_ac.value="";
		document.fr.twitter_ac2.value="";
	}
}
	
function snschecked4(){
	if(document.fr.ckb4.checked==true){
		dp_blog.style.display='block';
	}else if(document.fr.ckb4.checked==false){
		dp_blog.style.display='none';
		document.fr.blog_ac.value="";
		document.fr.blog_ac2.value="";
	}
}
	
function snschecked5(){
	if(document.fr.ckb5.checked==true){
		dp_etc.style.display='block';
	}else if(document.fr.ckb5.checked==false){
		dp_etc.style.display='none';
		document.fr.etc_ac.value="";
		document.fr.etc_ac2.value="";
	}
	}
	
</script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		//String type= (String)session.getAttribute("type");
		if (id == null) {
			response.sendRedirect("./Login.ve");
		}
		SnsBean sb = (SnsBean) request.getAttribute("sb");
		
		//서브이미지 분해
		String[] array;
		String s = sb.getDetail_img();
		array = s.split(",");
		String image1 = array[0];
	%>
	<jsp:include page="../../inc/header.jsp" />

	<div class="container">
		<div class="content">
			<div class="more_content">
				<div class="col-md-3">
					<jsp:include page="../../inc/myinfo_sns_left.jsp" />
				</div>
				<div class="col-md-9">
				
				<h3>회원정보 수정</h3>
					<legend>Basic info</legend>
					<label>ID</label>
					<%=id%><br>
					<label>Password</label> <input type="button" id="passChange" value="비밀번호 변경">
					<div style="display: none;">
						<form action="./passChangeAction.sn"  name="pr" onsubmit="return passCheck()">
							new password &nbsp;&nbsp;
							<input type="password" name="newpass" id="newpass" onkeyup="passFormCheck()">
							<span id="passCheckDisplay"></span><br>
							retype password<input type="password" name="newpass2" onkeyup="passCheck()">
							<span id="passdbCheckDisplay"></span><br>
							<input type="submit" value="변경">
						</form>
					</div>


					<form action="./SnsUpdateAction.sn" method="post" name="fr"
						onsubmit="return submitCheck()" enctype="multipart/form-data">
						<table>



							<tr>
								<td><label>name</label></td>
								<td colspan="3"><input type="text" name="name"
									value="<%=sb.getName()%>"></td>
							</tr>
							<tr>
								<td><label>category</label></td>
								<td>
									<div class="form-group">
										<select id="mySelect" name="myselect" class="form-control">
											<option <%if (sb.getCategory().equals("fashion")) {%> selected
												<%}%>>fashion</option>
											<option <%if (sb.getCategory().equals("beauty")) {%> selected
												<%}%>>beauty</option>
											<option <%if (sb.getCategory().equals("baby")) {%> selected
												<%}%>>baby</option>
											<option <%if (sb.getCategory().equals("daily")) {%> selected
												<%}%>>daily</option>
											<option <%if (sb.getCategory().equals("gym")) {%> selected
												<%}%>>gym</option>
											<option <%if (sb.getCategory().equals("etc")) {%> selected
												<%}%>>etc</option>
										</select>
									</div>
								</td>
								<td colspan="2"></td>
							</tr>
						</table>
						
						<legend>SNS Acount</legend>
						
						<table class="Snsaccount">
							<tr>
								<td> Instagram <input type="checkbox" name="ckb1" id="ckb1" onchange="snschecked()" <%if(!(sb.getInstagram().equals(""))){%>checked<%}%>> </td>
								<td> facebook <input type="checkbox" name="ckb2" id="ckb2" onchange="snschecked2()" <%if(!(sb.getFacebook().equals(""))){%>checked<%}%>></td>
								<td> twitter <input type="checkbox" name="ckb3" id="ckb3" onchange="snschecked3()" <%if(!(sb.getTwitter().equals(""))){%>checked<%}%>></td>
								<td> blog <input type="checkbox" name="ckb4" id="ckb4" onchange="snschecked4()" <%if(!(sb.getBlog().equals(""))){%>checked<%}%>></td>
								<td> etc <input type="checkbox" name="ckb5" id="ckb5" onchange="snschecked5()" <%if(!(sb.getEtc().equals(""))){%>checked<%}%>></td>
							</tr>
						</table>
						
						 <%if(sb.getInstagram().equals("")){%>
						<div id="dp_insta" style="display: none; margin: 10px;">
								<span style="padding-right: 10px;">Instagram</span>
								<input type="text" name="instagram_ac" size=40>
							</div>
						<%}else{ %>
						<div id="dp_insta" style=" margin: 10px;">
								<span style="padding-right: 10px;">Instagram</span>
								<input type="text" name="instagram_ac" size=40 value="<%=sb.getInstagram()%>">
							</div>
						<%} %>
						<%if(sb.getFacebook().equals("")){%>
							<div id="dp_face" style="display: none; margin: 10px;">
								<span style="padding-right: 15px;">facebook</span> 
								<input type="text" name="facebook_ac" size=40> 
							</div>
						<%}else{ %>
						<div id="dp_face" style="margin: 10px;">
								<span style="padding-right: 15px;">facebook</span> 
								<input type="text" name="facebook_ac" size=40 value="<%=sb.getFacebook()%>"> 
							</div>
						<%} %>
						
						<%if(sb.getTwitter().equals("")){%>
							<div id="dp_twit" style="display: none; margin: 10px;">
								 <span style="padding-right: 34px;">twitter</span>
								 <input type="text" name="twitter_ac" size=40> 
							</div>
						<%}else{ %>
						<div id="dp_twit" style="margin: 10px;">
								 <span style="padding-right: 34px;">twitter</span>
								 <input type="text" name="twitter_ac" size=40 value="<%=sb.getTwitter()%>"> 
							</div>
						<%} %>
						
						<%if(sb.getBlog().equals("")){%>	
							<div id="dp_blog" style="display: none; margin: 10px;">
								<span style="padding-right: 46px;">blog</span>
								<input type="text" name="blog_ac" size=40>
							</div>
						<%}else{ %>
							<div id="dp_blog" style="margin: 10px;">
								<span style="padding-right: 46px;">blog</span>
								<input type="text" name="blog_ac" size=40 value="<%=sb.getBlog()%>">
							</div>
						<%} %>	
						
						<%if(sb.getEtc().equals("")){%>	
							<div id="dp_etc" style="display: none; margin: 10px;">
								<span style="padding-right: 54px;">etc</span>
								<input type="text" name="etc_ac" size=40> 
							</div>
						<%}else{ %>
							<div id="dp_etc" style="margin: 10px;">
								<span style="padding-right: 54px;">etc</span>
								<input type="text" name="etc_ac" size=40 value="<%=sb.getEtc()%>"> 
							</div>
						<%} %>
						<legend>Profile Image</legend>


						<div id="ProimagePreview" style="display: block;">
							<img src="./sns_pro_upload/<%=sb.getProfile_img()%>"
								style="width: 200px; height: 140px;">
						</div>
						<div id="imagePreview"></div>

						<input type="hidden" name="one_file"
							value="<%=sb.getProfile_img()%>"> <input type="file"
							name="file" id="image" onchange="InputImage()"
							style="width: 80px;">


						<legend>Sub Image</legend>

						<input type="hidden" name="orgin_file_names" id="orgin_file_names"
							value="<%=sb.getDetail_img()%>"> <input type="hidden"
							name="file_names" id="file_names" value=""> <input
							type="file" id="files" name="files" multiple
							onchange="InputImages()">
						<div id="selectedFiles"></div>

						selected Image<br>

						<textarea rows="2" cols="80" name="selected_img" id="selected_img"
							readonly="readonly"><%=sb.getDetail_img()%></textarea>




						<legend>introduce</legend>

						<textarea rows="3" cols="80" name="content"><%=sb.getContent()%></textarea>

						<hr>

						<input type="submit" value="글수정">
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>