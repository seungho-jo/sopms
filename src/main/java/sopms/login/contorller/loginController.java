package sopms.login.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.login.service.loginService;
import sopms.vo.User;

@Controller
public class loginController {
	@Autowired
	private loginService service;
	// http://localhost:7080/sopms/index.do
	@RequestMapping("index.do")
	public String index(HttpServletRequest request,Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			session.removeAttribute("msg");
			d.addAttribute("msg", "이미 로그인 하였습니다");
			return "forward:/dashboard.do";
		}else {
			return "WEB-INF\\view\\index.jsp";
		}
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,Model d,User user) {
		HttpSession session = request.getSession();
		if(service.login(user)!=null) {
			session.removeAttribute("msg");
			session.setAttribute("user", service.login(user));
			return "forward:/dashboard.do";
		}else {
			session.setAttribute("msg", "로그인 실패");
			return "WEB-INF\\view\\index.jsp";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}
	
	@RequestMapping("myPage.do")
	public String myPage(HttpServletRequest request,Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		d.addAttribute("count",service.mypageCount(user.getId()));
		d.addAttribute("pjlist",service.mypagePj(user.getId()));
		d.addAttribute("wklist",service.mypageWork(user.getId()));
		return "WEB-INF\\view\\myPage.jsp";
	}
}
