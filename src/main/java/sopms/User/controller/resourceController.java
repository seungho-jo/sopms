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
public class resourceController {
	@Autowired
	private userService service;
	
	// http://localhost:7080/sopms/projectStatus_resource.do?pcode=2
	// http://localhost:7080/sopms/resourcememberDelete.do?id=happy10&pcode=2
	
	@RequestMapping("projectStatus_resource.do")
	public String projectStatus_resource(Model d, String pcode) {
		d.addAttribute("resourceList",service.resource(pcode));
		
		return "pageJsonReport";
	}
	@RequestMapping("resourcememberDelete.do")
	public String resourcememberDelete(@RequestParam("id") String id, String pcode ) {
		System.out.println("삭제할 이름:"+id);
		service.resourcememberDelete(id);
		
		return "forward:/projectStatus_resource.do";
	}
	@RequestMapping("resourceModal.do")
	public String resourceModal(Model d, String pcode) {
		d.addAttribute("modalList",service.resourceModal(pcode));
		
		return "pageJsonReport";
	}
	@RequestMapping("resourceModalReg.do")
	public String resourceModalReg(User user) {
		service.resource2(user);
		return "forward:/projectStatus_resource.do";
	}
	
}

	
	
	
	
	
	
	
