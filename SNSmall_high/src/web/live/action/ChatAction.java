package web.live.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

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

	static List<Session> users = Collections.synchronizedList(new ArrayList<>());
	 //JSONObject obj = null;
	 String username = "";
	 String send_mesg = "";
		@OnOpen
	    public void handleOpen(Session session){
			System.out.println("session:"+session.getId());
			users .add(session);
	    }
	    @OnMessage
	    public void handleMessage(String message, Session session){

	    	 username = (String)session.getUserProperties().get("id");
	    	 
	    	 try{
	 	    	JSONObject json = (JSONObject)new JSONParser().parse(message);
	 	    	System.out.println(json.get("id"));
		         if(username == null){
		             session.getUserProperties().put("id", session.getId());
		             username = (String)session.getUserProperties().get("id");
		         	//obj =  new JSONObject();
		        	//obj.put("username", username);
		        	//obj.put("message", username+"님 입장");
		             send_mesg = username+"님 입장";
		             //session.getBasicRemote().sendText(obj.toJSONString());
		             session.getBasicRemote().sendText(send_mesg);
		         }
		         	//obj =  new JSONObject();
		        	//obj.put("username", username);
		        	//obj.put("message", username + ":" + message);
		         send_mesg = username + ":" + message;
		         Iterator<Session> iterator = users.iterator();
		         while(iterator.hasNext()){
		             //iterator.next().getBasicRemote().sendText(obj.toJSONString());
		             iterator.next().getBasicRemote().sendText(send_mesg);
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


