package sopms.risk.dao;

import java.util.ArrayList;

import sopms.vo.OutPut;
import sopms.vo.Project;
import sopms.vo.Risk;
import sopms.vo.User;
import sopms.vo.riskJochi;
import sopms.vo.riskSch;

public interface riskDao {

	public int totCnt(riskSch sch);
	public ArrayList<Risk> riskListPaging(riskSch sch);
	
	public void insertRisk(Risk rk);
	
	public ArrayList<Project> projectList(String id);
	public Risk detailRiskPaging(int risk_no);
	public void upReadCnt (int risk_no);
	public Project getProject (int pcode);
	// 리스크 상세페이지 삭제
	public void deleteDetailRiskPage(int risk_no);
	// 조치 테이블 삭제
	public void delDetailJochi(int risk_no);
	// 모달 창 내용 업데이트
	public void uptModalContent( Risk rk);
	
	// 업데이트로 인해 상태 변화 
	public void uptRiskStatus(Risk rk);
	// 입력 받은 조치내역 출력
	public riskJochi riskJochiSelect(int riskNum);
	
	// 프로젝트 리스크 출력
	public ArrayList<Risk> projRiskList(int pcode);
	// 프로젝트 페이징 처리
	public ArrayList<Risk> outputList01(OutPut outputs);
	public int outputCnt(int pcode);
	// PM일 경우 조치자 선택
	public ArrayList<User> getUserJochi(int pcode);
	// PM이 조치자 권한 넘김
	public void jochiAuthority(Risk rk);
	// pm일 경우 리스크 등록 select box 표기
	public ArrayList<Risk> getjochiPcode(int pcode);

}
