package sopms.calendar.controller;

import java.util.List;

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
public class manageController {
	@Autowired
	private calendarService service;
	// http://localhost:8088/sopms/manage_mem.do
	@RequestMapping("manage_mem.do")
	public String calendar() {
		return "WEB-INF\\view\\manage_mem.jsp";
	}
}
