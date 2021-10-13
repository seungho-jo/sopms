package sopms.myWork.dao;

import java.util.ArrayList;

import sopms.vo.Work;
import sopms.vo.WorkFile;
import sopms.vo.WorkPmSch;
import sopms.vo.WorkSch;

public interface myWorkDao {
	// 일반직원
	public int myWorkCount(String manager);
	public ArrayList<Work> myWorkList(WorkSch worksch);
	public Work detailWork(int workcode);
	public void approval(Work work);
	public void uploadfile(WorkFile workfile);
	// pm
	public int myWorkPmCount(String name);
	public ArrayList<Work> myWorkListPm(WorkPmSch workpmsch);
}
