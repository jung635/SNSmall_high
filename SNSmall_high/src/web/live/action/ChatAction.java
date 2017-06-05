package web.live.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class ChatAction{
	static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());

		@OnOpen
	    public void handleOpen(Session session){
	        System.out.println("client is now connected...");
			System.out.println("session:"+session.toString());
			clients.add(session);
	    }
	    @OnMessage
	    public void handleMessage(String message, Session session){
	       
/*	        String replymessage = "";
	        
	        synchronized (clients) {
				// Iterate over the connected sessions
				// and broadcast the received message
				//for (Session client : clients) {
					//if (!client.equals(session)) {
						 System.out.println("receive from client : "+message);
						replymessage = "echo "+message;
						System.out.println("send to client : "+replymessage);
					//}
				//}
			}
	        return replymessage;*/
	    	 String username = (String)userSession.getUserProperties().get("username");
	         //세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션을으로 메시지를 보낸다.(json 형식이다.)
	         //최초 메시지는 username설정
	         if(username == null){
	             userSession.getUserProperties().put("username", message);
	             userSession.getBasicRemote().sendText(buildJsonData("System", "you are now connected as " + message));
	             return;
	         }
	         //username이 있으면 전체에게 메시지를 보낸다.
	         Iterator<Session> iterator = sessionUsers.iterator();
	         while(iterator.hasNext()){
	             iterator.next().getBasicRemote().sendText(buildJsonData(username,message));
	         }


	 출처: http://nowonbun.tistory.com/286 [명월 일지]
	    }
	    @OnClose
	    public void handleClose(Session session){
	    	clients.remove(session);
	        System.out.println("client is now disconnected...");
	    }
	    @OnError
	    public void handleError(Throwable t){
	        t.printStackTrace();
	    }

}
