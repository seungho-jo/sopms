package sopms.calendar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sopms.calendar.service.calendarService;
import sopms.vo.Calendar;
import sopms.vo.User;

@RestController
public class calendarController {
	@Autowired
	private calendarService service;
	// http://localhost:8088/sopms/calendar_mem.do
	@RequestMapping("calendar.do")
	public String calendar(HttpServletRequest request, Calendar calendar) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		calendar.setManager(user.getName());
		return "WEB-INF\\view\\calendar_mem.jsp";
	}
	
	
}
