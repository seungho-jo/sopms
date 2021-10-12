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
	
	// http://localhost:7080/sopms/projectStatus.do
	@RequestMapping("projectStatus.do")
	public String projectStatus() {
		return "WEB-INF/view/project_status.jsp";
	}
	// http://localhost:7080/sopms/projectStatusSum.do
	@RequestMapping("projectStatusSum.do")
	public String projectStatusSum() {
		return "WEB-INF/view/project_status_sum.jsp";
	}
}
