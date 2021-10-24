package sopms.vo;

//dashboard 프로젝트/작업/리스크/산출물 수 VO
public class DashboardCnt {
	private int projectCnt;
	private int taskCnt;
	private int taskCntAll;		//PM page
	private int taskReqCnt;		//PM page. 승인요청 작업 수
	private int riskCnt;
	private int riskCntAll;		//PM page
	private int outputCnt;
	private int outputCntAll;	//PM page
	
	public DashboardCnt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getProjectCnt() {
		return projectCnt;
	}
	public void setProjectCnt(int projectCnt) {
		this.projectCnt = projectCnt;
	}
	public int getTaskCnt() {
		return taskCnt;
	}
	public void setTaskCnt(int taskCnt) {
		this.taskCnt = taskCnt;
	}
	public int getTaskCntAll() {
		return taskCntAll;
	}
	public void setTaskCntAll(int taskCntAll) {
		this.taskCntAll = taskCntAll;
	}
	public int getTaskReqCnt() {
		return taskReqCnt;
	}
	public void setTaskReqCnt(int taskReqCnt) {
		this.taskReqCnt = taskReqCnt;
	}
	public int getRiskCnt() {
		return riskCnt;
	}
	public void setRiskCnt(int riskCnt) {
		this.riskCnt = riskCnt;
	}
	public int getRiskCntAll() {
		return riskCntAll;
	}
	public void setRiskCntAll(int riskCntAll) {
		this.riskCntAll = riskCntAll;
	}
	public int getOutputCnt() {
		return outputCnt;
	}
	public void setOutputCnt(int outputCnt) {
		this.outputCnt = outputCnt;
	}
	public int getOutputCntAll() {
		return outputCntAll;
	}
	public void setOutputCntAll(int outputCntAll) {
		this.outputCntAll = outputCntAll;
	}
	
}
