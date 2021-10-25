package sopms.calendar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.calendar.service.calendarService;
import sopms.vo.CalListSch;
import sopms.vo.Calendar;
import sopms.vo.User;

@Controller
public class calendarController {
	@Autowired
	private calendarService service;
	// http://localhost:8088/sopms/calendar_mem.do
	@RequestMapping("calendar_mem.do")
	public String calendar(HttpServletRequest request, Model d, Calendar calendar) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if (!user.getRank().equals("부장")) {
			d.addAttribute("sch", service.calSch(user.getId()));
			return "WEB-INF\\view\\calendar_mem.jsp";
		} else {
			d.addAttribute("pm", user.getId());
			d.addAttribute("sch", service.calSch(user.getId()));
			return "WEB-INF\\view\\calendar_pm.jsp";
		}
	}
/*
	@RequestMapping("calList.do")
	public String calList(HttpServletRequest request, Model d, Calendar calendar){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		calendar.setManager("조승호");
		d.addAttribute("list", service.calList(calendar));
		return "pageJsonReport";
	}
*/
	@RequestMapping("manage_mem.do")
	public String calendarStatus(HttpServletRequest request, Model d, CalListSch cal) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			d.addAttribute("calStatus", service.calStatusCntJson(user));
			cal.setManager(user.getId());
			d.addAttribute("calListAll", service.calListAll(cal));			
		}
		if (!user.getRank().equals("부장")) {
			return "WEB-INF/view/manage_mem.jsp";
		} else {
			return "WEB-INF\\view\\manage_pm.jsp";
		}
	}
	
}
