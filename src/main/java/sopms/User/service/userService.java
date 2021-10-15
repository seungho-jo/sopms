package sopms.User.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.User.dao.userDao;
import sopms.vo.User;
import sopms.vo.userSch;

@Service
public class userService {
	
	@Autowired
	private userDao dao;
	
	public void deleteUser(String id) {
		dao.deleteMemberRisk(id);
		dao.deleteMember(id);
	}
	
	public void insertUser(User ins){//회원등록
		
		 dao.insertUser(ins);
	}
	
//	public ArrayList<User> getUserList(String name){
//		if(name==null) name = ""; //이름검색시 없을때 
		
//		return dao.userList(name);
//	}
	public ArrayList<User> getUserListPaging(userSch sch){
		if(sch.getName() == null) sch.setName("");
		sch.setPageSize(10);
		sch.setCount(dao.totCnt(sch));
		
		sch.setPageCount((int)Math.ceil( //페이지수 올림처리
				sch.getCount()/(double)sch.getPageSize() ));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 현재 페이지는 총 페이지수를 넘지 못한다.
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}		
		System.out.println("현재 페이지 번호:"+sch.getCurPage());//1
		System.out.println("총 페이지수:"+sch.getPageCount());//3
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		System.out.println(sch.getStart()); //1
		System.out.println(sch.getEnd());//10
		// 블럭 처리.
				// 1. 블럭 크기 지정.
				sch.setBlockSize(5);
				// 2. blocknum 지정 : 현재페이지번호/블럭의 크기
				int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
				// 3. 마지막 블럭번호..
				//    총페이지수가 23 ==> 한번에 보여줄 block의 수가 5   25로 나와 에러가 발생.
				//    마지막 블럭번호는 총페이지수를 넘지 못하게 처리..
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock =sch.getPageCount(); 
				}
				sch.setEndBlock(endBlock);
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);

		return  dao.userListPaging(sch);
	}
}