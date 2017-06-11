<%@page import="web.live.db.LiveBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/font-awesome.min.css" rel="stylesheet"> 
<link href="./css/live.css" rel="stylesheet">
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body style="background-color: #e3e3e3;">
<%
String id = (String)session.getAttribute("id");
LiveBean lb = (LiveBean)request.getAttribute("lb");
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
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=1185421938235757";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function getLive(){
  	 FB.api('<%=lb.getVideo_id()%>?fields=embed_html,permalink_url',function (response) {
	      if (response && !response.error) {
	        console.log(response.permalink_url);
	        document.getElementById('live').innerHTML = response.embed_html;
	      }
	    },{access_token: '<%=lb.getToken()%>'});
 }
 
 function check(){
	 alert("https://www.facebook.com"+getLive());
 }
 
function press(event){
 	 if(event.keyCode == 13 || event.charCode == 13){
 		 sendMessage();
 	 }
  }
   
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
	firebase.database().ref('<%=lb.getVideo_id()%>').push({
		userId: '<%=id%>',
		message: "<%=id%>:" +  document.getElementById("textMessage").value,
		status: 'on',
	});
	document.getElementById("textMessage").value = "";
}

firebase.database().ref('<%=lb.getVideo_id()%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
		document.getElementById("messageTextArea").value += data.val().message + "\n";

		if(data.val().status == "off"){
			alert("방송이 종료되어 창이 종료됩니다.");
			window.close();
		}
	
});	

function goProduct(){
	alert('기존의 창에서 확인하실수 있습니다');
	window.opener.location.href='ProductDetail.pr?product_num=<%=lb.getProduct_num()%>&live_id=<%=lb.getSns_id()%>';
}
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
<div style="position: relative; width: 1650px; height: 740px;">
<div id="chat">
	<div id="chat-in">
		<button class="go-shopping" onclick="goProduct()">상품 구경하러 가기</button>
		<button onclick="location.href='LiveList.li'">방송 목록 보기</button>
		<br>
		<textarea id="messageTextArea" rows="10" cols="50"></textarea>
		<br>
		<input id="textMessage" type="text"  onkeyup="press(event)">
		<input onclick="sendMessage()" value="Send" class="sendBtn" type="button">
	</div>
</div>
<div id="live" style="margin-left: 10px; float: left;"></div>
</div>


</body>
</html>