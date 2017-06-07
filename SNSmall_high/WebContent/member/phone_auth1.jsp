<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기 SN#</title>
<link href="./css/member.css" rel="stylesheet"> 
<link href="./css/font-awesome.min.css" rel="stylesheet">
</head>
<body style="font-size: 13px;">
<div class="ph_top_tit">비밀번호 찾기</div>
<div>
<span style="color:#fc7700; "><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
본인의 <b>SN# 아이디</b>를 입력해 주세요.</div>
<div class="ph_back">
<form action="./SearchPass_IdSend.cl" method="post" name="fr">
SN# 아이디&nbsp;&nbsp;<input type="text" name="id" class="ph-txt-box">
<input type="submit" value="확인" class="ph-txt-btn">
</form>
<br><br>
비밀번호 찾기를 하실 <b>SN# 아이디</b>를 입력해주세요.

</div>
</body>
</html>