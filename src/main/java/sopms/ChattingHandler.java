package sopms;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import sopms.vo.Message;
import sopms.vo.User;


@Component("chatHandler")
public class ChattingHandler extends TextWebSocketHandler{
	
//	private Map<String, WebSocketSession> sessionMap = new ConcurrentHashMap();
//
//
//	@Override
//	public void handleTextMessage(WebSocketSession session, TextMessage message) {
//		//메시지 발송
//		String msg = message.getPayload();
//		JSONObject obj = jsonToObjectParser(msg);
//		for(String key : sessionMap.keySet()) {
//			WebSocketSession wss = sessionMap.get(key);
//			try {
//				wss.sendMessage(new TextMessage(obj.toJSONString()));
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
//	@SuppressWarnings("unchecked")
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		//소켓 연결
//		super.afterConnectionEstablished(session);
//		sessionMap.put(session.getId(), session);
//		JSONObject obj = new JSONObject();
//		obj.put("type", "getId");
//		obj.put("userId", getSession(null));
//		obj.put("sessionId", session.getId());
//		session.sendMessage(new TextMessage(obj.toJSONString()));
//	}
//	
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		//소켓 종료
//		sessionMap.remove(session.getId());
//		super.afterConnectionClosed(session, status);
//	}
//	
//	private static JSONObject jsonToObjectParser(String jsonStr) {
//		JSONParser parser = new JSONParser();
//		JSONObject obj = null;
//		try {
//			obj = (JSONObject) parser.parse(jsonStr);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return obj;
//	}
//	
//	public String getSession(HttpSession session) {
//		
//		User currentUser = (User)session.getAttribute("user");
//		String currentId = currentUser.getId();
//		return currentId;
//		
//	}
	
	private Map<String, WebSocketSession> 
	users = new ConcurrentHashMap();


@Override
public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	// TODO Auto-generated method stub
	super.afterConnectionEstablished(session);
	System.out.println(session.getId()+"님 접속했습니다.");
	// 접속시마다, session을 누적 처리..
	users.put(session.getId(), session);
}
@Override
protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	// TODO Auto-generated method stub
	super.handleTextMessage(session, message);
	System.out.println(session.getId()+"님이 보낸 메시지:"+message.getPayload());
	// 접속할 client들에게 메시지 전송..
	for(WebSocketSession ws :users.values()) {
		ws.sendMessage(message); // ==> client에서 onMessage로 받음.
	}
	
}
@Override
public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	// TODO Auto-generated method stub
	super.afterConnectionClosed(session, status);
	System.out.println(session.getId()+"님 접속 종료되었습니다.");
	// 접속이 종료된 session은 삭제 처리.
	users.remove(session);
	
}
@Override
public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	// TODO Auto-generated method stub
	super.handleTransportError(session, exception);
	System.out.println(session.getId()+"님 에러가 발생했습니다!!:"+exception.getMessage());
}

}

