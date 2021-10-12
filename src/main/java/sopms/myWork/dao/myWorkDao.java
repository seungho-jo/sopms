package sopms.myWork.dao;

import java.util.ArrayList;

import sopms.vo.Work;
import sopms.vo.WorkSch;

public interface myWorkDao {
	public int myWorkCount(String manager);
	public ArrayList<Work> myWorkList(WorkSch worksch);
}
