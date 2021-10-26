package sopms.chatting.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import sopms.chatting.dao.ChattingDao;
import sopms.chatting.service.ChattingService;
import sopms.vo.Chatroom;
import sopms.vo.User;

@Controller
public class ChattingController {
	@Autowired
	ChattingDao chattingDao;
	
	@Autowired
	ChattingService chattingService;
	
	
	@RequestMapping("chatmain.do")
	public String chatMain(@SessionAttribute("user")User user, Model model) {
		
		model.addAttribute("user", user);
		String currentId = user.getId();
		model.addAttribute("currentId", currentId);
		ArrayList userList = chattingDao.userList();
		model.addAttribute("userList", userList);
		ArrayList myProjects = chattingDao.searchPj(currentId);
		model.addAttribute("myProjects", myProjects);
		return "WEB-INF/view/chatmain.jsp";
	}
	
	@RequestMapping("newChatting.do")
	public String messageList(@SessionAttribute("user") User user, Model model){
		
		model.addAttribute("user", user);
		String currentId = user.getId();
		String showName = user.getName() + " " + user.getRank();
		model.addAttribute("currentId", currentId);
		model.addAttribute("showName", showName);
		return "WEB-INF/view/chat.jsp";
	}

	@RequestMapping("getChatroom.do")
	public String getChatroom(@RequestParam String toId, @SessionAttribute("user")User user, Model model) {
		Integer chatroomId;
		model.addAttribute("user", user);
		model.addAttribute("toId", toId);
		String currentId = user.getId();
		String currentName = user.getName();
		String toName = chattingDao.searchUser(toId).getName();
		model.addAttribute("currentId", currentId);
		chatroomId = chattingService.checkRoom(toId, currentId);
		if (chatroomId == null) {
			chattingService.createRoom(toId, currentId, currentName, toName);
			chatroomId = chattingService.checkRoom(toId, currentId);
		}
		model.addAttribute("chatroomId", chatroomId);
		ArrayList<Chatroom> chatroomList = chattingDao.chatroomInfo(currentId);
		model.addAttribute("chatroomList", chatroomList);
		getMessage(chatroomId, user, model);
		return "WEB-INF/view/chat.jsp";
	}
	
	@RequestMapping(value="searchTeam.do")
	public String searchTeam(@RequestParam("pcode") String pcode, @SessionAttribute("user")User user, Model model){
		model.addAttribute("currentId", user.getId());
		ArrayList myProjects = chattingDao.searchPj(user.getId());
		ArrayList teammates = chattingDao.searchTeam(pcode);
		System.out.println(teammates);
		model.addAttribute("teammates", teammates);
		model.addAttribute("myProjects", myProjects);
		return "WEB-INF/view/chatmain.jsp";
		
	}
	
	@RequestMapping("getMessage.do")
	public String getMessage(@RequestParam int chatroomId, @SessionAttribute User user, Model model) {
		ArrayList messageList = chattingDao.getMessages(chatroomId);
		String currentId = user.getId();
		ArrayList<Chatroom> chatroomList = chattingDao.chatroomInfo(currentId);
		model.addAttribute("chatroomList", chatroomList);
		model.addAttribute("messageList", messageList);
		model.addAttribute("currentId", currentId);
		model.addAttribute("chatroomId", chatroomId);
		return "WEB-INF/view/chat.jsp";
	}
	
	
}