<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증정보 입력-다날 본인확인</title>
<link href="../css/member.css" rel="stylesheet"> 
<link href="../css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;휴대폰 본인 확인(문자)


<form action="" name="fr">
<table class="phone_back">
<tr> 
<td>이름</td>
<td> <input type="text" name="name" class="ph_txt_box"> </td>
<td> 
<select style="height: 35px; width: 70px;">
	<option selected="selected">내국인</option>
	<option>외국인</option>
</select>
</td> 
</tr>
<tr> 
<td>생년월일</td>
<td> <input type="text" name="birth" class="ph_txt_box" placeholder="ex. 19801001"> </td>
<td>
<span class="ph_gender_box" style="margin-left: 0px;">남</span>
<span class="ph_gender_box">여</span>
</td> 
</tr>
<tr> 
<td>휴대폰번호</td>
<td> <input type="text" name="phone" class="ph_txt_box"> </td>
<td> <span style="text-decoration: underline; font-size: 12px;">안심키보드전환</span> </td> 
</tr>
<tr> 
<td>이메일</td>
<td></td>
<td></td> 
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

<input type="reset" value="취소" class="ph-cancle">
<input type="submit" value="확인" class="ph-oks">

</form>
</body>
</html>