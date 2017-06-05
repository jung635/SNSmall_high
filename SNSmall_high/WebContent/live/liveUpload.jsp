<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String id = "test"; %>
<button id="liveButton">Create Live Stream To Facebook</button>
<button id="liveCheckButton">Create Live Stream To Facebook Check</button>
<button id="login" onclick="checkLoginState()">라이브 방송 시작하기</button>
<button id="getLiveinfo" onclick="getLive()">getLive</button>
<div id="live"></div>
<script>

var token;
window.fbAsyncInit = function() {
	FB.init({
      appId            : '1185421938235757',
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
   js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1185421938235757";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));
  
function checkLoginState() {
	 window.fbAsyncInit;
	 FB.getLoginStatus(function(response) {
		 if (response.status === 'connected') {
			    console.log(response.authResponse.accessToken);
			    token = response.authResponse.accessToken;
		}else{
			FB.login();
		}
	 });
} 

document.getElementById('liveButton').onclick = function() {
  FB.ui({
    display: 'popup',
    method: 'live_broadcast',
    phase: 'create',
}, function(response) {
    if (!response.id) {
      alert('dialog canceled');
      return;
    }
    alert('stream url:' + response.secure_stream_url);
    FB.ui({
      display: 'popup',
      method: 'live_broadcast',
      phase: 'publish',
      broadcast_data: response,
    }, function(response) {
    	console.log(response);
    alert("video status: \n" + response.status);
    //location.href="LiveList.li?sns_id=<%=id%>&video_id="+response.id+"&token="+token;
    //window.open("LiveList.li?sns_id=<%=id%>&video_id="+response.id"+&token="+token, "live_view" , "width=500,height=500");
    });
  });
};

document.getElementById('liveCheckButton').onclick = function() {
	
	//alert("test");
	//var accessToken = "EAAQ2Io2JmW0BAIJPRnC0pKeqlYl4NElZAQtPeWDIE6uDTye3IZAwr3WZAaHvqtZCFGFkTJZB2pStNbw9M0E87u6KWAIGnp6qsrtKChBApAg4QhsFl54ubqZCcjhTcbnsZCcUUQd76eUXVNd1tTtuzCXZBqlLAly4TYz8KrBLZCZBkxa2wkraGCgE2kR2FD7StWuPAZD";
	FB.api("1446676258746150", function (response) {
		    	console.log(response);
		    	console.log(token);
		    	 // alert(accessToken);
		    	//alert(response.status);
		      if (response && !response.error) {
		        //alert(response);
		        document.getElementById('live').innerHTML=response.embed_html;
		      }
		    },{access_token: token});
	//,{access_token: accessToken}
	//setTimeout("check()", 3000);//3초 마다 서버와 통신함 
} 
 
function getLive(){
	 FB.api("1446676258746150", function (response) {
	    	console.log(response);
	    	console.log(token);
	    	 // alert(accessToken);
	    	//alert(response.status);
	      if (response && !response.error) {
	        //alert(response);
	        document.getElementById('live').innerHTML=response.embed_html;
	      }
	    },{access_token: token});
 }

</script>
</body>
</html>