package sopms.User.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import sopms.User.service.userService;
import sopms.vo.User;
import sopms.vo.userSch;

@Controller
//http://localhost:7080/sopms/userList.do
public class userController {
	@Autowired
	private userService service;
		@RequestMapping("userList.do")
	public String userList(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp";
	}
		
	/*	@RequestMapping("userListAjax.do") 
		public String userList2(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp"; 
	}
	*/
	
	//http://localhost:7080/sopms/pageList.do
	@RequestMapping("pageList.do") //페이징 처리
	public String userList2(userSch sch,Model d) { 
		d.addAttribute("list",service.getUserListPaging(sch));
		return "WEB-INF\\view\\userList.jsp";
	}  
	     
	@RequestMapping("Insertpage.do") //사용자등록버튼 누르면 페이지이동
	public String Insertpage() {
		return "WEB-INF\\view\\userRegister.jsp";
	}
	
	
	//http://localhost:7080/sopms/memberInsert.do
	@RequestMapping("memberInsert.do") //사용자등록버튼 눌렀을때 db처리 
	public String regMemberForm(User user, Model d) {
		System.out.println(user.getId()+":,"+user.getPass()+","+user.getName()+","+user.getDept());
		service.insertUser(user); //성공했을때
			
		return "redirect:/pageList.do";
	}

		
	
	
	
	
	
	
}
	
	
	
	