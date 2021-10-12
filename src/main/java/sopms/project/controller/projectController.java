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
	@RequestMapping(params="method=insertform")
	public String projectInsertform(HttpServletRequest request,Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("ddddddddddddddddddd"+user.getRank());
		if(!user.getRank().equals("부장")) {
			d.addAttribute("msg","접근권한이 없습니다.");
			return "WEB-INF\\view\\main.jsp";
		} else {
			return "WEB-INF\\view\\project_Insert.jsp";
		}
	}	
	
	@RequestMapping(params="method=insert")
	public String projectInsert(HttpServletRequest request,Project project) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		project.setName(user.getName());
		service.insertProject(project);
		return "WEB-INF\\view\\project_Insert.jsp";
	}
	
	// http://localhost:7080/sopms/project.do?method=detail	
	@RequestMapping(params="method=detail")
	public String projectDetail(@RequestParam("pcode") int pcode, Model d) {		
		d.addAttribute("project", service.getProject(pcode));		
		return "WEB-INF\\view\\project_status_sum.jsp";
	}
	// http://localhost:7080/final/project.do?method=update	
	@RequestMapping(params="method=update")
	public String projectUpdate(Project upt) {
		service.update(upt);
		return "forward:/project.do?method=detail";
	}	
	// http://localhost:7080/final/project.do?method=delete	
	@RequestMapping(params="method=delete")
	public String projectUpdate(@RequestParam("pcode") int pcode) {
		service.getProject(pcode);
		return "redirect:/board.do?method=delete";
	}
}
