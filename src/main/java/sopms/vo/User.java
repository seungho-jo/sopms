package sopms.vo;

public class User {
	//나세영
	private String id; 
	private String pass;
	private String name;
	private String rank; //직급
	private String dept; //부서 
	private String insertDay; //사원을 등록한 날짜 
	private String insertpjDay; // 투입날짜 
	//리소스 부분 합쳐도 되고 따로작성해도됨 
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String id, String pass, String name, String rank, String dept, String insertDay, String insertpjDay) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.rank = rank;
		this.dept = dept;
		this.insertDay = insertDay;
		this.insertpjDay = insertpjDay;
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
	public void setInsertpjDay(String insertpjDay) {
		this.insertpjDay = insertpjDay;
	}
	
	
	
	
	
	
	
}
