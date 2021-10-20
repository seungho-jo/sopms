package sopms.project.dao;

import java.util.ArrayList;

import sopms.vo.Board;
import sopms.vo.BoardFile;
import sopms.vo.BoardSch;

public interface boardDao {
	public void insertBoard(Board ins);
	public void uptReadCnt(int bcode);
	public ArrayList<Board> boardList(BoardSch sch);
	public int totCnt(BoardSch sch);
	public Board getBoard(int bcode);
	public void updateBoard(Board upt);
	public void updateBoard_file(Board upt);
	public void deleteBoard(int bcode);
	public void uploadFile(BoardFile ins);
	public String getBoardFile(int bcode);
}
