package sopms.vo;

public class Calendar {
	private int id;
	private int workcode;
	private String title;
	private String content;
	private String start;
	private String end;
	private boolean allday;
	private String color;
	private String pmcolor;
	private String manager;
	private int process;
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
	public boolean isAllday() {
		return allday;
	}
	public void setAllday(boolean allday) {
		this.allday = allday;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPmcolor() {
		return pmcolor;
	}
	public void setPmcolor(String pmcolor) {
		this.pmcolor = pmcolor;
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
	
}
