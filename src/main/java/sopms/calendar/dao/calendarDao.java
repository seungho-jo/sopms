package sopms.calendar.dao;

import java.util.ArrayList;

import sopms.vo.Calendar;

public interface calendarDao {
	public ArrayList<Calendar> calList(Calendar calendar);
	public ArrayList<Calendar> calList2(Calendar calendar);
	public void insertCalendar(Calendar insert);
	public void updateCalendar(Calendar upt);
	public void deleteCalendar(int id);
}
