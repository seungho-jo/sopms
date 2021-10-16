package sopms.dashboard.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import sopms.vo.Notice;
import sopms.vo.User;

@Repository
public interface DashboardDao {
	//일반 dashboard
	public int projectCnt(String dept);
	public int taskCnt(String name);	//name -> id 수정예정
	public int riskCnt(String id);
	public int outputCnt(String name);	//name -> id 수정예정
	
	//PM dashboard
	public int taskCntAll(String name);	//name -> id 수정예정
	public int riskCntAll(String dept);
	public int taskReqCnt(String name);	//name -> id 수정예정
	public int outputCntAll(String name);
	
	public int projectList(int empno);
	public ArrayList<Notice> noticeList(int empno);
	public void riskClass(int empno);
	public void riskMonthly(int empno);
}
