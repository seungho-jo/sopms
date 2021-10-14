package sopms.risk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.risk.service.riskService;
import sopms.vo.Risk;
import sopms.vo.User;
import sopms.vo.riskSch;


@Controller
public class riskController {
	@Autowired(required=false)
	private riskService service;
	// http://localhost:7080/sopms/risk.do
	@RequestMapping("risk.do")
	public String riskList(String risk_name, Model d) {
		d.addAttribute("list", service.getRiskList(risk_name));
		return "WEB-INF\\view\\risk_Index.jsp";
	}
	
	//http://localhost:7080/sopms/riskPageList.do
		@RequestMapping("riskPageList.do") //페이징 처리
		public String riskList2(riskSch sch,Model d) { 
			d.addAttribute("list",service.getRiskListPaging(sch));
		
			return "WEB-INF\\view\\risk_Index.jsp";
		}  
	
	//http://localhost:7080/sopms/insertList.do	
	@RequestMapping("insertList.do")
	public String insertList(){
		return "WEB-INF\\view\\risk_Insert.jsp";
	}
	
	//http://localhost:7080/sopms/insertPageGo.do	
	@RequestMapping("insertPageGo.do")
	public String insertPageGo( HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("login : "+user.getId());
		d.addAttribute("pj", service.projectList(user.getId()));
		return "WEB-INF\\view\\risk_Insert.jsp";
	}
	
	//http://localhost:7080/sopms/insertRisk.do	
		// 등록페이지 등록버튼
		@RequestMapping("insertRisk.do")
		public String riskInsert(HttpServletRequest request, Risk rk) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			rk.setId(user.getId());
			service.insertRisk(rk);
			return "redirect:/riskPageList.do";
		}
}	
