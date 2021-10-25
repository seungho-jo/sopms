package sopms.calendar.dao;

import java.util.ArrayList;

import sopms.vo.CalList;
import sopms.vo.CalListSch;
import sopms.vo.CalStatusCnt;
import sopms.vo.Calendar;

public interface calendarDao {
	public ArrayList<Calendar> calList(Calendar calendar);
	public void insertCalendar(Calendar insert);
	public void updateCalendar(Calendar upt);
	public void deleteCalendar(int id);
	public ArrayList<Calendar> calSch(String id);
	
	// manage_mem
	public ArrayList<CalStatusCnt> calStatusCnt(String id);
	public ArrayList<CalStatusCnt> calStatusCntAll(CalListSch sch);
	public ArrayList<CalList> calListAll(CalListSch sch);
	public int calCount(CalListSch sch);
}
