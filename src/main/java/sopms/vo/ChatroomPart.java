package sopms.vo;

public class ChatroomPart {
	
	private int chatroomId;
	private String memberName;
	
	public int getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(int chatroomId) {
		this.chatroomId = chatroomId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	@Override
	public String toString() {
		return "ChatroomPart [chatroomId=" + chatroomId + ", memberName=" + memberName + "]";
	}
	
}
