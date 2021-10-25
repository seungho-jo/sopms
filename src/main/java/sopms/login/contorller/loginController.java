package sopms.login.contorller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import sopms.login.service.loginService;
import sopms.vo.User;

@Controller
public class loginController {
	@Autowired
	private loginService service;
	// 컨테이너에 선언된 객체..
	@Autowired(required = false)
	private LocaleResolver localResolver;
	
	// http://localhost:7080/sopms/index.do
	@RequestMapping("index.do")
	public String index(HttpServletRequest request,Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user!=null) {
			d.addAttribute("msg", "이미 로그인 하셨습니다");
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
	
	@RequestMapping("/choiceLan.do")
	public String choice(@RequestParam("lang") String lang,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("선택한 언어:"+lang);
		// 해당되는 선택 언어가 message폴드 하위에 있는 다국어 선택 파일을 
		// 지정해서, 해당 위치/시간에 해당하는 언어가 나오게 된다.
		Locale locale = new Locale(lang);
		localResolver.setLocale(request,response, locale);
		return "WEB-INF\\view\\index.jsp";
	}	
	// http://localhost:7080/springweb/multi2.do
	@RequestMapping("/multi2.do")
	public String multi2(@RequestParam(value="lang",
							defaultValue = "ko") String lang,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("선택한 언어:"+lang);
		Locale locale = new Locale(lang);
		localResolver.setLocale(request,response, locale);
		return "WEB-INF\\view\\index.jsp";
	}	
}
