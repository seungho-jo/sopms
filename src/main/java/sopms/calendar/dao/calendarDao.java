package sopms.calendar.dao;

import java.util.ArrayList;

import sopms.vo.Calendar;

public interface calendarDao {
	public ArrayList<Calendar> calList(Calendar calendar);
	public void insertCalendar(Calendar insert);
	public void uptCalendar(Calendar upt);
	public void delCalendar(int id);
}
