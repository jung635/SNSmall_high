package web.live.action;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/websocket")
public class ChatAction{
	
	 @OnOpen
	    public void handleOpen(){
	        System.out.println("client is now connected...");
	    }
	    /**
	     * �� �������κ��� �޽����� ���� ȣ��Ǵ� �̺�Ʈ
	     * @param message
	     * @return
	     */
	    @OnMessage
	    public String handleMessage(String message){
	        System.out.println("receive from client : "+message);
	        String replymessage = "echo "+message;
	        System.out.println("send to client : "+replymessage);
	        return replymessage;
	    }
	    /**
	     * �� ������ ������ ȣ��Ǵ� �̺�Ʈ
	     */
	    @OnClose
	    public void handleClose(){
	        System.out.println("client is now disconnected...");
	    }
	    /**
	     * �� ������ ������ ���� ȣ��Ǵ� �̺�Ʈ
	     * @param t
	     */
	    @OnError
	    public void handleError(Throwable t){
	        t.printStackTrace();
	    }

}
