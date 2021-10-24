package sopms.vo;

import java.util.Date;

public class BoardFile {
		private int bcode;
		private String bfname;
		private Date regdte;
		
		public BoardFile() {
			super();
			// TODO Auto-generated constructor stub
		}
		public BoardFile(String bfname) {
			super();
			this.bfname = bfname;
		}
		public int getBcode() {
			return bcode;
		}

		public void setBcode(int bcode) {
			this.bcode = bcode;
		}

		public String getBfname() {
			return bfname;
		}

		public void setBfname(String bfname) {
			this.bfname = bfname;
		}

		public Date getRegdte() {
			return regdte;
		}

		public void setRegdte(Date regdte) {
			this.regdte = regdte;
		}
		


}
