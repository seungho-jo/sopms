package sopms.User.dao;

import java.util.ArrayList;

import sopms.vo.User;

public interface userDao {
	public ArrayList<User> userList(String name);
	//public ArrayList<User> userList(User user);
	public int listCnt(String name);
	
	
}
