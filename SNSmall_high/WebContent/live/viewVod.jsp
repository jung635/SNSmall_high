<%@page import="web.live.db.LiveBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인기 VOD</title>
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link href="./css/font-awesome.min.css" rel="stylesheet"> 
<link href="./css/live.css" rel="stylesheet">
</head>
<body style="background-color: #e3e3e3;">
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
</script>

<br>
<div id="title">

<span class="sub-vod">
<span class="sub-let">
<i class="fa fa-angle-double-right" aria-hidden="true"></i>
<%=lb.getTitle()%>
</span>
<button class="vod-go-btn" onclick="window.opener.location.href='ProductDetail.pr?product_num=<%=lb.getProduct_num()%>&live_id=<%=lb.getSns_id()%>'">
<i class="fa fa-shopping-cart" aria-hidden="true"></i>　상품 구경하러 가기
</button>
</span>
<hr style="margin: 30px 20px 50px 10px;">
</div>

<div class="fb-video" data-href="<%=href %>" data-width="1300" data-show-text="false"><blockquote cite="<%=cite %>" class="fb-xfbml-parse-ignore"><a href="<%=cite %>"></a></blockquote></div>
</body>
</html>