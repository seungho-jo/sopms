package sopms.login.dao;

import sopms.vo.MyPage;
import sopms.vo.User;

public interface loginDao {
	public User login(User user);
	public MyPage mypageCount(String id);
	public MyPage mypagePj(String id);
	public MyPage mypageWork(String id);
}
