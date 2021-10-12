package sopms.risk.dao;

import java.util.ArrayList;

import sopms.vo.Risk;
import sopms.vo.riskSch;

public interface riskDao {
	public ArrayList<Risk> riskList(String risk_name);
	public int totCnt(riskSch sch);
	public ArrayList<Risk> riskListPaging(riskSch sch);
}
