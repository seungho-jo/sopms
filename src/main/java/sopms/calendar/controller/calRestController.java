package sopms.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sopms.calendar.service.calendarService;
import sopms.vo.Calendar;

@RestController
public class calRestController {
	@Autowired
	private calendarService service;
	@RequestMapping("calList.do")
	public List<Calendar> calList(){
		return service.calList();
	}
}
