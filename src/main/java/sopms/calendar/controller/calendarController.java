package sopms.calendar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.calendar.service.calendarService;
import sopms.vo.Calendar;
import sopms.vo.User;

@Controller
public class calendarController {
	@Autowired
	private calendarService service;
	// http://localhost:8088/sopms/calendar_mem.do
	@RequestMapping("calendar_mem.do")
	public String calendar() {
		return "WEB-INF\\view\\calendar_mem.jsp";
	}
	
	@RequestMapping("calList.do")
	public String calList(HttpServletRequest request, Model d, Calendar calendar){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		calendar.setManager("조승호");
		d.addAttribute("list", service.calList(calendar));
		return "pageJsonReport";
	}
}
