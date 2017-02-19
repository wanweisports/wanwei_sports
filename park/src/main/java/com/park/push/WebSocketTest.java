package com.park.push;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//@ServerEndpoint(value = "/websocket" , configurator = HttpSessionConfigurator.class)
public class WebSocketTest {
	
	private HttpSession httpSession;
	private static Map<String, Session> sessions = new HashMap<String, Session>();

	@OnMessage
    public void onMessage(String message, Session session) 
    	throws IOException, InterruptedException {
		
    }
	
	@OnOpen
    public void onOpen (Session session, EndpointConfig config) {
		httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		sessions.put(httpSession.getId(), session);
		System.out.println(httpSession.getId()+"=="+sessions.size()+""+httpSession.getAttribute("name"));
        System.out.println("Client connected:"+this); 
    }

    @OnClose
    public void onClose (Session session) {
    	sessions.remove(httpSession.getId());
    	System.out.println(httpSession.getId()+"==="+sessions.size());
    	System.out.println("Connection closed:"+this);
    }
    
    public static Session getSession(String sessionId){
    	return sessions.get(sessionId);
    }
    
}
