<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form>
        <!-- �۽� �޽��� �ۼ��ϴ� â -->
        <input id="textMessage" type="text">
        <!-- �۽� ��ư -->
        <input onclick="sendMessage()" value="Send" type="button">
        <!-- ���� ��ư -->
        <input onclick="disconnect()" value="Disconnect" type="button">
    </form>
    <br />
    <!-- ��� �޽��� �����ִ� â -->
    <textarea id="messageTextArea" rows="10" cols="50"></textarea>
     
    <script type="text/javascript">
        //WebSocketEx�� ������Ʈ �̸�
        //websocket Ŭ���� �̸�
        var webSocket = new WebSocket("ws://sunju635.cafe24.com/SNSmall_high/websocket");
        var messageTextArea = document.getElementById("messageTextArea");
        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onopen = function(message){
            messageTextArea.value += "Server connect...\n";
        };
        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onclose = function(message){
            messageTextArea.value += "Server Disconnect...\n";
        };
        //�� ������ ������ ���� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onerror = function(message){
            messageTextArea.value += "error...\n";
        };
        //�� ���Ͽ��� �޽����� ������� �� ȣ��Ǵ� �̺�Ʈ
        webSocket.onmessage = function(message){
            messageTextArea.value += "Recieve From Server => "+message.data+"\n";
        };
        //Send ��ư�� ������ ����Ǵ� �Լ�
        function sendMessage(){
            var message = document.getElementById("textMessage");
            messageTextArea.value += "Send to Server => "+message.value+"\n";
            //���������� textMessage��ü�� ���� ������.
            webSocket.send(message.value);
            //textMessage��ü�� �� �ʱ�ȭ
            message.value = "";
        }
        //������ ����
        function disconnect(){
            webSocket.close();
        }
    </script>
</body>
</html>