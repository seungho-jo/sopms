package sopms.projectStatus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SumController {
	
	//project status 페이지 호출
	// http://localhost:7080/sopms/projectStatus.do
	@RequestMapping("projectStatus.do")
	public String projectStatus() {
		
		return "WEB-INF/view/project_status.jsp";
	}
	
	//project status 내부에 include 되는 jsp 페이지 호출. test용
	// http://localhost:7080/sopms/projectStatusSum.do
	@RequestMapping("projectStatusSum.do")
	public String projectStatusSum() {
		return "WEB-INF/view/project_status_sum.jsp";
	}
}
