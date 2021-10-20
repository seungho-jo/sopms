package sopms.calendar.dao;

import java.util.ArrayList;

import sopms.vo.CalStatusCnt;
import sopms.vo.Calendar;

public interface calendarDao {
	public ArrayList<Calendar> calList(Calendar calendar);
	public void insertCalendar(Calendar insert);
	public void updateCalendar(Calendar upt);
	public void deleteCalendar(int id);
	
	// manage_mem
	public ArrayList<CalStatusCnt> calStatusCnt(String id);
	public ArrayList<CalStatusCnt> calStatusCntAll(String id);
}
