package sopms.Management.dao;

import java.util.ArrayList;

import sopms.vo.Project_List;
import sopms.vo.Project_List_paging;
import sopms.vo.User;
import sopms.vo.Work;




public interface managementDao {
	public int projectCount(String pm);
	public ArrayList<Project_List> projectList(Project_List_paging project_Lp);
	public ArrayList<Work> wbslist(int no);
	public void deleteWbs(int id);
	public void deleteWorks(int id);
	public void deleteWorkFile(int id);
	public void updateWbs(Work update);
	public void insertWbs(Work insert);
	public ArrayList<User> resourcelist(int pcode);
	
	public void deleteCal(int id);
	public void updateCal(Work update);
	public void insertCal(Work insert);
}

