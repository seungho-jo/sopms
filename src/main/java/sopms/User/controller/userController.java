package sopms.User.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.User.service.userService;
import sopms.vo.User;

@Controller
//http://localhost:7080/sopms/userList.do
public class userController {
	@Autowired(required = false)
	private userService service;
	
	@RequestMapping("userList.do")
	public String userList(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp";
	}
	/*	@RequestMapping("userListAjax.do") 
	public String userList2(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp";
	}
	
	 * public String userList(User user, Model d) { d.addAttribute("userList",
	 * service.getUserList(user)); return "WEB-INF\\view\\userList.jsp"; }
	 */
}
