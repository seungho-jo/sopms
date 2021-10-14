package sopms.risk.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sopms.risk.dao.riskDao;
import sopms.vo.Project;
import sopms.vo.Risk;
import sopms.vo.riskSch;

@Service
public class riskService {
	@Autowired(required=false)
	private riskDao dao;
	
	public ArrayList<Risk> getRiskList(String risk_name){
		if(risk_name == null) risk_name = "";
		
		return dao.riskList(risk_name);
	}
	
	public ArrayList<Risk> getRiskListPaging(riskSch sch){
		if(sch.getRisk_name() == null) sch.setRisk_name("");
		if(sch.getId()==null) sch.setId("");
		sch.setCount(dao.totCnt(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		
		sch.setPageCount((int)Math.ceil(
				sch.getCount()/(double)sch.getPageSize() ));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		System.out.println("현재 페이지 번호:"+sch.getCurPage());
		System.out.println("총 페이지 수 : "+sch.getPageCount());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		System.out.println(sch.getStart());
		System.out.println(sch.getEnd());
		
		// 블럭 처리.
		// 1. 블럭 크기 지정.
		sch.setBlockSize(5);
		// 2. blocknum 지정 : 현재페이지번호/블럭의 크기
		int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
		// 3. 마지막 블럭번호..
		//    총페이지수가 23 ==> 한번에 보여줄 block의 수가 5   25로 나와 에러가 발생.
		//    마지막 블럭번호는 총페이지수를 넘지 못하게 처리..
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock =sch.getPageCount(); 
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		
		return dao.riskListPaging(sch);
	}
	// 리스크 등록
	public void insertRisk(Risk rk) { 
		System.out.println("넘어온 Pcodes : "+rk.getPcodeS());
		System.out.println("넘어온 Pcodes : "+rk.getPcodeS().getClass().getName());
		
		rk.setPcode(Integer.parseInt(rk.getPcodeS()));
		System.out.println("변경된 값 : "+rk.getPcode());
		
		dao.insertRisk(rk);
	}

	// 페이지이동
	public ArrayList<Project> projectList(String id){
		return dao.projectList(id);
	}
}
