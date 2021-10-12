package sopms.projectStatus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import sopms.projectStatus.dao.ProjectStatusSumDao;

@Service
public class ProjectStatusSumService { 
	@Autowired
	private ProjectStatusSumDao sumDao;
	private Gson gson;
	
	public String projectInfoJson(int pcode) {
		gson = new Gson();
		String resultJson = gson.toJson(sumDao.projectInfo(pcode));
		System.out.println("JSON String: "+resultJson);
		return resultJson;
	}
}
