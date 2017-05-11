<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../../js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#passChange').click(function(){
		$(this).next().toggle('slow',function(){
			});	
	});
});
</script>
</head>
<body>



<input type="button" id="passChange" value="비밀번호 변경">
<div>
<form action= "./SnspassChange.sn" onsubmit="passcheck">
new password &nbsp;&nbsp;<input type="text" name="newpass"><br>
retype password<input type="text" name="newpass2">
<input type="submit">
</form>
</div>

<h1>열고,닫기</h1>
<div>
<h1>제목2</h1>
<p>내용2</p>
</div>

</body>
</html>