package sopms.dashboard.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import sopms.vo.Notice;

@Repository
public interface DashboardDao {
	public int projectCnt(int empno);
	public int taskCnt(int empno);
	public int riskCnt(int empno);
	public int outputCnt(int empno);
	public int projectList(int empno);
	public ArrayList<Notice> noticeList(int empno);
	public void riskClass(int empno);
	public void riskMonthly(int empno);
}
