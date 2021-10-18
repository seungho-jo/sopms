package sopms.chatting.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import sopms.ChattingHandler;
import sopms.vo.Message;
import sopms.vo.User;
import sopms.vo.WorkPmSch;
import sopms.vo.WorkSch;

@Controller
public class ChattingController {
	
	@Autowired
	ChattingHandler ChattingHandler;
	
	@RequestMapping(value="messagelist.do", method = RequestMethod.GET)
	public String messageList(@SessionAttribute("user") User user, Model model){
		
		//ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("user", user);
		model.addAttribute("user", user);
		System.out.println("####################"+user);
		String currentId = user.getId();
		//modelAndView.addObject("currentId", currentId);
		model.addAttribute("currentId", currentId);
		//modelAndView.setViewName("WEB-INF/view/messagelist.jsp");
		return "WEB-INF/view/messagelist.jsp";
		
	}

	
	@RequestMapping("newChatting.do")
	public String newChatting() {
		return "WEB-INF/view/chat.jsp";
	}

}