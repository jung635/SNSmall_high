<%@page import="web.live.db.LiveBean"%>
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
LiveBean lb = (LiveBean)request.getAttribute("lb");
String href = "https://www.facebook.com"+lb.getUrl();
String cite = "https://ko-kr.facebook.com"+lb.getUrl();
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

$(window).load(function() { <%System.out.println("test");%>});
/* window.onunload = function(e) {
  var dialogText = 'Dialog text here';
  e.returnValue = dialogText;
  return dialogText;
  myFunction();
}; */
function myFunction(){
<%System.out.println("test");%>
}
function goProduct(){
	alert('기존의 창에서 확인하실수 있습니다');
	window.opener.location.href='ProductDetail.pr?product_num=<%=lb.getProduct_num()%>&live_id=<%=lb.getSns_id()%>';
}
</script>
<button onclick="goProduct()">물건 구경하러 가기</button>
<div id="title"><h1><%=lb.getTitle() %></h1></div>
<div class="fb-video" data-href="<%=href %>" data-width="1000" data-show-text="false"><blockquote cite="<%=cite %>" class="fb-xfbml-parse-ignore"><a href="<%=cite %>"></a></blockquote></div>
</body>
</html>