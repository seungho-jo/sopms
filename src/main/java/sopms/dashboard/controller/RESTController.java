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
	@RequestMapping("/projectCnt.do")
	public int projectCnt(@RequestParam(value="id") int empno) {
		return service.projectCnt(empno);
	}
	@RequestMapping("/taskCnt.do")
	public int taskCnt(@RequestParam(value="id") int empno) {
		return service.taskCnt(empno);
	}
	@RequestMapping("/riskCnt.do")
	public int riskCnt(@RequestParam(value="id") int empno) {
		return service.riskCnt(empno);
	}
	@RequestMapping("/outputCnt.do")
	public int outputCnt(@RequestParam(value="id") int empno) {
		return service.outputCnt(empno);
	}
	//@RequestMapping("/project.do")
	//@RequestMapping("/notice.do")
	//@RequestMapping("/riskClass.do")
	//@RequestMapping("/riskMonthly.do")
}
