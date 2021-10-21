package sopms.chatting.dao;
import java.util.ArrayList;
import java.util.HashMap;

import sopms.vo.Chatroom;
import sopms.vo.ChatroomPart;
import sopms.vo.Message;
import sopms.vo.User;

public interface ChattingDao {
	
	public void insertMessage(Message message);
	public ArrayList<User> teamlist(String id);
	public Integer checkRoom(HashMap<String, String> checkId);
	public Integer newRoom(Chatroom chatroom);
	public void newRoomPart(ChatroomPart chatroomPart);
}
