<%@page import="web.live.db.LiveDAO"%>
<%@page import="web.live.db.LiveBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="./css/font-awesome.min.css" rel="stylesheet"> 
<link href="./css/live.css" rel="stylesheet">
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body style="background-color: #e3e3e3;">
<div id="fb-root"></div>
<%
String id = (String)session.getAttribute("id");
LiveBean lb = (LiveBean)request.getAttribute("lb");
int product_num = lb.getProduct_num();
String video_id = lb.getVideo_id();
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

var config = {
		apiKey: "AIzaSyAJ04h5-aCRcg_FoDyNRq93Z9EWB0ebUgQ",
		authDomain: "snsmall-6f75b.firebaseapp.com",
		databaseURL: "https://snsmall-6f75b.firebaseio.com",
		projectId: "snsmall-6f75b",
		storageBucket: "snsmall-6f75b.appspot.com",
		messagingSenderId: "856975526156"
};
firebase.initializeApp(config);

function getLive(){
 	 FB.api('<%=lb.getVideo_id()%>?fields=embed_html,permalink_url',function (response) {
	      if (response && !response.error) {
	        console.log(response);
	        document.getElementById('live').innerHTML = response.embed_html;
	      }
	    },{access_token: '<%=lb.getToken()%>'});
}

 
function deleteLive(){
	alert('방송을 종료합니다.');
	 firebase.database().ref('<%=lb.getVideo_id()%>').push({
			userId: '<%=id%>',
			message: "채팅이 종료되었습니다.",
			status: 'off',
		});
	 	 FB.api('<%=lb.getVideo_id()%>?fields=permalink_url',function (response) {
		      if (response && !response.error) {
		    	  console.log(response.permalink_url);
		        permalink_url = response.permalink_url;
		      }else{
		    	  location.href="LiveDelete.li?video_id=<%=lb.getVideo_id()%>&product_num=<%=lb.getProduct_num()%>&url=err";
		      }
		    },{access_token: '<%=lb.getToken()%>'});
		
		FB.api('<%=lb.getVideo_id()%>?end_live_video=true','POST',function (response) {
					 console.log(response);
					 location.href="LiveDelete.li?video_id=<%=lb.getVideo_id()%>&product_num=<%=lb.getProduct_num()%>&url="+permalink_url;
					  if (response && !response.error) {
					  }
				  },{access_token: '<%=lb.getToken()%>'});

 }

function press(){
  	 if(event.keyCode == 13){
  		 sendMessage();
  	 }
   }


function sendMessage(){
	console.log('sendMessage');
	firebase.database().ref('<%=lb.getVideo_id()%>').push({
		userId: '<%=id%>',
		message: "<%=id%>:" +  document.getElementById("textMessage").value,
	});
	document.getElementById("textMessage").value = "";
	document.getElementById("messageTextArea").scrollTop = document.getElementById("messageTextArea").scrollHeight;
}

firebase.database().ref('<%=lb.getVideo_id()%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
	document.getElementById("messageTextArea").value += data.val().message + "\n";
	document.getElementById("messageTextArea").scrollTop = document.getElementById("messageTextArea").scrollHeight;
});

chatBox = document.getElementById('messageTextArea');
if(chatBox.scrollHeight>0) chatBox.scrollTop = chatBox.scrollHeight;
</script>
<div id="title">
<br>
<span class="tit-bg">
<i class="fa fa-angle-double-right" aria-hidden="true"></i>
<%=lb.getTitle()%>
</span>
</div>
<hr style="margin: 30px 20px 50px 10px;">
<div id="live" style="margin-left: 10px; float: left;"></div>
<div style="clear:both"></div>
 <div id="chat">
	<div id="chat-in">
		<button class="gobtn_ing" onclick="getLive()"><i class="fa fa-play" aria-hidden="true"></i>내 방송화면 보기</button>
		<button class="gobtn_ing" onclick="deleteLive()"><i class="fa fa-stop" aria-hidden="true"></i>방송 그만하기</button><br>
		<textarea id="messageTextArea" rows="10" cols="50"></textarea>
		<br>
		<input id="textMessage" type="text"  onkeyup="press(event)" style="width: 500px">
		<input onclick="sendMessage()" value="Send" class="sendBtn" type="button">
	</div>
</div>

</body>
</html>