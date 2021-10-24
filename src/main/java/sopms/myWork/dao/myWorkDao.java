package sopms.myWork.dao;

import java.util.ArrayList;

import sopms.vo.OutPut;
import sopms.vo.Work;
import sopms.vo.WorkFile;
import sopms.vo.WorkPmSch;
import sopms.vo.WorkSch;

public interface myWorkDao {
	// 일반직원
	public int myWorkCount(WorkSch worksch);
	public ArrayList<Work> myWorkList(WorkSch worksch);
	public Work detailWork(int workcode);
	public void request(Work work);
	public void uploadfile(WorkFile workfile);
	// pm
	public int myWorkPmCount(String name);
	public ArrayList<Work> myWorkListPm(WorkPmSch workpmsch);
	public Work detailWorkPm(int workcode);
	public void statusUpt(Work work);
	public void compUpt(Work work);
	public void apprUpt(Work work);
	// 산출물
	public ArrayList<Work> outputList(OutPut outputs);
	public int outputCnt(int pcode);
}


