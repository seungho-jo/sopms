package sopms.chatting.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import sopms.vo.Chatroom;
import sopms.vo.ChatroomPart;
import sopms.vo.Message;
import sopms.vo.Project;
import sopms.vo.User;

public interface ChattingDao {
	
	public void insertMessage(Message message);
	public ArrayList<User> userList();
	public Integer checkRoom(HashMap<String, String> checkId);
	public Integer newRoom(Chatroom chatroom);
	public void newRoomPart(ChatroomPart chatroomPart);
//	public int currentRoom(String currentId);
	public List<HashMap<Integer, String>> myRooms(String currentId);
	public ArrayList<Project> searchPj (String currentId);
	public ArrayList<User> searchTeam (String pcode);
	public User searchUser (String id);
	public ArrayList<Chatroom> chatroomInfo (String currentId);
	public ArrayList<Message> getMessages (int chatroomId);
}
