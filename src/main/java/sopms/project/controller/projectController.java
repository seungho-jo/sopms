package sopms.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.project.service.projectService;
import sopms.vo.Project;

@Controller
@RequestMapping("project.do")
public class projectController {
	@Autowired(required = false)
	private projectService service;
	
	// http://localhost:7080/sopms/project.do?method=insert
	@RequestMapping(params="method=insert")
	public String projectInsert() {
		
		return "WEB-INF\\view\\project_Insert.jsp";
	}
}
