package sopms.login.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.login.dao.loginDao;
import sopms.vo.MyPage;
import sopms.vo.User;

@Service
public class loginService {
	@Autowired
	private loginDao dao;
	public User login(User user) {
		return dao.login(user);
	}
	public MyPage mypageCount(String id) {
		return dao.mypageCount(id);
	}
	public ArrayList<MyPage> mypagePj(String id) {
		return dao.mypagePj(id);
	}
	public ArrayList<MyPage> mypageWork(String id) {
		return dao.mypageWork(id);
	}
}
