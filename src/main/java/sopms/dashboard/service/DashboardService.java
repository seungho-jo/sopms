package sopms.dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import sopms.dashboard.dao.DashboardDao;
import sopms.vo.DashboardCnt;
import sopms.vo.User;

@Service
public class DashboardService {
	@Autowired
	DashboardDao dao;
	public DashboardCnt getCount(User user) {
		Gson gson = new Gson();
		DashboardCnt dbCnt = new DashboardCnt();
		
		dbCnt.setProjectCnt(dao.projectCnt(user.getDept()));
		if(user.getDept().equals("부장")) {
			dbCnt.setTaskCntAll(dao.taskCntAll(user.getName()));
			dbCnt.setTaskReqCnt(dao.taskReqCnt(user.getName()));
			dbCnt.setRiskCntAll(dao.riskCntAll(user.getDept()));
		}else {
			dbCnt.setTaskCnt(dao.taskCnt(user.getName()));
			dbCnt.setRiskCnt(dao.riskCnt(user.getId()));
		}
		System.out.println("return:"+gson.toJson(dbCnt));
		return dbCnt;
	}
}
