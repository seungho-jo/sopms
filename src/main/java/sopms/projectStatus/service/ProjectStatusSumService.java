package sopms.projectStatus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import sopms.projectStatus.dao.ProjectStatusSumDao;

@Service
public class ProjectStatusSumService { 
	@Autowired
	private ProjectStatusSumDao sumDao;
	
	public String projectInfoJson(int pcode) {
		Gson gson = new Gson();
		StringBuilder sb = new StringBuilder();
		// project table 데이터를 json 문자열로 변환
		sb.append(
				gson.toJson(sumDao.projectInfo(pcode))
		);
		// project_dept table 속성을 json 문자열에 추가
		sb.insert(
				sb.length()-1,
				",\"dept\":"
		);
		// project_dept table 속성값(배열)을 json 문자열에 추가
		sb.insert(
				sb.length()-1,
				gson.toJson(sumDao.projectDeptList(pcode))
		);
		//개행문자 변환
		String projectInfoJson = new String(sb);
		return projectInfoJson.replace("\\r\\n", "<br>");
	}
}
