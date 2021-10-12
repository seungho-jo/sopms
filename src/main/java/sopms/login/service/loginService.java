package sopms.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.login.dao.loginDao;
import sopms.vo.User;

@Service
public class loginService {
	@Autowired
	private loginDao dao;
	public User login(User user) {
		return dao.login(user);
	}
}
