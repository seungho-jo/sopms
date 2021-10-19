package sopms.dashboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import sopms.dashboard.dao.DashboardDao;
import sopms.vo.DashboardCnt;
import sopms.vo.Notice;
import sopms.vo.ProjectBookmark;
import sopms.vo.ProjectSum;
import sopms.vo.RiskMonthly;
import sopms.vo.RiskStatusCnt;
import sopms.vo.User;

@Service
public class DashboardService {
	@Autowired
	DashboardDao dao;
	
	public DashboardCnt getCount(User user) {
		Gson gson = new Gson();
		DashboardCnt dbCnt = new DashboardCnt();
		
		dbCnt.setProjectCnt(dao.projectCnt(user.getDept()));
		if(user.getRank().equals("부장")) {
			dbCnt.setTaskCntAll(dao.taskCntAll(user.getId()));
			dbCnt.setTaskReqCnt(dao.taskReqCnt(user.getId()));
			dbCnt.setRiskCntAll(dao.riskCntAll(user.getDept()));
		}else {
			dbCnt.setTaskCnt(dao.taskCnt(user.getId()));
			dbCnt.setRiskCnt(dao.riskCnt(user.getId()));
		}
		System.out.println("return:"+gson.toJson(dbCnt));
		return dbCnt;
	}
	
	public String riskStatusCntJson(User user) {
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		ArrayList<RiskStatusCnt> statusArr = null;
		
		if(user.getRank().equals("부장")) {
			statusArr=dao.riskStatusCntAll(user.getDept());
		}else {
			statusArr=dao.riskStatusCnt(user.getId());
		}
		
		for(RiskStatusCnt rs:statusArr) {
			String key = null;
			if(rs.getStatus().equals("진행중")) key = "prog";
			else if(rs.getStatus().equals("홀드")) key = "hold";
			else if(rs.getStatus().equals("조치완료")) key = "fin";
			jsonObj.addProperty(key, rs.getCnt());
		}
		return gson.toJson(jsonObj);
	}
	
	public String riskMonthlyJson(User user) {
		Gson gson = new Gson();
		ArrayList<RiskMonthly> monthArr = null;
		
		if(user.getRank().equals("부장")) {
			monthArr = dao.riskMonthlyAll(user.getDept());
		}else {
			monthArr = dao.riskMonthly(user.getId());
		}
		
		return gson.toJson(monthArr);
	}
	
	public ArrayList<ProjectSum> projectList(User user) {
		return dao.projectList(user);
	}
	
	public String bookmarkListJson(String id) {
		Gson gson = new Gson();
		return gson.toJson(dao.bookmarkList(id));
	}
	
	public void insertBookmark(ProjectBookmark bm) {
		dao.insertBookmark(bm);
	}
	
	public void deleteBookmark(ProjectBookmark bm) {
		dao.deleteBookmark(bm);
	}
	
	public ArrayList<Notice> boardNotice(){
		return dao.boardNotice();
	}
}
