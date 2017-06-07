<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증정보 입력-다날 본인확인</title>
<link href="./css/member.css" rel="stylesheet"> 
<link href="./css/font-awesome.min.css" rel="stylesheet">
<script src="./js/jquery.js"></script>
<script type="text/javascript">

var authMailClicked=false;
var authCheckChecked=false;
var authNumCheck=false;
var authnum =(Math.floor)(Math.random()*1000000);

function sendmail(){
	 authMailClicked=true;
	 if(document.ph_fr.email.value==""){
			alert("이메일을 입력하세요");
			document.ph_fr.email.focus();
			return;
		}
	 var email = document.ph_fr.email.value;
	 window.open("./mailAction.cl?email="+email+"&authNum="+authnum,"","height=400 width=400");
}

$(document).ready(function(){
	$('#woman').click(function(event){ 
		$(this).css({"backgroundColor":"#999","color":"#fff"});
		$('#man').css({"backgroundColor":"#fff","color":"#43484E"});
		$('#gender').val("여");
	});
	
	$('#man').click(function(event){ 
		$(this).css({"backgroundColor":"#999","color":"#fff"});
		$('#woman').css({"backgroundColor":"#fff","color":"#43484E"});
		$('#gender').val("남");
	});
	
	$('input:text[name=birth]').keyup(function(){
		$(this).val( $(this).val().replace(/[^0-9]/g,"") );
	});
	
	$('#ph_fr').submit(function(){
		
		var name =$('#name').val(); 
		var birth = $('#birth').val();
		var phone = $('#phone').val();
		var email = $('#email').val();
		
		if(name==""){
			alert("이름을 입력하세요");
			$('#name').focus();
			return false;
		}
		if(birth==""){
			alert("생년월일을 입력하세요");
			$('#birth').focus();
			return false;
		}
		if(phone==""){
			alert("휴대폰번호를 입력하세요");
			$('#phone').focus();
			return false;
		}
		if(email==""){
			alert("이메일을 입력하세요");
			$('#email').focus();
			return false;
		}
		
	});
	
});





</script>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
%>

<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;휴대폰 본인 확인(문자)

<form action="./SearchPassAction.cl" name="fr" id="ph_fr">
<table class="phone_back">
<input type="hidden" name="id" value="<%=id%>">
<tr> 
<td>이름</td>
<td> <input type="text" name="name" id="name" class="ph_txt_box"> </td>
<td> 
<select style="height: 35px; width: 70px;" name="nationality">
	<option selected="selected">내국인</option>
	<option>외국인</option>
</select>
</td> 
</tr>
<tr> 
<td>생년월일</td>
<td> <input type="text" name="birth" id="birth" class="ph_txt_box" placeholder="ex. 19801001"> </td>
<td>
<input type="hidden" name="gender" id="gender" value="남" id="gender">
<input type="button" class="ph_gender_box" style="margin-right: 0px; background-color:#999; color:#fff; " id="man" value="남">
<input type="button" class="ph_gender_box" style="margin-left: 0px; background-color: #fff; color:#43484E;" id="woman" value="여">
</td> 
</tr>
<tr> 
<td>휴대폰번호</td>
<td> <input type="text" name="phone" id="phone" class="ph_txt_box"> </td>
<td> <span style="text-decoration: underline; font-size: 12px;">안심키보드전환</span> </td> 
</tr>
<tr> 
<td>이메일</td>
<td colspan="2">
<input type="text" name="email" id="email" class="ph_txt_box" style="width: 220px;">
</td>
</tr>

</table>

<table class="ph_mini_font">

<tr>
<td> <input type="checkbox">서비스이용약관 동의 </td>
<td> <input type="button" value="전문보기" class="ph_mini_btn"> </td>
<td> <input type="checkbox">개인정보수집/이용 동의 </td>
<td> <input type="button" value="전문보기" class="ph_mini_btn"></td>

</tr>

<tr>
<td> <input type="checkbox" class="ph_mini_font">개인정보제공/위탁 동의 </td>
<td> <input type="button" value="전문보기" class="ph_mini_btn"> </td>
<td> <input type="checkbox" class="ph_mini_font">고유식별정보처리 동의 </td>
<td> <input type="button" value="전문보기" class="ph_mini_btn"><br> </td>
</tr>

</table>

<input type="reset" value="취소" class="ph-cancle" onclick="history.back()">
<input type="submit" value="확인" class="ph-oks">

</form>
</body>
</html>