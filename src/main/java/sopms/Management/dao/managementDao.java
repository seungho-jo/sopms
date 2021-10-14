package sopms.Management.dao;

import java.util.ArrayList;

import sopms.vo.Project_List;
import sopms.vo.Project_List_paging;



public interface managementDao {
	public int projectCount(String pm);
	public ArrayList<Project_List> projectList(Project_List_paging project_Lp);
}

