package sopms.vo;

public class Risk {
	private String risk_no;  //리스크번호
	private String risk_name;	// 리스크명
	private String risk_content;	// 리스크 내용
	private String risk_reg;	// 리스크 등록일 
	private String risk_upt;	// 리스크 수정일
	private int risk_status;	// 리스크 상태
	private int risk_cnt;	// 리스크 조회수
	private String id;	// 사용자 테이블 id
	public Risk() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Risk(String risk_no, String risk_name, String risk_content, String risk_reg, String risk_upt,
			int risk_status, int risk_cnt, String id) {
		super();
		this.risk_no = risk_no;
		this.risk_name = risk_name;
		this.risk_content = risk_content;
		this.risk_reg = risk_reg;
		this.risk_upt = risk_upt;
		this.risk_status = risk_status;
		this.risk_cnt = risk_cnt;
		this.id = id;
	}
	public String getRisk_no() {
		return risk_no;
	}
	public void setRisk_no(String risk_no) {
		this.risk_no = risk_no;
	}
	public String getRisk_name() {
		return risk_name;
	}
	public void setRisk_name(String risk_name) {
		this.risk_name = risk_name;
	}
	public String getRisk_content() {
		return risk_content;
	}
	public void setRisk_content(String risk_content) {
		this.risk_content = risk_content;
	}
	public String getRisk_reg() {
		return risk_reg;
	}
	public void setRisk_reg(String risk_reg) {
		this.risk_reg = risk_reg;
	}
	public String getRisk_upt() {
		return risk_upt;
	}
	public void setRisk_upt(String risk_upt) {
		this.risk_upt = risk_upt;
	}
	public int getRisk_status() {
		return risk_status;
	}
	public void setRisk_status(int risk_status) {
		this.risk_status = risk_status;
	}
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
	
	
	
}
