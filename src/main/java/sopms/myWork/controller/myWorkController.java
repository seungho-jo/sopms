package sopms.myWork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.myWork.service.myWorkService;
import sopms.vo.User;
import sopms.vo.WorkSch;

@Controller
public class myWorkController {
	
	@Autowired
	private myWorkService service;
	// http://localhost:7080/sopms/myWork.do
	@RequestMapping("myWork.do")
	public String myWorkList(HttpServletRequest request,Model d,WorkSch worksch) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		worksch.setManager(user.getName());
		d.addAttribute("list", service.myWorkList(worksch));
		return "WEB-INF\\view\\myWork.jsp";
	}
	// http://localhost:7080/sopms/detailWork.do
	@RequestMapping("detailWork.do")
	public String detailWork() {
		return "WEB-INF\\view\\detailWork.jsp";
	}
}
