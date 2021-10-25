package sopms.vo;

public class Calendar {
	private int id;
	private int workcode;
	private int workcodeSch;
	private String title;
	private String content;
	private String start;
	private String end;
	private String start_hh;
	private String start_mm;
	private String end_hh;
	private String end_mm;
	private boolean allDay;
	private String borderColor;
	private String backgroundColor;
	private String textColor;
	private String pm;
	private String manager;
	private String name;
	private int process;
	private String status;
	private String rank;
	private int parent;
	
	
	public int getWorkcodeSch() {
		return workcodeSch;
	}
	public void setWorkcodeSch(int workcodeSch) {
		this.workcodeSch = workcodeSch;
	}
	public String getStart_hh() {
		return start_hh;
	}
	public void setStart_hh(String start_hh) {
		this.start_hh = start_hh;
	}
	public String getStart_mm() {
		return start_mm;
	}
	public void setStart_mm(String start_mm) {
		this.start_mm = start_mm;
	}
	public String getEnd_hh() {
		return end_hh;
	}
	public void setEnd_hh(String end_hh) {
		this.end_hh = end_hh;
	}
	public String getEnd_mm() {
		return end_mm;
	}
	public void setEnd_mm(String end_mm) {
		this.end_mm = end_mm;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getPm() {
		return pm;
	}
	public void setPm(String pm) {
		this.pm = pm;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWorkcode() {
		return workcode;
	}
	public void setWorkcode(int workcode) {
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
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getProcess() {
		return process;
	}
	public void setProcess(int process) {
		this.process = process;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	
}
