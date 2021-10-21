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
		insertProject_dept(ins);
		dao.insertWbs(ins);
	}
	public void insertProject_dept(Project ins) {
		String[] depts = ins.getDept().split(",");
		System.out.println(depts.length);
		for(int i=0; i<depts.length; i++) {
			ins.setDept(depts[i]);
			dao.insertProject_dept(ins);
		}
		
	}
	public void update(Project upt) {
		dao.deleteProject_dept(upt);
		dao.updateProject(upt);			
	}	
	
	public void update_dept(Project upt) {
		String[] deptss = upt.getDept().split(",");
		System.out.println(deptss.length);
		for(int i=0; i<deptss.length; i++) {
			upt.setDept(deptss[i]);
			dao.updateProject_dept(upt);
		}		
	}	
	public void deleteProject(int pcode) {
		dao.deleteProject(pcode);
	}		
	public Project getProject(int pcode) {
		Project b = dao.getProject(pcode);
		return b;
	}
	
}
