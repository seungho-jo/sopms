package sopms.Management.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopms.Management.service.managementService;
import sopms.vo.Project_List_paging;
import sopms.vo.User;
import sopms.vo.Work;


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
		
		if (!user.getRank().equals("부장")) {
			d.addAttribute("msg", "접근권한이 없습니다.");
			return "forward:/dashboard.do";
		} else {
			project_Lp.setPm(user.getId());
			
			d.addAttribute("list",service.getProjectList(project_Lp));
			d.addAttribute("pm",user.getName());
			d.addAttribute("id",user.getId());
			return "WEB-INF\\view\\project_list.jsp";
		}
		
	}
	
	// http://localhost:7080/sopms/status.do
		@RequestMapping("status.do")
		public String projectStatus() {
			return "WEB-INF\\view\\project_status.jsp";
		}
		
		// http://localhost:7080/sopms/status01.do
		@RequestMapping("status01.do")
		public String projectStatus01() {
			return "WEB-INF\\view\\ganttchart.jsp";
		}
		// http://localhost:7080/sopms/wbslist.do?no=2
		@RequestMapping("wbslist.do")
		public String wbslist(Model d, @RequestParam("no") int no) {
			d.addAttribute("list",service.wbslist(no));
			
			return "pageJsonReport";
		}
		
		@RequestMapping("resourcelist.do")
		public String resourcelist(Model d, @RequestParam("no") int pcode) {
			d.addAttribute("list",service.resourcelist(pcode));
			
			return "pageJsonReport";
		}
		
		@RequestMapping("delete.do")
		public String wbs03(@RequestParam("id") int id,@RequestParam("r_pcode") int r_pcode,@RequestParam("r_pm") String r_pm) {
			service.deleteWbs(id);
			return "forward:/status.do?pcode="+r_pcode+"&pm="+r_pm; 
		}
		
		
		@RequestMapping("update.do")
		public String wbs04(Work update,@RequestParam("r_pcode") int r_pcode,@RequestParam("r_pm") String r_pm) {
			
			service.updateWbs(update);
			return "forward:/status.do?pcode="+r_pcode+"&pm="+r_pm; 
		}
		
		
		@RequestMapping("insert.do")
		public String wbs05(Work insert,@RequestParam("r_pcode") int r_pcode,@RequestParam("r_pm") String r_pm) {
			service.insertWbs(insert);
			return "forward:/status.do?pcode="+r_pcode+"&pm="+r_pm; 
		}
}
