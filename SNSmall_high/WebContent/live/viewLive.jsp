<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    
   <script type="text/javascript">
      var webSocket = new WebSocket("ws://localhost:8080/SNSmall_high/websocket");
      //var webSocket = new WebSocket("wss://www.sunju635.cafe24.com/SNSmall_high/websocket");
       var messageTextArea = document.getElementById("messageTextArea");

       webSocket.onopen = function(message){
       	sendOpenMessage();
       };

       webSocket.onclose = function(message){
           messageTextArea.value += "Server Disconnect...\n";
       };

       webSocket.onerror = function(message){
           messageTextArea.value += "error...\n";
       };

       webSocket.onmessage = function(message){
           if(message != null) {
               messageTextArea.value += message.data + "\n"
           };
       };

       function sendMessage(){
       	var message = document.getElementById("textMessage");
       	var obj = new Object();
       	obj.message = message.value;
       	obj.id = "<%=id%>";
       	obj.video_id = "<%=video_id%>";
          
           webSocket.send(JSON.stringify(obj));
           message.value = "";
       }
       function sendOpenMessage(){
       	var obj = new Object();
       	obj.message = "서버 연결 완료";
       	obj.id = "<%=id%>";
       	obj.video_id = "<%=video_id%>";
           var message = document.getElementById("textMessage");
           webSocket.send(JSON.stringify(obj));
           message.value = "";
       }
       function disconnect(){
           webSocket.close();
       }
   </script>
</body>
</html>