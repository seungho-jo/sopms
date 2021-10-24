package sopms.vo;

import org.springframework.web.multipart.MultipartFile;

public class Work {
	private int no;
	private String workcode;
	private String title;
	private String content;
	private String start_date;
	private String end_date;
	private int duration;
	private String pm;
	private String manager;
	private int spcode;
	private int parent;
	private String status;
	private String reqmsg;
	private String apprmsg;
	private String compmsg;
	private String reqdate;
	private String uptdate;
	private String apprdate;
	private MultipartFile report;
	private String fname;
	private String pm_name;
	private String m_name;
	private String pname;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWorkcode() {
		return workcode;
	}
	public void setWorkcode(String workcode) {
		this.workcode = workcode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getSpcode() {
		return spcode;
	}
	public void setSpcode(int spcode) {
		this.spcode = spcode;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReqmsg() {
		return reqmsg;
	}
	public void setReqmsg(String reqmsg) {
		this.reqmsg = reqmsg;
	}
	public String getApprmsg() {
		return apprmsg;
	}
	public void setApprmsg(String apprmsg) {
		this.apprmsg = apprmsg;
	}
	public String getCompmsg() {
		return compmsg;
	}
	public void setCompmsg(String compmsg) {
		this.compmsg = compmsg;
	}
	public String getReqdate() {
		return reqdate;
	}
	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}
	public String getUptdate() {
		return uptdate;
	}
	public void setUptdate(String uptdate) {
		this.uptdate = uptdate;
	}
	public String getApprdate() {
		return apprdate;
	}
	public void setApprdate(String apprdate) {
		this.apprdate = apprdate;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPm_name() {
		return pm_name;
	}
	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

}