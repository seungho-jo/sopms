package sopms.project.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import sopms.project.dao.boardDao;
import sopms.vo.Board;
import sopms.vo.BoardFile;
import sopms.vo.BoardSch;

@Service
public class boardService {

	@Autowired(required = false)
	private boardDao dao;
	
	public ArrayList<Board> boardList(BoardSch sch){
		if(sch.getBtitle()==null) sch.setBtitle("");
		if(sch.getName()==null) sch.setName("");
		sch.setCount(dao.totCnt(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
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
	public Board getBoard(int bcode) {
		dao.uptReadCnt(bcode);
		Board b = dao.getBoard(bcode);
		b.setBfname(dao.getBoardFile(bcode));
		return b;
	}	
	public void update(Board upt) {
		dao.updateBoard(upt);
	}	
	public void updatefile(Board upt) {
		dao.updateBoard_file(upt);
	}	
	public void deleteBoard(int bcode) {
		dao.deleteBoard(bcode);
	}
	
	public void insertBoard(Board ins) {
		System.out.println("#첨부파일#"+ins.getReport().getOriginalFilename());
		dao.insertBoard(ins);
		uploadFile(ins.getBcode(), ins.getReport() );
	}	
	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;
	private void uploadFile(int bcode, MultipartFile report) {
		String fileName = report.getOriginalFilename();
		if(fileName!=null && !fileName.equals("")) {
			File tmpFile = new File(tmpUpload+fileName);
			File orgFile = new File(upload+fileName);
			try {
				report.transferTo(tmpFile);
				Files.copy(tmpFile.toPath(), orgFile.toPath(), 
						StandardCopyOption.REPLACE_EXISTING);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		BoardFile upfile = new BoardFile();
		upfile.setBcode(bcode);
		upfile.setBfname(fileName);
		dao.uploadFile(new BoardFile(fileName));
	}	
}
