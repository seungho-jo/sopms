package sopms.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.project.dao.projectDao;
import sopms.vo.Project;

@Service
public class projectService {
	@Autowired(required = false)
	private projectDao dao;
	
	public void insertProject(Project ins) {
		dao.insertProject(ins);
	}
	public void insertProject_dept(Project ins) {
		String[] depts = ins.getDept().split(",");
		for(int i=0; i<depts.length; i++) {
			dao.insertProject_dept(ins);
		}
		
	}
}
