package sopms.project.util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownLoadCtrl {
	// http://localhost:7080/board/download.do?fname=@@@;
	@RequestMapping("boarddownload.do")
	public String download(@RequestParam("bfname") String bfname, Model d) {
		d.addAttribute("boardFile", bfname);
		return "boarddownloadViewer";
	}
}
