<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%String video_id = (String)request.getAttribute("video_id");
String token = (String)request.getAttribute("token");%>
<script>
var token;
var video_id;
window.fbAsyncInit = function() {
	FB.init({
      appId            : '1685211914841647',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v2.9'
    });
    FB.AppEvents.logPageView();
};

(function(d, s, id) {
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) return;
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1685211914841647";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

function getLive(){
	 FB.api('<%=video_id%>', function (response) {
	    	console.log(response);
	    	 // alert(accessToken);
	    	//alert(response.status);
	      if (response && !response.error) {
	        //alert(response);
	        document.getElementById('live').innerHTML=response.embed_html;
	      }
	    },{access_token: '<%=token%>'});
 }
 
function deleteLive(){
	alert('방송을 종료합니다.');
	FB.api(
		'<%=video_id%>',
		'POST',
		{"end_live_video":"true"},
			function(response) {
			console.log(response);
				 if (response && !response.error) {
	    		     location.href="LiveDelete.li?video_id=<%=video_id%>";
	    		 }
	    },{access_token: '<%=token%>'}
	);
 }
 

</script>
<button id="getLiveinfo" onclick="getLive()">내 방송화면 보기</button>
<button id="getLiveinfo" onclick="deleteLive()">방송 그만하기</button>
<div id="live" style="width: 300px"></div>
</body>
</html>