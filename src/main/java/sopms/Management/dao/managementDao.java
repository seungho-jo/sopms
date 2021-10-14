package sopms.Management.dao;

import java.util.ArrayList;

import sopms.vo.Project_List;
import sopms.vo.Project_List_paging;
import sopms.vo.Work;



public interface managementDao {
	public int projectCount(String pm);
	public ArrayList<Project_List> projectList(Project_List_paging project_Lp);
	public ArrayList<Work> wbslist();
}

