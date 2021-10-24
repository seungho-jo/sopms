package sopms.chatting.controller;
import org.springframework.http.MediaType;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import sopms.chatting.dao.ChattingDao;
import sopms.vo.Message;



@RestController
public class ChattingRestController {
	
	@Autowired
	ChattingDao chattingDao;
	
//	@RequestMapping(value="saveMessage.do", method=RequestMethod.POST, consumes =MediaType.APPLICATION_JSON_VALUE)
//	public Message saveMessage(@RequestBody Message message) {
	@RequestMapping(value="saveMessage.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void saveMessage(@RequestBody Message message) {
		chattingDao.insertMessage(message);
	}
	
//	@RequestMapping("getMessage.do")
//	public ArrayList getMessage(@RequestParam String chatroomId) {
//		System.out.println(chatroomId);
//		int intchatroomId = Integer.parseInt(chatroomId);
//		ArrayList messageList = chattingDao.getMessages(intchatroomId);
//		return messageList;
//	}

}
