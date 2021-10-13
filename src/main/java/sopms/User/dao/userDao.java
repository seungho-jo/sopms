package sopms.User.dao;

import java.util.ArrayList;

import sopms.vo.User;
import sopms.vo.userSch;

public interface userDao {
	public ArrayList<User> userList(String name); //String name
	public int totCnt(userSch sch);
	public ArrayList<User> userListPaging(userSch sch);
	public void insertUser(User ins); //사용자초기등록
	
}