package sopms.projectStatus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import sopms.projectStatus.service.ProjectStatusSumService;

@RestController
public class SumRestController {
	@Autowired
	private ProjectStatusSumService sumService;
	
	// project_status_sum.jsp 에서 ajax로 호출
	// http://localhost:7080/sopms/projectSum.do
	@RequestMapping(value = "projectSum.do", produces = "application/text; charset=utf8")
	public String projectStatusSum(@RequestParam("pcode")String pcode) {
		return sumService.projectInfoJson(Integer.parseInt(pcode));
	}
}
