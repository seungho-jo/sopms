package sopms.User.dao;

import java.util.ArrayList;

import sopms.vo.User;
import sopms.vo.userSch;

public interface userDao {
	//public ArrayList<User> userList(String name); //String name
	public ArrayList<User> userListPaging(userSch sch);
	public int totCnt(userSch sch);
	public void insertUser(User ins); //사용자초기등록
	public void deleteMember(String id); //삭제
	public void deleteMemberRisk(String id); //회원 , 리스크까지 삭제 
	
	
}