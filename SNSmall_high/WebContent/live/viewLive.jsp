<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(id==null){%>
	<script>
	alert("로그인을 해주세요");
	history.back();
	</script>
<%}
String video_id = request.getParameter("video_id");
String token = request.getParameter("token");
%>
<script>
var token;
window.fbAsyncInit = function() {
	FB.init({
      appId            : '1685211914841647',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v2.9'
    });
	getLive();
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
	    	console.log(token);
	    	 // alert(accessToken);
	    	//alert(response.status);
	      if (response && !response.error) {
	        //alert(response);
	        document.getElementById('live').innerHTML=response.embed_html;
	        
	      }
	    },{access_token: '<%=token%>'});
 }
 
function press(){
 	 if(event.keyCode == 13){
 		// alert("test");
 		 sendMessage();
 	 }
  }
  
$(window).bind("beforeunload", function (){

	        alert("테스트");//chrome 브라우저에서는 alert창을 먹어버린다

});  
var config = {
		apiKey: "AIzaSyAJ04h5-aCRcg_FoDyNRq93Z9EWB0ebUgQ",
		authDomain: "snsmall-6f75b.firebaseapp.com",
		databaseURL: "https://snsmall-6f75b.firebaseio.com",
		projectId: "snsmall-6f75b",
		storageBucket: "snsmall-6f75b.appspot.com",
		messagingSenderId: "856975526156"
};
firebase.initializeApp(config);

function sendMessage(){
	console.log('sendMessage');
	firebase.database().ref('<%=video_id%>').push({
		userId: '<%=id%>',
		message: document.getElementById("textMessage").value,
	});
}

firebase.database().ref('<%=video_id%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
	document.getElementById("messageTextArea").value += "<%=id%>:" +  data.val().message + "\n";
});	
   
</script>
<button id="getLiveinfo" onclick="getLive()">내 방송화면 보기</button>
<button id="getLiveinfo" onclick="deleteLive()">방송 그만하기</button>
<div id="live" style="width: 300px"></div>
<!-- 송신 메시지 작성하는 창 -->
<input id="textMessage" type="text"  onkeyup="press()" >
<!-- 송신 버튼 -->
<input onclick="sendMessage()" value="Send" type="button">
<!-- 종료 버튼 -->
<input onclick="disconnect()" value="Disconnect" type="button">
<br />
<!-- 결과 메시지 보여주는 창 -->
<textarea id="messageTextArea" rows="10" cols="50"></textarea>
</body>
</html>