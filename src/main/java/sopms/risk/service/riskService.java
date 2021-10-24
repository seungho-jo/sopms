package sopms.risk.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import sopms.risk.dao.riskDao;
import sopms.vo.OutPut;
import sopms.vo.Project;
import sopms.vo.Risk;
import sopms.vo.User;
import sopms.vo.riskJochi;
import sopms.vo.riskSch;

@Service
public class riskService {
	@Autowired(required=false)
	private riskDao dao;
	
	public ArrayList<Risk> getRiskListPaging(riskSch sch){
		if(sch.getRisk_name() == null) sch.setRisk_name("");
		if(sch.getName()==null) sch.setName("");
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
		if(sch.getStartBlock()<0) {
			sch.setStartBlock(1);
		}
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
	// PM일 경우 조치자 선택
	public ArrayList<User> getUserJochi(int pcode){
		return dao.getUserJochi(pcode);
	}
	
	// pm이 조치자 선택
	public void jochiAuthority(Risk rk) {
		dao.jochiAuthority(rk);
	}

	// 페이지이동
	public ArrayList<Project> projectList(String id){
		
		return dao.projectList(id);
	}
	
	// 상세페이지 입장
	public Risk detailRiskPaging(int risk_no){
		dao.upReadCnt(risk_no);
		return dao.detailRiskPaging(risk_no);	
	}
	
	// 세부사항 페이지 삭제, 리스크 조치테이블 삭제
	public void deleteDetailRiskPage(int risk_no) {
		dao.delDetailJochi(risk_no);
		dao.deleteDetailRiskPage(risk_no);
	}
	
	// 모달창 입력값을 조치내역에 insert
	// 업데이트로 인한 상태값 변화
	public void uptModalContent(Risk rk) {
		dao.uptModalContent(rk);
		dao.uptRiskStatus(rk);
	}
	// 조치 리스트 춮력
	public riskJochi riskJochiSelect(int riskNum) {
		return dao.riskJochiSelect(riskNum);
	}
	
	// 프로젝트 리스크 출력
	public ArrayList<Risk> projRiskList(int pcode) {
		return dao.projRiskList(pcode);
	}
	
	
	public ArrayList<Risk> outputList01(OutPut outputs){
		outputs.setCount(dao.outputCnt(outputs.getPcode()));
		if (outputs.getPageSize() == 0) {
			outputs.setPageSize(5);
		}
		outputs.setPageCount((int) Math.ceil(outputs.getCount() / (double) outputs.getPageSize()));
		if (outputs.getCurPage() == 0) {
			outputs.setCurPage(1);
		}
		if (outputs.getCurPage() > outputs.getPageCount()) {
			outputs.setCurPage(outputs.getPageCount());
		}
		outputs.setStart((outputs.getCurPage() - 1) * outputs.getPageSize() + 1);
		outputs.setEnd(outputs.getCurPage() * outputs.getPageSize());
		outputs.setBlockSize(10);
		int blocknum = (int) (Math.ceil(outputs.getCurPage() / (double) outputs.getBlockSize()));
		int endBlock = blocknum * outputs.getBlockSize();

		if (endBlock > outputs.getPageCount()) {
			endBlock = outputs.getPageCount();
		}

		outputs.setEndBlock(endBlock);
		outputs.setStartBlock((blocknum - 1) * outputs.getBlockSize() + 1);
		if(outputs.getStartBlock()<0) {
			outputs.setStartBlock(1);
		}
		return dao.outputList01(outputs);
	}
	
	public ArrayList<Risk> getjochiPcode(int pcode){
		return dao.getjochiPcode(pcode);
	}
}
