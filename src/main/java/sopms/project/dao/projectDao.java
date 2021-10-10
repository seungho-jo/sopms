package sopms.project.dao;

import org.springframework.stereotype.Repository;

import sopms.vo.Project;
@Repository
public interface projectDao {
	public void insertProject(Project ins);
	public void insertProject_dept(Project ins);
}
