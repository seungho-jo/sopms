package sopms.myWork.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.myWork.dao.myWorkDao;
import sopms.vo.Work;
import sopms.vo.WorkSch;

@Service
public class myWorkService {
	
	@Autowired
	private myWorkDao dao;
	public ArrayList<Work> myWorkList(WorkSch worksch){
		if(worksch.getTitle() == null) worksch.setTitle("");
		if(worksch.getStatus() == null) worksch.setStatus("");
		worksch.setCount(dao.myWorkCount(worksch.getManager()));
		if(worksch.getPageSize()==0) {
			worksch.setPageSize(5);
		}
		worksch.setPageCount((int)Math.ceil( 
				worksch.getCount()/(double)worksch.getPageSize() ));
		if(worksch.getCurPage()==0) {
			worksch.setCurPage(1);
		}
		if(worksch.getCurPage()>worksch.getPageCount()) {
			worksch.setCurPage(worksch.getPageCount());
		}
		worksch.setStart((worksch.getCurPage()-1)*worksch.getPageSize()+1);
		worksch.setEnd(worksch.getCurPage()*worksch.getPageSize());
		worksch.setBlockSize(10);
		int blocknum = (int)(Math.ceil(worksch.getCurPage()/(double)worksch.getBlockSize()));
		int endBlock = blocknum*worksch.getBlockSize();
		
		if(endBlock>worksch.getPageCount()) {
			endBlock =worksch.getPageCount(); 
		}
		
		worksch.setEndBlock(endBlock);
		worksch.setStartBlock((blocknum-1)*worksch.getBlockSize()+1);
		return dao.myWorkList(worksch);
	}
}
