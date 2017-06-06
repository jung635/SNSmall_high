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
var webSocket = new WebSocket("ws://localhost:8080/SNSmall_high/websocket");
//var webSocket = new WebSocket("ws://" + location.host + "/websocket");
var messageTextArea = document.getElementById("messageTextArea");

webSocket.onopen = function(message){
    messageTextArea.value += "Server connect...\n";
};

webSocket.onclose = function(message){
    messageTextArea.value += "Server Disconnect...\n";
};

webSocket.onerror = function(message){
    messageTextArea.value += "error...\n";
};

webSocket.onmessage = function(message){
	//alert(message.data);
	//var jsonData = JSON.parse(message.data);
	//alert(jsonData.username);
    //if(jsonData.message != null) {
    /* if(jsonData.message != null) {
        messageTextArea.value += jsonData.message + "\n"
    }; */
    if(message != null) {
        messageTextArea.value += message.data + "\n"
    };
    //messageTextArea.value += "Recieve From Server => "+message.data+"\n";
};

function sendMessage(){
	var obj = new Object();
	obj.message = "보내는 메세지";
	obj.id = "idtest";
	obj.video_id = "video_idtest";
    var message = document.getElementById("textMessage");
    //messageTextArea.value += "Send to Server => "+JSON.stringify(obj)+"\n";
   // message=["반갑습니다","test"];
    webSocket.send(JSON.stringify(obj));
    //webSocket.send(message.value);
    message.value = "";
}
function disconnect(){
    webSocket.close();
}

</script>
<button id="getLiveinfo" onclick="getLive()">내 방송화면 보기</button>
<button id="getLiveinfo" onclick="deleteLive()">방송 그만하기</button>
<div id="live" style="width: 300px"></div>
<div id="chatting">
	    <form>
        <!-- 송신 메시지 작성하는 창 -->
        <input id="textMessage" type="text">
        <!-- 송신 버튼 -->
        <input onclick="sendMessage()" value="Send" type="button">
        <!-- 종료 버튼 -->
        <input onclick="disconnect()" value="Disconnect" type="button">
    </form>
    <br />
    <!-- 결과 메시지 보여주는 창 -->
    <textarea id="messageTextArea" rows="10" cols="50"></textarea>
</div>
</body>
</html>