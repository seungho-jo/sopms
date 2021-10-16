package sopms.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "WEB-INF\\view\\projectboard_Insert.jsp";
	}
	
	@RequestMapping(params = "method=insert")
	public String boardInsert(HttpServletRequest request, Board board) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		board.setName(user.getName());
		service.insertBoard(board);
		return "WEB-INF\\view\\project_Insert.jsp";
	}
	
	// http://localhost:7080/sopms/board.do?method=list
	@RequestMapping(params="method=list")
	public String boardList(BoardSch board, Model d) { 
		d.addAttribute("list", service.boardList( board ));
		return "WEB-INF\\view\\projectboard_List.jsp";
	}	
	
	
}
