package sopms.dashboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import sopms.dashboard.dao.DashboardDao;
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
	
	// 프로젝트/작업/리스크/산출물 Name list 들을 하나의 Json String으로 변환하여 반환
	public String nameListJson(User user) {
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		if(user.getRank().equals("부장")) {	// 부장 Dashboard 에 전달할 Data
			jsonObj.add("projectPM", gson.toJsonTree(dao.projectNamePM(user.getId())));
			jsonObj.add("taskPM", gson.toJsonTree(dao.taskNamePM(user.getId())));
			jsonObj.add("taskReqPM", gson.toJsonTree(dao.taskReqNamePM(user.getId())));
			jsonObj.add("riskPM", gson.toJsonTree(dao.riskNamePM(user.getId())));
			jsonObj.add("outputPM", gson.toJsonTree(dao.outputNamePM(user.getId())));
		}else {	// 기타 사원 Dashboard 에 전달할 Data
			jsonObj.add("project", gson.toJsonTree(dao.projectName(user.getId())));
			jsonObj.add("task", gson.toJsonTree(dao.taskName(user.getId())));
			jsonObj.add("risk", gson.toJsonTree(dao.riskName(user.getId())));
			jsonObj.add("output", gson.toJsonTree(dao.outputName(user.getId())));
		}
		return gson.toJson(jsonObj);
	}
	
	// 리스크 상태 chart
	public String riskStatusCntJson(User user) {
		Gson gson = new Gson();
		ArrayList<RiskStatusCnt> statusArr = null;
		
		if(user.getRank().equals("부장")) {
			statusArr=dao.riskStatusCntPM(user.getId());
		}else {
			statusArr=dao.riskStatusCnt(user.getId());
		}
		
		return gson.toJson(statusArr);
	}
	
	// 월별 리스크 발생 추이 Chart
	public String riskMonthlyJson(User user) {
		Gson gson = new Gson();
		ArrayList<RiskMonthly> monthArr = null;
		
		if(user.getRank().equals("부장")) {
			monthArr = dao.riskMonthlyPM(user.getId());
		}else {
			monthArr = dao.riskMonthly(user.getId());
		}
		
		return gson.toJson(monthArr);
	}
	
	// 참여 프로젝트 리스트
	public ArrayList<ProjectSum> projectList(User user) {
		return dao.projectList(user);
	}
	
	// 북마크한 프로젝트 리스트 Json
	public String bookmarkListJson(String id) {
		Gson gson = new Gson();
		return gson.toJson(dao.bookmarkList(id));
	}
	
	// 북마크 추가
	public void insertBookmark(ProjectBookmark bm) {
		dao.insertBookmark(bm);
	}
	
	// 북마크 제거
	public void deleteBookmark(ProjectBookmark bm) {
		dao.deleteBookmark(bm);
	}
	
	// 공지사항
	public ArrayList<Notice> boardNotice(){
		return dao.boardNotice();
	}
	
	// 사원정보
	public String empInfoJson(String id) {
		Gson gson = new Gson();
		return gson.toJson(dao.empInfo(id));
	}
}
