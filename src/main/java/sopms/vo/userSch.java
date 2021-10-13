package sopms.vo;

public class userSch {
	// 2. 페이징 처리를 위한 속성.
	private int count; // 총데이터 건수
	private int pageSize; //한번에 보여줄 페이지 크기.
	private int pageCount; // 총 페이지 수 count/pageSize
	private int curPage; //클릭한 현재 페이지번호.
	private int start; //현재 페이지 시작 게시물 번호
	private int end; // 현재 페이지의 마지막 게시물 번호
	private int cnt;
	private int no;
	private String name;
	// 3. 블럭 처리 속성.
	private int blockSize; // 한번에 보여줄 block의 크기
	private int startBlock; // block의 시작번호
	private int endBlock; // block의 마지막번호
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
		
		
		
		
	}
