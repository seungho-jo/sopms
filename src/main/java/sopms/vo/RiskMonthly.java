package sopms.vo;

// dashboard 월별 리스크 발생 수 차트
public class RiskMonthly {
	private String month;
	private int count;
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
