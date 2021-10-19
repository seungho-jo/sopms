package sopms.vo;

//dashboard project 즐겨찾기 VO
public class ProjectBookmark {
	private int pcode;
	private String id;
	
	public ProjectBookmark(int pcode, String id) {
		super();
		this.pcode = pcode;
		this.id = id;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
