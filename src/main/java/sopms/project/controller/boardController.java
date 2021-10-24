package sopms.project.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopms.project.service.boardService;
import sopms.vo.Board;
import sopms.vo.BoardSch;
import sopms.vo.User;

@Controller
@RequestMapping("board.do")
public class boardController {
	@Autowired(required = false)
	private boardService service;	
	// http://localhost:7080/sopms/board.do?method=insertform
	@RequestMapping(params = "method=insertform")
	public String boardInsertform(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user.getRank().equals("부장")||user.getDept().equals("인사팀")) {
			return "WEB-INF\\view\\projectboard_Insert.jsp";
		} else {
			d.addAttribute("msg", "접근권한이 없습니다.");
			return "forward:/board.do?method=list";	
		}	
	}
	
	@RequestMapping(params = "method=insert")
	public String boardInsert(HttpServletRequest request, Board board) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		board.setId(user.getId());
		service.insertBoard(board);
		return "redirect:/board.do?method=list";
	}
	
	// http://localhost:7080/sopms/board.do?method=list
	@RequestMapping(params="method=list")
	public String boardList(BoardSch board, Model d) { 
		d.addAttribute("list", service.boardList( board ));
		return "WEB-INF\\view\\projectboard_List.jsp";
	}	
	
	// http://localhost:7080/sopms/board.do?method=detail&bcode=1
	@RequestMapping(params="method=detail")
	public String boardDetail(@RequestParam("bcode") int bcode, Model d) {	
		d.addAttribute("board", service.getBoard( bcode ));
		return "WEB-INF\\view\\projectboard_Detail.jsp";
	}	
	
	// http://localhost:7080/sopms/board.do?method=updateform
	@RequestMapping(params = "method=updateform")
	public String boardUpdateForm(@RequestParam("bcode") int bcode,HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user.getRank().equals("부장")||user.getDept().equals("인사팀")) {
			d.addAttribute("board", service.getBoard(bcode));
			return "WEB-INF\\view\\projectboard_Update.jsp";
		} else {
			d.addAttribute("msg", "접근권한이 없습니다.");
			return "WEB-INF\\view\\main.jsp";

		}
			
	}

	// http://localhost:7080/sopms/board.do?method=update
	@RequestMapping(params = "method=update")
	public String boardUpdate(Board upt) {
		service.update(upt);
		service.updatefile(upt);
		return "redirect:/board.do?method=list";
	}

	// http://localhost:7080/sopms/board.do?method=delete
	@RequestMapping(params = "method=delete")
	public String deleteBoard(@RequestParam("bcode") int bcode) {
		service.deleteBoard(bcode);
		return "redirect:/board.do?method=list";
	}
	

}
