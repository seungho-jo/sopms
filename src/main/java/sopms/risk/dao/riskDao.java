package sopms.risk.dao;

import java.util.ArrayList;


import sopms.vo.Project;
import sopms.vo.Risk;
import sopms.vo.riskJochi;
import sopms.vo.riskSch;

public interface riskDao {
	public ArrayList<Risk> riskList(String risk_name);
	public int totCnt(riskSch sch);
	public ArrayList<Risk> riskListPaging(riskSch sch);
	
	public void insertRisk(Risk rk);
	public void deleteDetailRiskPage(int risk_no);
	public ArrayList<Project> projectList(String id);
	public Risk detailRiskPaging(int risk_no);
	public void upReadCnt (int risk_no);
	public Project getProject (int pcode);
	
	// 모달 창 내용 업데이트
	public void uptModalContent( Risk rk);
	
	// 업데이트로 인해 상태 변화 
	public void uptRiskStatus(Risk rk);
	// 입력 받은 조치내역 출력
	public riskJochi riskJochiSelect(int riskNum);
}
