package sopms.login.dao;

import java.util.ArrayList;

import sopms.vo.MyPage;
import sopms.vo.User;

public interface loginDao {
	public User login(User user);
	public MyPage mypageCount(String id);
	public ArrayList<MyPage> mypagePj(String id);
	public ArrayList<MyPage> mypageWork(String id);
}
