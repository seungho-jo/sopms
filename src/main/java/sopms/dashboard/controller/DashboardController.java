package sopms.dashboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.dashboard.service.DashboardService;
import sopms.vo.User;

@Controller
public class DashboardController {
	@Autowired
	public DashboardService service;
	
	// http://localhost:7080/sopms/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("직급:"+user.getRank());
		if(user!=null) {
			d.addAttribute("countSum",service.getCount(user));
		}
		return "WEB-INF/view/main.jsp";
	}
}
