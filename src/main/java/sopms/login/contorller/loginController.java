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
	public String index() {
		return "WEB-INF\\view\\index.jsp";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,Model d,User user) {
		HttpSession session = request.getSession();
		if(service.login(user)!=null) {
			session.setAttribute("user", service.login(user));
			return "WEB-INF\\view\\main.jsp";
		}else {
			session.setAttribute("msg", "로그인 실패");
			return "WEB-INF\\view\\index.jsp";
		}
	}
	
}
