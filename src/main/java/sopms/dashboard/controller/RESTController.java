package sopms.dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import sopms.dashboard.service.DashboardService;

@RestController
@RequestMapping("/dashboard")
public class RESTController {
	@Autowired
	DashboardService service;
	
	//@RequestMapping("/project.do")
	//@RequestMapping("/notice.do")
	//@RequestMapping("/riskClass.do")
	//@RequestMapping("/riskMonthly.do")
}
