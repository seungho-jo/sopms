package sopms.chatting.controller;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import sopms.chatting.dao.ChattingDao;
import sopms.chatting.service.ChattingService;
import sopms.vo.Message;
import sopms.vo.User;
import sopms.vo.WorkPmSch;
import sopms.vo.WorkSch;

@Controller
public class ChattingController {
	@Autowired
	ChattingDao chattingDao;
	
	@Autowired
	ChattingService chattingService;
	
	@RequestMapping("newChatting.do")
	public String messageList(@SessionAttribute("user") User user, Model model){
		
		model.addAttribute("user", user);
		String currentId = user.getId();
		String showName = user.getName() + " " + user.getRank();
		model.addAttribute("currentId", currentId);
		model.addAttribute("showName", showName);
		return "WEB-INF/view/chat.jsp";
	}
	
	@RequestMapping("chatmain.do")
	public String chatMain(@SessionAttribute("user")User user, Model model) {
		
		model.addAttribute("user", user);
		String currentId = user.getId();
		model.addAttribute("currentId", currentId);
		ArrayList teamlist = chattingDao.teamlist(currentId);
		model.addAttribute("teamlist", teamlist);
		return "WEB-INF/view/chatmain.jsp";
	}
	

	@RequestMapping("getChatroom.do")
	public String getChatroom(@RequestParam String toId, @SessionAttribute("user")User user, Model model) {
		Integer chatroomId;
		model.addAttribute("user", user);
		model.addAttribute("toId", toId);
		String currentId = user.getId();
		model.addAttribute("currentId", currentId);
		chatroomId = chattingService.checkRoom(toId, currentId);
		if (chatroomId == null) {
			chattingService.createRoom(toId, currentId);
			chatroomId = chattingService.checkRoom(toId, currentId);
		}
		model.addAttribute("chatroomId", chatroomId);
		return "WEB-INF/view/chat.jsp";
		
	}
	
}