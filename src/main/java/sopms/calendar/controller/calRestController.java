package sopms.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import sopms.calendar.service.calendarService;
import sopms.vo.Calendar;
import sopms.vo.User;

@RestController
public class calRestController {
	@Autowired
	private calendarService service;
	// http://localhost:8088/sopms/calendar_mem.do
	// http://localhost:8088/sopms/calList.do

	@RequestMapping("calList.do")
	public List<Calendar> calList(HttpServletRequest request, Calendar calendar){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(!user.getRank().equals("부장")) {
			calendar.setManager(user.getId());			
		} else {
			calendar.setPm(user.getId());
		}
		return service.calList(calendar);
	}
	@RequestMapping(value="calendarInsert.do", produces = "application/text; charset=UTF-8")
	public String calendarInsert(HttpServletRequest request, Calendar insert) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		insert.setRank(user.getRank());
		if(!user.getRank().equals("부장")) {
			insert.setManager(user.getId());
		}else {
			insert.setPm(user.getId());
		}
		service.insertCalendar(insert);
		return "등록완료";
	}
	@RequestMapping(value="calendarUpdate.do", produces = "application/text; charset=UTF-8")
	public String calendarUpdate(Calendar upt) {
		service.uptCalendar(upt);
		return "수정완료";
	}
	@RequestMapping(value="calendarDelete.do", produces = "application/text; charset=UTF-8")
	public String calendarDelete(@RequestParam("id") int id) {
		service.delCalendar(id);
		return "삭제완료";
	}
}
