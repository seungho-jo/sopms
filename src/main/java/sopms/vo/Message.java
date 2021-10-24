package sopms.vo;

import java.util.Date;

public class Message {
	
	private String fromId;
	private String messageBody;
	private int chatroomId;
	

	public String getMessageBody() {
		return messageBody;
	}
	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}
	
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public int getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(int chatroomId) {
		this.chatroomId = chatroomId;
	}
	
	@Override
	public String toString() {
		return "Message [fromId=" + fromId + ", messageBody=" + messageBody + ", chatroomId=" + chatroomId + "]";
	}




}
