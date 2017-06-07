<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴대폰본인확인 SMS 인증</title>
<link href="../css/member.css" rel="stylesheet"> 
<link href="../css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;휴대폰 본인 확인(문자)
<form action="" name="fr" id="ph_auth_fr">
<table class="phone_back">

<tr> 
<td></td>
<td><span style="text-decoration: underline; font-size: 12px; margin-left: 130px;">일반키보드 전환</span></td>
</tr>
<tr> 
<td>인증번호</td>
<td><input type="text" name="authNum" class="ph_txt_box" style="width: 200px; padding-right: 50px;"></td> 
</tr>

</table>

<ul style="font-size: 9px;">
<li>3분 이내로 인증번호(6자리)를 입력해 주세요.</li>
<li>입력시간 초과시 "재전송" 버튼을 눌러주세요.</li>
<li>연장하기는 최초 1회만 가능합니다.</li>
</ul>

<input type="reset" value="취소" class="ph-cancle">
<input type="submit" value="확인" class="ph-oks">

</form>



</body>
</html>