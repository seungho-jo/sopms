package sopms.Management.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.Management.service.managementService;
import sopms.vo.Project_List_paging;

@Controller
public class managementController {
	@Autowired
	private managementService service;
	// http://localhost:7080/sopms/management.do
	@RequestMapping("management.do")
	public String projectList(Model d, Project_List_paging project_Lp) {
		
		d.addAttribute("list",service.getProjectList(project_Lp));
		return "WEB-INF\\view\\project_list.jsp";
	}
	
	// http://localhost:7080/sopms/status.do
	@RequestMapping("status.do")
	public String projectStatus() {
		return "WEB-INF\\view\\project_status.jsp";
	}
}
