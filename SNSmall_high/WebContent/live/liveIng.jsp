<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
<div id="fb-root"></div>
<%
String id = (String)session.getAttribute("id");
String video_id = (String)request.getAttribute("video_id");
String token = (String)request.getAttribute("token");
String title = (String)request.getAttribute("title");
int product_num = (Integer)request.getAttribute("product_num");
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
 	 FB.api('<%=video_id%>?fields=permalink_url',function (response) {
	      if (response && !response.error) {
	        console.log(response);
	        document.getElementById('liveDiv').setAttribute('data-href',"https://www.facebook.com"+response.permalink_url);
	        document.getElementById('bq').cite = "https://ko-kr.facebook.com"+response.permalink_url;
	        document.getElementById('liveA').href = "https://ko-kr.facebook.com"+response.permalink_url;
	      }
	    },{access_token: '<%=token%>'});
}
 
function deleteLive(){
	alert('방송을 종료합니다.');
	 firebase.database().ref('<%=video_id%>').push({
			userId: '<%=id%>',
			message: "채팅이 종료되었습니다.",
			status: 'off',
		});
	FB.api(
			'<%=video_id%>?end_live_video=true',
			  'POST',
			  function(response) {
				  console.log(response);
				  if (response && !response.error) {
				 	 location.href="LiveDelete.li?video_id=<%=video_id%>&product_num=<%=product_num%>";
				  }
			  },{access_token: '<%=token%>'}
			);
 }

function press(){
  	 if(event.keyCode == 13){
  		// alert("test");
  		 sendMessage();
  	 }
   }


function sendMessage(){
	console.log('sendMessage');
	firebase.database().ref('<%=video_id%>').push({
		userId: '<%=id%>',
		message: "<%=id%>:" +  document.getElementById("textMessage").value,
	});
}

firebase.database().ref('<%=video_id%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
	document.getElementById("messageTextArea").value += data.val().message + "\n";
	document.getElementById("textMessage").value = "";
});

$(document).ready(function(){
    $(".iframe").css('width','300px');
});	
   
</script>
<button id="getLiveinfo" onclick="getLive()">내 방송화면 보기</button>
<button id="getLiveinfo" onclick="deleteLive()">방송 그만하기</button>
<div id="title"><%=title %></div>
<!-- <div id="live" style="width: 300px" data-width="500"></div> -->
<div class="fb-video" id="liveDiv" data-href="" data-width="500" data-show-text="false"><blockquote cite="" id = "bq" class="fb-xfbml-parse-ignore"><a href="" id="liveA"></a><p></p><a href="https://www.facebook.com/people/Sunju-Jung/100017642026723">Sunju Jung</a>에 의해 게시 됨 2017년 6월 7일 수요일</blockquote></div>
<!-- 송신 메시지 작성하는 창 -->
<input id="textMessage" type="text"  onkeyup="press(event)" >
<!-- 송신 버튼 -->
<input onclick="sendMessage()" value="Send" type="button">
<!-- 종료 버튼 -->
<input onclick="disconnect()" value="Disconnect" type="button">
<br />
<!-- 결과 메시지 보여주는 창 -->
<textarea id="messageTextArea" rows="10" cols="50"></textarea>
</body>
</html>