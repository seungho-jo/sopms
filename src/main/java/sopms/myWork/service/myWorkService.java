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
import sopms.vo.Work;
import sopms.vo.WorkFile;
import sopms.vo.WorkSch;

@Service
public class myWorkService {

	@Autowired
	private myWorkDao dao;

	public ArrayList<Work> myWorkList(WorkSch worksch) {
		if (worksch.getTitle() == null)
			worksch.setTitle("");
		if (worksch.getStatus() == null)
			worksch.setStatus("");
		worksch.setCount(dao.myWorkCount(worksch.getManager()));
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
		return dao.myWorkList(worksch);
	}

	public Work detailWork(int workcode) {
		return dao.detailWork(workcode);
	}

	public void approval(Work work) {
		if (work.getApprmsg() == null)
			work.setApprmsg("");
		if (work.getCompmsg() == null)
			work.setCompmsg("");
		uploadFile(work.getWorkcode(),work.getReport());
		dao.approval(work);
	}

	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;

	private void uploadFile(int no, MultipartFile report) {
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
}
