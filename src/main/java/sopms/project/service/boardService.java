package sopms.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.project.dao.boardDao;
import sopms.vo.Board;
import sopms.vo.BoardSch;

@Service
public class boardService {

	@Autowired(required = false)
	private boardDao dao;
	public void insertBoard(Board ins) {
		dao.insertBoard(ins);
	}	
	public ArrayList<Board> boardList(BoardSch sch){
		if(sch.getBtitle()==null) sch.setBtitle("");
		if(sch.getName()==null) sch.setName("");
		sch.setCount(dao.totCnt(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		sch.setPageCount( (int)Math.ceil( 
				sch.getCount()/(double)sch.getPageSize() ));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}		
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setBlockSize(5);
		int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
		int endBlock = blocknum*sch.getBlockSize();		
		if(endBlock>sch.getPageCount()) {
			endBlock =sch.getPageCount(); 
		}		
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.boardList(sch);
	}
}
