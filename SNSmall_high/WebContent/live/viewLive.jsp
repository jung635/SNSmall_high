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
if(id==null){%>
	<script>
	alert("로그인을 해주세요");
	history.back();
	</script>
<%}
String video_id = request.getParameter("video_id");
String token = request.getParameter("token");
String title = request.getParameter("title");
int product_num = Integer.parseInt(request.getParameter("product_num"));
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
  	 FB.api('sunju635/<%=video_id%>', {"fields":"permalink_url"},function (response) {
	    	//console.log(response);
	    	//console.log(token);
	    	 // alert(accessToken);
	    	//alert(response.status);
	      if (response && !response.error) {
	        //alert(response);
	        console.log(response);
	       // document.getElementById('live').innerHTML=response.embed_html;
	        
	      }
	    },{access_token: '<%=token%>'});
/* 	    FB.api(
	    		  '/112550532676347',
	    		  'GET',
	    		  {"fields":"permalink_url"},
	    		  function(response) {
	    		      // Insert your code here
	    		  }
	    		); */
 }
 
function press(event){
 	 if(event.keyCode == 13 || event.charCode == 13){
 		// alert("test");
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
	});
}

firebase.database().ref('<%=video_id%>').limitToLast(1).on('child_added',function(data, prevChildKey){
	console.log(data.val()); 
	document.getElementById("messageTextArea").value += data.val().message + "\n";
	document.getElementById("textMessage").value = "";
});	
window.onbeforeunload = deleteLive;
	
function deleteLive(){
	alert('방송을 종료합니다.');
	<%System.out.println("꺄륵");%>
	FB.api(
			'<%=video_id%>',
			  'POST',
			  {"end_live_video":"true"},
			  function(response) {
				  console.log(response);
				  if (response && !response.error) {
				 	 //location.href="LiveDelete.li?video_id=<%=video_id%>&product_num=<%=product_num%>";
				  }
			  },{access_token: '<%=token%>'}
			);
 }
 
$(document).ready(function(){
    $('iframe').css('width','300px');
});	

</script>
<button onclick="deleteLive()">방송 그만하기</button>
<button onclick="window.opener.location.href='ProductDetail.pr?product_num=<%=product_num%>'">물건 구경하러 가기</button>
<div id="title"><%=title %></div>
<div id="live" style="width: 300px" data-width="500"></div>
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