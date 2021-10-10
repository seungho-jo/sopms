package sopms.myWork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myWorkController {
	
	// http://localhost:8088/sopms/myWork.do
	@RequestMapping("myWork.do")
	public String myWorkList() {
		return "WEB-INF\\view\\myWork.jsp";
	}
}
