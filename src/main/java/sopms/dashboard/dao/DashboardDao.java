package sopms.dashboard.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import sopms.vo.Notice;
import sopms.vo.ProjectBookmark;
import sopms.vo.ProjectSum;
import sopms.vo.RiskMonthly;
import sopms.vo.RiskStatusCnt;
import sopms.vo.User;

@Repository
public interface DashboardDao {
//일반 dashboard
	public ArrayList<String> projectName(String id);
	public ArrayList<String> taskName(String id);
	public ArrayList<String> riskName(String id);
	public ArrayList<String> outputName(String id);
	//chart - risk status
	public ArrayList<RiskStatusCnt> riskStatusCnt(String id);
	public ArrayList<RiskMonthly> riskMonthly(String id);
	
//PM dashboard
	public ArrayList<String> projectNamePM(String id);
	public ArrayList<String> taskNamePM(String id);
	public ArrayList<String> taskReqNamePM(String id);
	public ArrayList<String> riskNamePM(String id);
	public ArrayList<String> outputNamePM(String id);
	//chart - risk status
	public ArrayList<RiskStatusCnt> riskStatusCntPM(String id);
	public ArrayList<RiskMonthly> riskMonthlyPM(String id);
	
//common
	public ArrayList<ProjectSum> projectList(User user);
	public ArrayList<ProjectSum> bookmarkList(String id);
	public void insertBookmark(ProjectBookmark bm);
	public void deleteBookmark(ProjectBookmark bm);
	public ArrayList<Notice> boardNotice();
	public User empInfo(String id);
}
