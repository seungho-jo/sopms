package sopms.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjStatusController {
	//프로젝트 관리 임시
	//http://localhost:7080/sopms/pj_status.do
	@RequestMapping("pj_status.do")
	public String projectStatus() {
		return "WEB-INF/view/project_status.jsp";
	}
}
