package sopms.Management.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.Management.service.managementService;
import sopms.vo.Project_List_paging;
import sopms.vo.User;

@Controller
public class managementController {
	@Autowired
	private managementService service;
	// http://localhost:7080/sopms/management.do
	@RequestMapping("management.do")
	public String projectList(HttpServletRequest request, 
						Model d, Project_List_paging project_Lp) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		project_Lp.setPm(user.getId());
		d.addAttribute("list",service.getProjectList(project_Lp));
		return "WEB-INF\\view\\project_list.jsp";
	}
	
	// http://localhost:7080/sopms/status.do
	@RequestMapping("status.do")
	public String projectStatus() {
		return "WEB-INF\\view\\project_status.jsp";
	}
}
