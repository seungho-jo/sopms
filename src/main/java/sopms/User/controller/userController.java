package sopms.User.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import sopms.User.service.userService;
import sopms.vo.User;
import sopms.vo.userSch;

@Controller
//http://localhost:7080/sopms/userList.do
public class userController {
	@Autowired
	private userService service;
		@RequestMapping("userList.do")
	public String userList(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp";
	}
		/*		@RequestMapping("userListAjax.do") 
	public String userList2(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp"; 
	}
	*/
	//http://localhost:7080/sopms/pageList.do
	@RequestMapping("pageList.do") //페이징 처리
	public String userList2(userSch sch,Model d) { 
		d.addAttribute("list",service.getUserListPaging(sch));
		return "WEB-INF\\view\\userList.jsp";
	}  
	
	
	
	
}
	
	
	
	