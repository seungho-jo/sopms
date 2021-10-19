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
	public int taskCnt(String id);
	public int riskCnt(String id);
	public int outputCnt(String id);	
	//chart - risk status
	public ArrayList<RiskStatusCnt> riskStatusCnt(String id);
	public ArrayList<RiskMonthly> riskMonthly(String id);
	
//PM dashboard
	public int taskCntAll(String id);
	public int riskCntAll(String dept);
	public int taskReqCnt(String id);
	public int outputCntAll(String id);
	//chart - risk status
	public ArrayList<RiskStatusCnt> riskStatusCntAll(String dept);
	public ArrayList<RiskMonthly> riskMonthlyAll(String dept);
	
//common
	public int projectCnt(String dept);
	public ArrayList<ProjectSum> projectList(User user);
	public ArrayList<ProjectSum> bookmarkList(String id);
	public void insertBookmark(ProjectBookmark bm);
	public void deleteBookmark(ProjectBookmark bm);
	public ArrayList<Notice> boardNotice();
}
