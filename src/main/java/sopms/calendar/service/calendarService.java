package sopms.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.calendar.dao.calendarDao;
import sopms.vo.Calendar;

@Service
public class calendarService {
	@Autowired
	private calendarDao dao;
	public List<Calendar> calList(Calendar calendar){
		return dao.calList(calendar);
	}
	public void insertCalendar(Calendar insert) {
		dao.insertCalendar(insert);
	}
	public void uptCalendar(Calendar upt) {
		dao.uptCalendar(upt);
	}
	public void delCalendar(int id) {
		dao.delCalendar(id);
	}
}
