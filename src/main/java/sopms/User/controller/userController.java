package sopms.User.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopms.User.service.userService;
import sopms.vo.User;
import sopms.vo.userSch;

@Controller
public class userController {
	@Autowired
	private userService service;
	//http://localhost:7080/sopms/pageList.do    
	// 회원리스트 시작
	@RequestMapping("pageList.do") //페이징 처리
	public String userList2(HttpServletRequest request,userSch sch,Model d) { 
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user.getDept().equals("인사팀")) {
			d.addAttribute("list",service.getUserListPaging(sch));
			return "WEB-INF\\view\\userList.jsp";
		}else {
			d.addAttribute("msg","접근 권한이 없습니다.");
			return "forward:/dashboard.do";
		}
	}  
	     
	@RequestMapping("Insertpage.do") //사용자등록버튼 누르면 페이지이동
	public String Insertpage() {
		return "WEB-INF\\view\\userRegister.jsp";
	}
	
	
	//http://localhost:7080/sopms/memberInsert.do
	@RequestMapping("memberInsert.do") //사용자등록버튼 눌렀을때 db처리 
	public String regMemberForm(User user, Model d) {
		System.out.println(user.getId()+":,"+user.getPass()+","+user.getName()+","+user.getDept());
		System.out.println("##################선택한 부서 : "+ user.getDept());
		service.insertUser(user); //성공했을때
			
		return "redirect:/pageList.do";
	}
	
	//http://localhost:7080/sopms/memberDelete.do
	@RequestMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") String id ) {
		System.out.println("삭제할 이름:"+id);
		service.deleteUser(id);
		return "redirect:/pageList.do";
	}

	/*		@RequestMapping("userList.do")
	public String userList(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp";
	}*/
		
	/*	@RequestMapping("userListAjax.do") 
		public String userList2(Model d,String name) { //직원리스트
		d.addAttribute("list",service.getUserList(name));
		return "WEB-INF\\view\\userList.jsp"; 
	}
	*/
	
	
	
}
	
	
	
	