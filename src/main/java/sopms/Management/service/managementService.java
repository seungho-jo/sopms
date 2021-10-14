package sopms.Management.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.Management.dao.managementDao;
import sopms.vo.Project_List;
import sopms.vo.Project_List_paging;

@Service
public class managementService {
	@Autowired
	private managementDao dao;
	public ArrayList<Project_List> getProjectList(Project_List_paging project_Lp){
		project_Lp.setCount(dao.projectCount(project_Lp.getPm()));
			if(project_Lp.getPageSize()==0) {
				project_Lp.setPageSize(5);
			}
			project_Lp.setPageCount((int)Math.ceil( 
					project_Lp.getCount()/(double)project_Lp.getPageSize() ));
			if(project_Lp.getCurPage()==0) {
				project_Lp.setCurPage(1);
			}
			if(project_Lp.getCurPage()>project_Lp.getPageCount()) {
				project_Lp.setCurPage(project_Lp.getPageCount());
			}
			
			project_Lp.setStart((project_Lp.getCurPage()-1)*project_Lp.getPageSize()+1);
			project_Lp.setEnd(project_Lp.getCurPage()*project_Lp.getPageSize());
			project_Lp.setBlockSize(10);
			int blocknum = (int)(Math.ceil(project_Lp.getCurPage()/(double)project_Lp.getBlockSize()));
			int endBlock = blocknum*project_Lp.getBlockSize();
			
			if(endBlock>project_Lp.getPageCount()) {
				endBlock =project_Lp.getPageCount(); 
			}
			
			project_Lp.setEndBlock(endBlock);
			project_Lp.setStartBlock((blocknum-1)*project_Lp.getBlockSize()+1);
			
		return dao.projectList(project_Lp);
	}
	
}
