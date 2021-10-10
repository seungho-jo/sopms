package sopms.risk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class riskController {
	
	// http://localhost:7080/sopms/risk.do
	@RequestMapping("risk.do")
	public String riskList() {
		
		return "WEB-INF\\view\\risk_Index.jsp";
	}
}	
