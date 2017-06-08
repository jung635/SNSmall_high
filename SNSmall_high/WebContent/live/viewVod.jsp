<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
<div id="fb-root"></div>
<%
String id = (String)session.getAttribute("id");
if(id==null){%>
	<script>
	alert("로그인을 해주세요");
	history.back();
	</script>
<%}
String title = request.getParameter("title");
int product_num = Integer.parseInt(request.getParameter("product_num"));
String url= request.getParameter("url");
String href = "https://www.facebook.com"+url;
String cite = "https://ko-kr.facebook.com"+url;
%>
<script>
var token;
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1185421938235757";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<button onclick="window.opener.location.href='ProductDetail.pr?product_num=<%=product_num%>'">물건 구경하러 가기</button>
<div id="title"><%=title %></div>
<div class="fb-video" data-href="<%=href %>" data-width="500" data-show-text="false"><blockquote cite="<%=cite %>" class="fb-xfbml-parse-ignore"><a href="<%=cite %>"></a></blockquote></div>
</body>
</html>