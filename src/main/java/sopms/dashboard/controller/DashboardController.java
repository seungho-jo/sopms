package sopms.dashboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sopms.dashboard.service.DashboardService;
import sopms.vo.ProjectBookmark;
import sopms.vo.User;

@Controller
public class DashboardController {
	@Autowired
	public DashboardService service;
	
	// http://localhost:7080/sopms/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("직급:"+user.getRank());
		if(user!=null) {
			model.addAttribute("countSum", service.getCount(user));
			model.addAttribute("riskStatus", service.riskStatusCntJson(user));
			model.addAttribute("riskMonthly", service.riskMonthlyJson(user));
			model.addAttribute("projectList", service.projectList(user));
			model.addAttribute("notice", service.boardNotice());
		}
		return "WEB-INF/view/main.jsp";
	}

	@RequestMapping("dashboard/insertBookmark.do")
	public void insertBookmark(HttpServletRequest request, @RequestParam("pcode") int pcode) {
		HttpSession session = request.getSession();
		String id = ((User)session.getAttribute("user")).getId();
		service.insertBookmark(new ProjectBookmark(pcode,id));
	}
	
	@RequestMapping("dashboard/deleteBookmark.do")
	public void deleteBookmark(HttpServletRequest request, @RequestParam("pcode") int pcode) {
		HttpSession session = request.getSession();
		String id = ((User)session.getAttribute("user")).getId();
		service.deleteBookmark(new ProjectBookmark(pcode,id));
	}
	
	@ResponseBody
	@RequestMapping(value="dashboard/bookmarkList.do", produces = "application/text;charset=utf8")
	public String bookmarkListJson(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = ((User)session.getAttribute("user")).getId();
		return service.bookmarkListJson(id);
	}
}
