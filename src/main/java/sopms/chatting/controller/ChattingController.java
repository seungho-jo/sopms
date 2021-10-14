package sopms.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.ChattingHandler;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingHandler ChattingHandler;
	
	@RequestMapping("chat-ws.do")
	public String newChatroom() {
		return "WEB-INF/view/messagelist.jsp";
	}
	
	@RequestMapping("newChatting.do")
	public String newChatting() {
		return "WEB-INF/view/chat.jsp";
	}

}
