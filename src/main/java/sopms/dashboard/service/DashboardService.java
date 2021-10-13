package sopms.dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.dashboard.dao.DashboardDao;

@Service
public class DashboardService {
	@Autowired
	DashboardDao dao;
	public int projectCnt(int empno) {
		return dao.projectCnt(empno);
	}
	public int taskCnt(int empno) {
		return dao.taskCnt(empno);
	}
	public int riskCnt(int empno) {
		return dao.riskCnt(empno);
	}
	public int outputCnt(int empno) {
		return dao.outputCnt(empno);
	}
}
