package web.live.action;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@ServerEndpoint("/websocket")
public class ChatAction{
	static List<Session> users = Collections.synchronizedList(new ArrayList<>());

		@OnOpen
	    public void handleOpen(Session session){
	        //System.out.println("client is now connected...");
			System.out.println("session:"+session.getId());
			users .add(session);
	    }
	    @OnMessage
	    public void handleMessage(String message, Session session){

	    	 String username = (String)session.getUserProperties().get("id");
	    	 JSONObject obj = null;
	    	 try{
		         if(username == null){
		             session.getUserProperties().put("id", session.getId());
		             username = (String)session.getUserProperties().get("id");
		         	obj =  new JSONObject();
		        	obj.put("username", username);
		        	obj.put("message", "you are now connected as " + session.getId());
		        	//arr.add(obj);
		             //session.getBasicRemote().sendText(buildJsonData("System", "you are now connected as " + message));
		             session.getBasicRemote().sendText(obj.toJSONString());
		             
		           
		         }
		         	
		         	//arr.clear();
		         	obj =  new JSONObject();
		        	obj.put("username", username);
		        	obj.put("message", username + ":" + message);
		        	//arr.add(obj);
		         //username이 있으면 전체에게 메시지를 보낸다.
		         Iterator<Session> iterator = users.iterator();
		         while(iterator.hasNext()){
		             //iterator.next().getBasicRemote().sendText(buildJsonData(username,message));
		             iterator.next().getBasicRemote().sendText(obj.toJSONString());
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
