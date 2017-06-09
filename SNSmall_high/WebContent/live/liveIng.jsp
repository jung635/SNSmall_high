<%@page import="web.live.db.LiveDAO"%>
<%@page import="web.live.db.LiveBean"%>
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
LiveBean lb = (LiveBean)request.getAttribute("lb");
int product_num = lb.getProduct_num();
String video_id = lb.getVideo_id();
/* String video_id = null;
LiveDAO ldao = new LiveDAO();
int product_num = 0;
if(request.getAttribute("lb")==null){
	video_id = (String)request.getAttribute("video_id");
	lb = ldao.getLive(video_id);
	product_num = lb.getProduct_num();
}else{
	lb = (LiveBean)request.getAttribute("lb");
	product_num = lb.getProduct_num();
	video_id = lb.getVideo_id();
} */

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
}

firebase.database().ref('<%=lb.getVideo_id()%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
	document.getElementById("messageTextArea").value += data.val().message + "\n";
});

   
</script>
<button id="getLiveinfo" onclick="getLive()">내 방송화면 보기</button>
<button id="getLiveinfo" onclick="deleteLive()">방송 그만하기</button>
<div id="title"><h1><%=lb.getTitle()%></h1></div>
<div id="live" style="float: left;"></div>
<div id="chat" style="float: right; margin-right: 10px;">
<textarea id="messageTextArea" rows="10" cols="50" style="width: 600px;height: 690px;"></textarea>
<br />
<input id="textMessage" type="text"  onkeyup="press(event)" style="width: 547px;">
<input onclick="sendMessage()" value="Send" type="button">
</div>
</body>
</html>