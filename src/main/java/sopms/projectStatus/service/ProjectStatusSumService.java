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
		String infoJson = gson.toJson(sumDao.projectInfo(pcode));
		String deptJson = gson.toJson(sumDao.projectDeptList(pcode));
		String mergedJson = "{\"info\":"+infoJson+",\"dept\":"+deptJson+"}";
		System.out.println("infoJson: "+infoJson);
		System.out.println("deptJson: "+deptJson);
		System.out.println("merge: "+mergedJson);
		return mergedJson;
	}
}
