package sopms.vo;

public class Chatroom {
	
	private int chatroomId;
	private String chatType;
	private String chatroomName;
	
	public int getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(int chatroomId) {
		this.chatroomId = chatroomId;
	}
	public String getChatType() {
		return chatType;
	}
	public void setChatType(String chatType) {
		this.chatType = chatType;
	}
	public String getChatroomName() {
		return chatroomName;
	}
	public void setChatroomName(String chatroomName) {
		this.chatroomName = chatroomName;
	}
	@Override
	public String toString() {
		return "Chatroom [chatroomId=" + chatroomId + ", chatType=" + chatType + ", chatroomName=" + chatroomName + "]";
	}

}
