package sopms.User.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.User.service.userService;

@Controller
//http://localhost:7080/sopms/userList.do
public class registerController {
	@Autowired
	private userService service;
	@RequestMapping("userList.do")
	public String userList(Model d,String name) {
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp";
	}

}
