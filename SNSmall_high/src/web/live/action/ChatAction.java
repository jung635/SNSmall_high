package web.live.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@ServerEndpoint("/websocket")
public class ChatAction{

	static Map<Session, String> users = Collections.synchronizedMap(new HashMap<>());
	 JSONObject obj = null;
	 String username = "";
	 String send_mesg = "";
	 String id = "";
		@OnOpen
	    public void handleOpen(Session session){
			System.out.println("session:"+session.getId());
	    }
	    @OnMessage
	    public void handleMessage(String message, Session session){
	    	
	    	 username = (String)session.getUserProperties().get("id");
	    	 
	    	 try{
	    		 JSONObject json = (JSONObject)new JSONParser().parse(message);
	    		 System.out.println(json.get("video_id"));
	    		 users.put(session, (String)json.get("video_id"));
		         if(username == null){
		             session.getUserProperties().put("id", session.getId());
		             username = (String)session.getUserProperties().get("id");
		             send_mesg = json.get("id")+"님 입장";
		             session.getBasicRemote().sendText(send_mesg);
		         }else{
			         send_mesg = json.get("id") + ":" + (String)json.get("message");
			         Iterator<Session> iterator = users.keySet().iterator();
			         int i=0;
			         while(iterator.hasNext()){
			        	 Session key = iterator.next();
			        	if(users.get(key).equals((String)json.get("video_id")))
			             key.getBasicRemote().sendText(send_mesg);
			        	 i++;
			         }
		         }
	    	 }catch(Exception e){
	    		 e.printStackTrace();
	    	 }
	    }

	    @OnClose
	    public void handleClose(Session session){
	 	    	users.remove(session);
		        System.out.println("client is now disconnected...");
	    }
	    @OnError
	    public void handleError(Throwable t){
	        t.printStackTrace();
	    }

}


