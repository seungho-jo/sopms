package sopms.vo;

public class Project_List {
	private String pcode;
	private String pname;
	private String id;
	private String startdate;
	private String enddate;
	private String teamnum;
	private String status;
	private String explanation;
	private int risk_cnt;
	
	public int getRisk_cnt() {
		return risk_cnt;
	}
	public void setRisk_cnt(int risk_cnt) {
		this.risk_cnt = risk_cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getTeamnum() {
		return teamnum;
	}
	public void setTeamnum(String teamnum) {
		this.teamnum = teamnum;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
}
