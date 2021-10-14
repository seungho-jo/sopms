package sopms.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
	// http://localhost:7080/sopms/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard() {
		return "WEB-INF/view/main.jsp";
	}
}
