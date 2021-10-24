package sopms.chatting.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.chatting.dao.ChattingDao;
import sopms.vo.Chatroom;
import sopms.vo.ChatroomPart;

@Service
public class ChattingService {

	@Autowired
	ChattingDao chattingDao;

	public Integer checkRoom(String toId, String currentId) {
		HashMap<String, String> checkId = new HashMap<String, String>();
		checkId.put("toId", toId);
		checkId.put("currentId", currentId);
		Integer roomId = chattingDao.checkRoom(checkId);
		return roomId;

	}

	public void createRoom(String toId, String currentId, String currentName, String toName) {
		ArrayList<String> selectedUsers = new ArrayList<String>();
		selectedUsers.add(currentId);
		selectedUsers.add(toId);
		Chatroom chatroom = new Chatroom();
		chatroom.setChatroomId(0);
		chatroom.setChatType("P");
		chatroom.setChatroomName(currentName+","+toName);
		chattingDao.newRoom(chatroom);
		System.out.println("#######" + chatroom.getChatroomId());
		for (String user : selectedUsers) {
			ChatroomPart chatroomPart = new ChatroomPart();
			chatroomPart.setChatroomId(chatroom.getChatroomId());
			chatroomPart.setMemberName(user);
			System.out.println(chatroomPart);
			chattingDao.newRoomPart(chatroomPart);
		}

	}

}
