<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
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
     
    <script type="text/javascript">
       //var webSocket = new WebSocket("ws://localhost:8080/SNSmall_high/websocket");
        var webSocket = new WebSocket("ws://sunju635.cafe24.com:80/websocket");
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
</body>
</html>