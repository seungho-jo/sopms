package sopms.risk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sopms.risk.service.riskService;
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
			System.out.println("sch.getCuriseagieidddd;;;"+sch.getCurPage());
			d.addAttribute("list",service.getRiskListPaging(sch));
		
			return "WEB-INF\\view\\risk_Index.jsp";
		}  
		
}	
