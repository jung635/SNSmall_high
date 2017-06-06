<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/4.1.1/firebase.js"></script>
</head>
<body>
	<script>
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
			firebase.database().ref('1').push({
				userId: 'id',
				message: document.getElementById("textMessage").value,
			});
		}
		
		firebase.database().ref('1').limitToLast(1).on('child_added',function(data, prevChildKey){
			console.log(data.val());
			document.getElementById("messageTextArea").value += data.val().message + "\n";
		});
		
		function press(){
		  	 if(event.keyCode == 13){
		  		// alert("test");
		  		 sendMessage();
		  	 }
		   }
	</script>
	<!-- 송신 메시지 작성하는 창 -->
	<input id="textMessage" type="text" onkeydown="press()">
	<!-- 송신 버튼 -->
	<input onclick="sendMessage()" value="Send" type="button">
	<!-- 종료 버튼 -->
	<input onclick="disconnect()" value="Disconnect" type="button">
	<br/>
	<!-- 결과 메시지 보여주는 창 -->
	<textarea id="messageTextArea" rows="10" cols="50"></textarea>
</body>
</html>
