<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%String id = (String)session.getAttribute("id");
String product_num = request.getParameter("product_num");
%>
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
  
function checkLoginState() {
	FB.login(function(response) {
		if (response.status === 'connected') {
		    console.log(response.authResponse.accessToken);
		    token = response.authResponse.accessToken;
		    makeLive();
	}	 else {
	     console.log('User cancelled login or did not fully authorize.');
	    }
	}, { scope:'publish_actions,user_videos' });
}

function makeLive() {
  FB.ui({
    display: 'popup',
    method: 'live_broadcast',
    phase: 'create',
}, function(response) {
    if (!response.id) {
      alert('dialog canceled');
      return;
    }
    FB.ui({
      display: 'popup',
      method: 'live_broadcast',
      phase: 'publish',
      broadcast_data: response,
    }, function(response) {
    	console.log(response);
    video_id = response.id;
    title = document.getElementById("title").value;
    window.open("LiveOpen.li?sns_id=<%=id%>&video_id="+response.id+"&token="+token+"&product_num=<%=product_num%>&title="+title, "live_view" , "width=800,height=800");
    });
  });
};

</script>
라이브 방송 제목 : <input type="text" id="title">
<button id="login" onclick="checkLoginState()">라이브 방송 시작하기</button>
</body>
</html>