package sopms.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopms.project.service.projectService;
import sopms.vo.Project;
import sopms.vo.User;

@Controller
@RequestMapping("project.do")
public class projectController {
	@Autowired(required = false)
	private projectService service;

	// http://localhost:7080/sopms/project.do?method=insertform
	@RequestMapping(params = "method=insertform")
	public String projectInsertform(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (!user.getRank().equals("부장")) {
			d.addAttribute("msg", "접근권한이 없습니다.");
			return "forward:/dashboard.do";
		} else {
			return "WEB-INF\\view\\project_Insert.jsp";
		}
	}

	@RequestMapping(params = "method=insert")
	public String projectInsert(HttpServletRequest request, Project project) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		project.setId(user.getId());
		service.insertProject(project);
		return "WEB-INF\\view\\project_Insert.jsp";
	}
	// http://localhost:7080/sopms/project.do?method=updateform
	@RequestMapping(params = "method=updateform")
	public String projectUpdateForm(@RequestParam("pcode") int pcode,HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (!user.getRank().equals("부장")) {
			d.addAttribute("msg", "접근권한이 없습니다.");
			return "forward:/dashboard.do";
		} else {
			d.addAttribute("project", service.getProject(pcode));
			return "WEB-INF\\view\\project_Update.jsp";
		}
			
	}

	// http://localhost:7080/sopms/project.do?method=update
	@RequestMapping(params = "method=update")
	public String projectUpdate(Project upt) {
		service.update(upt);
		service.update_dept(upt);
		
		return "WEB-INF\\view\\project_status.jsp";
	}

	// http://localhost:7080/sopms/project.do?method=delete
	@RequestMapping(params = "method=delete")
	public String deleteProject(@RequestParam("pcode") int pcode) {
		service.deleteProject(pcode);
		return "redirect:/management.do";
	}
}
