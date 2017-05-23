<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-3.2.0.js"></script>
<script type="text/javascript">
	function ajax1(){
		$.ajax({
			url:"./writeAction.bo",
			success:function(data){
				$('#abc').html(data);
			}
			
		});
	}
</script>
</head>
<body>
<input type="button" value="testajax" onclick="ajax1()">

<!-- 불러들일 공간 -->
<div id="abc">

</div>
</body>
</html>