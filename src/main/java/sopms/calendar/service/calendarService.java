package sopms.calendar.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import sopms.calendar.dao.calendarDao;
import sopms.vo.CalStatusCnt;
import sopms.vo.Calendar;
import sopms.vo.User;

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
	public String calStatusCntJson(User user) {
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		ArrayList<CalStatusCnt> statusArr = null;
		System.out.println("직급:"+user.getRank());
		if(user.getRank().equals("부장")) {
			statusArr = dao.calStatusCntAll(user.getId());
		}else {			
			statusArr = dao.calStatusCnt(user.getId());
		}
		
		for(CalStatusCnt cs:statusArr) {
			String key = null;
			if(cs.getStatus().equals("진행중")) {
				key = "prog";
			}else if(cs.getStatus().equals("승인요청")) {
				key = "hold";
				cs.setStatus("미진행");
			}else if(cs.getStatus().equals("종료됨")) {
				key = "fin";
				cs.setStatus("완료");
			}
			System.out.println(cs.getStatus()+":"+cs.getCnt());
		}
		
		return gson.toJson(jsonObj);
	}
}
