package sopms.vo;

public class riskSch {
	// 요청값과 로직을 통해서 검색을 위한 vo
	// 1. 검색 : 제목/작성자
	private String risk_name;	// 리스크명
	private String id;
	private String name;	// 등록자명
	
	// 2. 페이징 처리를 위한 속성.
	private int count; // 총데이터 건수
	private int pageSize; // 한번에 보여줄 페이지 크기.
	private int pageCount;	// 총 페이지 수 count/pageSize
	private int curPage; // 클릭한 현재페이지번호.
	private int start;	// 현재 페이지 시작 번호
	private int end;	// 현재 페이지의 마지막 번호.
	
	// 3. 블록 처리 속성.
	private int blockSize; 	// 한번에 보여줄 block의 크기
	private int startBlock;	// block의 시작번호
	private int endBlock;	// block의 마지막번호
	
	
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public String getRisk_name() {
		return risk_name;
	}
	public void setRisk_name(String risk_name) {
		this.risk_name = risk_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
