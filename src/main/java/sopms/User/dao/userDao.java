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
	public ArrayList<User> resource(String pcode);
	public void resourcememberDelete(String id); //리소스 멤버 삭제
	public ArrayList<String> resourceModal1(String pcode);//리소스 모달 리스트1
	public ArrayList<User> resourceModal2(User user);//리소스 모달 리스트2
	public void resource2(User user); //리소스 모달에서 등록한 회원이 리소스에 등록 
}