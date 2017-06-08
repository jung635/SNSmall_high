<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
String sns_id = (String)request.getAttribute("sns_id");
String video_id = (String)request.getAttribute("video_id");
String token = (String)request.getAttribute("token");
String title = (String)request.getAttribute("title");
int product_num = (Integer)request.getAttribute("product_num");
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
  	 FB.api('<%=video_id%>?fields=embed_html,permalink_url',function (response) {
	      if (response && !response.error) {
	        console.log(response.permalink_url);
	        document.getElementById('live').innerHTML = response.embed_html;
	        permalink_url = response.permalink_url;
	      }
	    },{access_token: '<%=token%>'});
  	 
  	 return permalink_url;
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
	firebase.database().ref('<%=video_id%>').push({
		userId: '<%=id%>',
		message: "<%=id%>:" +  document.getElementById("textMessage").value,
		status: 'on',
	});
}

firebase.database().ref('<%=video_id%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
		document.getElementById("messageTextArea").value += data.val().message + "\n";
		document.getElementById("textMessage").value = "";
		if(data.val().status == "off"){
			alert("방송이 종료되어 창이 종료됩니다.");
			window.close();
		}
	
});	
	
window.onunload = function(e) {
	  var dialogText = 'Dialog text here';
	  e.returnValue = dialogText;
	  return dialogText;
	  myFunction();
	};
function myFunction(){
	<%System.out.println("test");%>
}

</script>
<button onclick="window.opener.location.href='ProductDetail.pr?product_num=<%=product_num%>&live_id=<%=sns_id%>'">물건 구경하러 가기</button>
<div id="title"><%=title %></div>
<div id="live"></div>
<input id="textMessage" type="text"  onkeyup="press(event)" >
<input onclick="sendMessage()" value="Send" type="button">
<input onclick="check()" value="check" type="button">
<br />
<textarea id="messageTextArea" rows="10" cols="50"></textarea>
</body>
</html>