package sopms.vo;

public class User {
	private String name;
	private String id; 
	private String pass;
	private String rank; //직급
	private String dept; //부서 
	private String insertDay; //사원을 등록한 날짜 

	//리소스 부분 합쳐도 되고 따로작성해도됨 
	private int pcode;
	
	private String insertpjDay; // 투입날짜 
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	//리스트부분
	private int cnt;
	private int no; // 리스트 목록 번호 
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(String insertDay) {
		this.insertDay = insertDay;
	}
	public String getInsertpjDay() {
		return insertpjDay;
	}
	
	@Override
	public String toString() {
		return "User [name=" + name + ", id=" + id + ", pass=" + pass + ", rank=" + rank + ", dept=" + dept
				+ ", insertDay=" + insertDay + ", pcode=" + pcode + ", insertpjDay=" + insertpjDay + ", cnt=" + cnt
				+ ", no=" + no + "]";
	}
	public void setInsertpjDay(String insertpjDay) {
		this.insertpjDay = insertpjDay;
	}
	
	
	
	
	
	
	
}
