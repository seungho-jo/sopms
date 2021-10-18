package sopms.calendar.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import sopms.calendar.dao.calendarDao;
import sopms.vo.Calendar;

@Service
public class calendarService {
	@Autowired
	private calendarDao dao;
	public List<Calendar> calList(Calendar calendar){
		return dao.calList(calendar);
	}

	/*
	public String calList2(Calendar calendar){
		ArrayList<Calendar> list = dao.calList(calendar);
		ArrayList<Calendar> list2 = dao.calList2(calendar);
		for(Calendar cl: list2) {
			cl.setBackgroundColor("#0099cc");
			cl.setBorderColor("#0099cc");
			cl.setTextColor("#ccffff");
		}
		JsonObject dl = new JsonObject();
		Gson gs = new Gson();
		dl.addProperty("list", gs.toJson(list));
		dl.addProperty("list2", gs.toJson(list2));
		String result = gs.toJson(dl);
		System.out.println(result);
		
		return result.replace("\\", "");
	}
	*/
	public void insertCalendar(Calendar insert) {
		dao.insertCalendar(insert);
	}
	public void uptCalendar(Calendar upt) {
		dao.updateCalendar(upt);
	}
	public void delCalendar(int id) {
		dao.deleteCalendar(id);
	}
}
