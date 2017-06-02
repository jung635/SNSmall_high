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
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId            : '1185421938235757',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v2.9'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
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
    //location.href="LiveList.li?sns_id=<%=id%>"
    });
  });
};
document.getElementById('liveCheckButton').onclick = function() {
	//alert("test");
	var accessToken = "1185421938235757|G5ZsL0HzRk-8ILsngUbhyGKnlaM";
	FB.api("1185421938235757", function (response) {
		    	console.log(response);
		    	  alert(accessToken);
		    	alert(response.status);
		      if (response && !response.error) {
		        alert(response);
		      }
		    },{access_token: accessToken});
}



</script>
</body>
</html>