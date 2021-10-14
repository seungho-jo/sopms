package sopms.project.service;

import java.util.ArrayList;

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
	}
	public void insertProject_dept(Project ins) {
		String[] depts = ins.getDept().split(",");
		System.out.println(depts.length);
		for(int i=0; i<depts.length; i++) {
			ins.setDept(depts[i]);
			dao.insertProject_dept(ins);
		}
		
	}
	public void update(Project update) {
		dao.updateProject(update);
	}	
	public void deleteProject(int pcode) {
		dao.deleteProject(pcode);
	}		
	public Project getProject(int pcode) {
		Project b = dao.getProject(pcode);
		return b;
	}
	ArrayList<Project> projectDeptList(int pcode) {
		ArrayList<Project> c = dao.projectDeptList(pcode);
		return c;
	}
	
}
