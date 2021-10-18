package sopms.vo;

public class BoardSch {
		private String btitle;
		private String name;
		private String id;

		private int count; 
		private int pageSize; 
		private int pageCount; 
		private int curPage;
		private int start;
		private int end;

		private int blockSize; 
		private int startBlock; 
		private int endBlock;
		
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getBtitle() {
			return btitle;
		}
		public void setBtitle(String btitle) {
			this.btitle = btitle;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
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
}
