package sopms.vo;
//dashboard 공지사항
public class Notice {
	private String no;
	private String subject;
	private String writer;
	private String date;
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(String no, String subject, String writer, String date) {
		super();
		this.no = no;
		this.subject = subject;
		this.writer = writer;
		this.date = date;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
