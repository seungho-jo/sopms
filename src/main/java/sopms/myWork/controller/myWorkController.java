package sopms.myWork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.myWork.service.myWorkService;
import sopms.vo.User;
import sopms.vo.Work;
import sopms.vo.WorkPmSch;
import sopms.vo.WorkSch;

@Controller
public class myWorkController {
	
	@Autowired
	private myWorkService service;
	
	// 직원
	// http://localhost:7080/sopms/myWork.do
	@RequestMapping("myWork.do")
	public String myWorkList(HttpServletRequest request,Model d,WorkSch worksch,WorkPmSch workpmsch) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(!user.getRank().equals("부장")) {
			worksch.setManager(user.getName());
			d.addAttribute("list", service.myWorkList(worksch));
			return "WEB-INF\\view\\myWork.jsp";
		}else {
			workpmsch.setName(user.getName());
			d.addAttribute("list", service.myWorkListPm(workpmsch));
			return "WEB-INF\\view\\myWorkPm.jsp";
		}
	}
	// http://localhost:7080/sopms/detailWork.do
	@RequestMapping("detailWork.do")
	public String detailWork(Model d,int workcode) {
		d.addAttribute("detail", service.detailWork(workcode));
		return "WEB-INF\\view\\detailWork.jsp";
	}
	@RequestMapping("approval.do")
	public String approval(Work work) {
		service.approval(work);
		return "redirect:/myWork.do";
	}
	
}
