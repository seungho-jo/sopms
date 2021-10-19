package sopms.risk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopms.risk.service.riskService;

@Controller
public class projectRiskController {
	@Autowired
	private riskService service;
	
	// 프로젝트 화면에 리스크 출력.
	// http://localhost:7080/sopms/projectRisk.do?pcode=2
		@RequestMapping(value="projectRisk.do", produces="application/text; charset=utf-8")
		public String projectRiskList(@RequestParam("pcode") String pcode, Model d) {
			System.out.println("프로젝트 리스크 pcode : "+pcode);
			d.addAttribute("rlist",service.projRiskList(Integer.parseInt(pcode)));
			
			return "pageJsonReport";
		}
}
