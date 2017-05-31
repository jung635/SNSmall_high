<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link href="./css/member.css" rel="stylesheet">
<script type="text/javascript">
	function result() {
		opener.document.fr.id.value = document.wfr.userid.value;		
		window.close();
	}
</script>
</head>
<body class="bg_gray">


<div class="bigIdCheck">
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = (String)request.getAttribute("id");
		boolean check = (boolean)request.getAttribute("check");%>
		
			<form action="./dupIdCheck.ve" method="post" name="wfr" class="idCheckForm">
		<input type="text" name="userid" class="idCheckTxt" value="<%=id%>"> <input
			type="submit" class="idCheckbtn2" value="중복확인">
		</form>
		

		<%if (check) {%>
		<div class="idCheck">
		<%	
			out.print("사용가능한 아이디 입니다.");
		%>
		</div>
		<input type="button" value="아이디선택" class="idCheckBtn" onclick="result()">
		<%
		} else {%><div class="idCheck"><%
			out.print("사용중인 아이디 입니다.");%></div><%		
		}
 	%>

</div>
</body>
</html>