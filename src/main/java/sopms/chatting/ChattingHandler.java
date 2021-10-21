package sopms.chatting;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import sopms.chatting.dao.ChattingDao;
import sopms.chatting.service.ChattingService;
import sopms.vo.Chatroom;
import sopms.vo.Message;


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
	@Autowired
	ChattingDao chattingDao;
	
	@Autowired
	ChattingService chattingService;
	
	private List<HashMap<String, Object>> chatrooms = new ArrayList<HashMap<String, Object>>();

@Override
public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	boolean flag=false;
	
	super.afterConnectionEstablished(session);
	String url = session.getUri().toString();
	System.out.println(url);
	String roomNumber = url.split("=")[1];
//	sessionMap.put(session.getId(), session);
//	private Map<String, WebSocketSession> sessionMap = new ConcurrentHashMap();
	List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();
	sessionList.add(session);
	int idx = chatrooms.size();
	for(int i=0; i < idx; i++) {
		String temp = (String) chatrooms.get(i).get("chatroomId");
		if (temp != null && temp == roomNumber) {
			flag = true;
			idx = i;
			break;
		}
	}
	if(flag) {
		HashMap<String, Object> existingRoom = chatrooms.get(idx);
		existingRoom.put(session.getId(), session);
	}else {
		HashMap newRoom = new HashMap<String, Object>();
		newRoom.put("chatroomId", roomNumber);
		newRoom.put(session.getId(), session);
		chatrooms.add(newRoom);
	}
	
	System.out.println(chatrooms);
}

@Override
protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	
	Message receivedMessage = new Message();
	
	String msg = message.getPayload();
	JSONObject obj = jsonToObjectParser(msg);
	
	if(obj.get("type") == null) {
	String content = (String)obj.get("msg");
	String fromId = (String)obj.get("fromId");
	String toId = (String)obj.get("toId");
	String chatroomId = (String)obj.get("chatroomId");
	System.out.println(chatroomId);
	HashMap<String, Object> temp = new HashMap<String, Object>();
	for(int i=0; i < chatrooms.size(); i++) {
		String roomNumber = (String) chatrooms.get(i).get("chatroomId");
		if (roomNumber.equals(chatroomId)) {
			temp = chatrooms.get(i);
			System.out.println(temp);
			break;
		}
	}
	for(String k: temp.keySet()) {
		if(k.equals("chatroomId")) {
			continue;
		}
		WebSocketSession wss = (WebSocketSession) temp.get(k);
		if(wss != null) {
			try {
				receivedMessage.setMessageBody(content);
				receivedMessage.setSender_id(fromId);
				receivedMessage.setTo_id(toId);
				//DB에 채팅방 컬럼 추가
				wss.sendMessage(message);
				chattingDao.insertMessage(receivedMessage);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	System.out.println(session.getId() + "님이 보낸 메시지:" + msg);


//	for(WebSocketSession ws :sessionMap.values()) {
//		ws.sendMessage(message);
//	}
//	} else {
//		String userId = (String)obj.get("userId");
//		HashMap<String, WebSocketSession> currentSession = new HashMap<String, WebSocketSession>();
//		currentSession.put(session.getId(), session);
//		chatroom.put(userId, currentSession);
//		
//	}
	}
	
}

@Override
public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	// TODO Auto-generated method stub
	if (chatrooms.size() > 0) {
		for(int i = 0; i<chatrooms.size(); i++) {
			chatrooms.get(i).remove(session.getId());
		}
		super.afterConnectionClosed(session, status);
	}
	
}
@Override
public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	// TODO Auto-generated method stub
	super.handleTransportError(session, exception);
	System.out.println(session.getId()+"님 에러가 발생했습니다!!:"+exception.getMessage());
}

private static JSONObject jsonToObjectParser(String jsonStr) {
	JSONParser parser = new JSONParser();
	JSONObject obj = null;
	try {
		obj = (JSONObject) parser.parse(jsonStr);
	} catch (ParseException e) {
		e.printStackTrace();
	}
	return obj;
}

}

