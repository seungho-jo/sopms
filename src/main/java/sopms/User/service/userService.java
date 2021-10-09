package sopms.User.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.User.dao.userDao;
import sopms.vo.User;

@Service
public class userService {
	
	@Autowired
	private userDao dao;
	public ArrayList<User> getUserList(String name){
		if(name==null) name = ""; //이름검색시 없을때 
		
		return dao.userList(name);
				
	}
}
