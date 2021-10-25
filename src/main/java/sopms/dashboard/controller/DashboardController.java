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
		if(user!=null) {
			// 리스크 상태 Chart
			model.addAttribute("riskStatus", service.riskStatusCntJson(user));
			// 월별 리스크 Chart
			model.addAttribute("riskMonthly", service.riskMonthlyJson(user));
			// 프로젝트/작업/리스크/산출물 name list Json
			model.addAttribute("nameList", service.nameListJson(user));
			// 북마크 - 진행중인 프로젝트 list
			model.addAttribute("projectList", service.projectList(user));
			// 공지사항
			model.addAttribute("notice", service.boardNotice());
		}
		return "WEB-INF/view/main.jsp";
	}

	// 북마크 추가 Ajax
	@ResponseBody
	@RequestMapping("dashboard/insertBookmark.do")
	public void insertBookmark(HttpServletRequest request, @RequestParam("pcode") int pcode) {
		HttpSession session = request.getSession();
		String id = ((User)session.getAttribute("user")).getId();
		service.insertBookmark(new ProjectBookmark(pcode,id));
	}
	
	// 북마크 제거 Ajax
	@ResponseBody
	@RequestMapping("dashboard/deleteBookmark.do")
	public void deleteBookmark(HttpServletRequest request, @RequestParam("pcode") int pcode) {
		HttpSession session = request.getSession();
		String id = ((User)session.getAttribute("user")).getId();
		service.deleteBookmark(new ProjectBookmark(pcode,id));
	}
	
	// 북마크 리스트 조회 Ajax
	@ResponseBody
	@RequestMapping(value="dashboard/bookmarkList.do", produces = "application/text;charset=utf8")
	public String bookmarkListJson(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = ((User)session.getAttribute("user")).getId();
		return service.bookmarkListJson(id);
	}
	
	@ResponseBody
	@RequestMapping(value="dashboard/empInfo.do", produces = "application/text;charset=utf8")
	public String empInfo(@RequestParam("id") String id) {
		return service.empInfoJson(id);
	}
}
