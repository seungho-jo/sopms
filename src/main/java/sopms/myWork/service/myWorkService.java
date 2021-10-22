package sopms.myWork.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sopms.myWork.dao.myWorkDao;
import sopms.vo.OutPut;
import sopms.vo.Work;
import sopms.vo.WorkFile;
import sopms.vo.WorkPmSch;
import sopms.vo.WorkSch;

@Service
public class myWorkService {

	@Autowired
	private myWorkDao dao;

	// 직원
	public ArrayList<Work> myWorkList(WorkSch worksch) {
		if (worksch.getTitle() == null)
			worksch.setTitle("");
		if (worksch.getStatus() == null)
			worksch.setStatus("");
		if (worksch.getPname() == null)
			worksch.setPname("");
		worksch.setCount(dao.myWorkCount(worksch));
		if (worksch.getPageSize() == 0) {
			worksch.setPageSize(5);
		}
		worksch.setPageCount((int) Math.ceil(worksch.getCount() / (double) worksch.getPageSize()));
		if (worksch.getCurPage() == 0) {
			worksch.setCurPage(1);
		}
		if (worksch.getCurPage() > worksch.getPageCount()) {
			worksch.setCurPage(worksch.getPageCount());
		}
		worksch.setStart((worksch.getCurPage() - 1) * worksch.getPageSize() + 1);
		worksch.setEnd(worksch.getCurPage() * worksch.getPageSize());
		worksch.setBlockSize(10);
		int blocknum = (int) (Math.ceil(worksch.getCurPage() / (double) worksch.getBlockSize()));
		int endBlock = blocknum * worksch.getBlockSize();

		if (endBlock > worksch.getPageCount()) {
			endBlock = worksch.getPageCount();
		}

		worksch.setEndBlock(endBlock);
		worksch.setStartBlock((blocknum - 1) * worksch.getBlockSize() + 1);
		if(worksch.getStartBlock()<0) {
			worksch.setStartBlock(1);
		}
		return dao.myWorkList(worksch);
	}

	public Work detailWork(int workcode) {
		return dao.detailWork(workcode);
	}

	public void approval(Work work) {
		if (work.getReqmsg() == null)
			work.setReqmsg("");
		uploadFile(work.getWorkcode(),work.getReport());
		dao.statusUpt(work);
		dao.request(work);
	}

	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;

	private void uploadFile(String no, MultipartFile report) {
		String fileName = report.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File tmpFile = new File(tmpUpload + fileName);
			File orgFile = new File(upload + fileName);
			try {
				report.transferTo(tmpFile);
				Files.copy(tmpFile.toPath(), orgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		WorkFile upfile = new WorkFile();
		upfile.setWorkcode(no);
		upfile.setFname(fileName);
		dao.uploadfile(upfile);
	}
	
	// pm
	public ArrayList<Work> myWorkListPm(WorkPmSch workpmsch){
		workpmsch.setCount(dao.myWorkPmCount(workpmsch.getName()));
		if (workpmsch.getPageSize() == 0) {
			workpmsch.setPageSize(5);
		}
		workpmsch.setPageCount((int) Math.ceil(workpmsch.getCount() / (double) workpmsch.getPageSize()));
		if (workpmsch.getCurPage() == 0) {
			workpmsch.setCurPage(1);
		}
		if (workpmsch.getCurPage() > workpmsch.getPageCount()) {
			workpmsch.setCurPage(workpmsch.getPageCount());
		}
		workpmsch.setStart((workpmsch.getCurPage() - 1) * workpmsch.getPageSize() + 1);
		workpmsch.setEnd(workpmsch.getCurPage() * workpmsch.getPageSize());
		workpmsch.setBlockSize(10);
		int blocknum = (int) (Math.ceil(workpmsch.getCurPage() / (double) workpmsch.getBlockSize()));
		int endBlock = blocknum * workpmsch.getBlockSize();

		if (endBlock > workpmsch.getPageCount()) {
			endBlock = workpmsch.getPageCount();
		}

		workpmsch.setEndBlock(endBlock);
		workpmsch.setStartBlock((blocknum - 1) * workpmsch.getBlockSize() + 1);
		if(workpmsch.getStartBlock()<0) {
			workpmsch.setStartBlock(1);
		}
		return dao.myWorkListPm(workpmsch);
	}
	
	public Work detailWorkPm(int workcode) {
		return dao.detailWorkPm(workcode);
	}
	
	public void compUpt(Work work) {
		String[] counting = (work.getWorkcode()).split(",");
		for(int i=0;i<counting.length;i++) {
			System.out.println(counting[i]);
			work.setWorkcode(counting[i]);
			dao.statusUpt(work);
			dao.compUpt(work);
		}
	}
	public void apprUpt(Work work) {
		String[] counting = (work.getWorkcode()).split(",");
		for(int i=0;i<counting.length;i++) {
			System.out.println(counting[i]);
			work.setWorkcode(counting[i]);
			dao.statusUpt(work);
			dao.apprUpt(work);
		}
	}
	
	public ArrayList<Work> outputList(OutPut outputs){
		outputs.setCount(dao.outputCnt(outputs.getPcode()));
		if (outputs.getPageSize() == 0) {
			outputs.setPageSize(5);
		}
		outputs.setPageCount((int) Math.ceil(outputs.getCount() / (double) outputs.getPageSize()));
		if (outputs.getCurPage() == 0) {
			outputs.setCurPage(1);
		}
		if (outputs.getCurPage() > outputs.getPageCount()) {
			outputs.setCurPage(outputs.getPageCount());
		}
		outputs.setStart((outputs.getCurPage() - 1) * outputs.getPageSize() + 1);
		outputs.setEnd(outputs.getCurPage() * outputs.getPageSize());
		outputs.setBlockSize(10);
		int blocknum = (int) (Math.ceil(outputs.getCurPage() / (double) outputs.getBlockSize()));
		int endBlock = blocknum * outputs.getBlockSize();

		if (endBlock > outputs.getPageCount()) {
			endBlock = outputs.getPageCount();
		}

		outputs.setEndBlock(endBlock);
		outputs.setStartBlock((blocknum - 1) * outputs.getBlockSize() + 1);
		if(outputs.getStartBlock()<0) {
			outputs.setStartBlock(1);
		}
		return dao.outputList(outputs);
	}
	

}


