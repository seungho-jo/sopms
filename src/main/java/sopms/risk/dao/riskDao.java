package sopms.risk.dao;

import java.util.ArrayList;

import sopms.vo.Project;
import sopms.vo.Risk;
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
}
