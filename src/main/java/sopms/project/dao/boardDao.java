package sopms.project.dao;

import java.util.ArrayList;

import sopms.vo.Board;
import sopms.vo.BoardSch;

public interface boardDao {
	public void insertBoard(Board ins);
	public void uptReadCnt(int bcode);
	public ArrayList<Board> boardList(BoardSch sch);
	public int totCnt(BoardSch sch);
	public Board getBoard(int bcode);
}
