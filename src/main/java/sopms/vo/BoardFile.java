package sopms.vo;

import java.util.Date;

public class BoardFile {
		private int bcode;
		private String fname;
		private Date regdte;
		
		public BoardFile() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		public BoardFile(String fname) {
			super();
			this.fname = fname;
		}

		public int getBcode() {
			return bcode;
		}

		public void setBcode(int bcode) {
			this.bcode = bcode;
		}

		public String getFname() {
			return fname;
		}

		public void setFname(String fname) {
			this.fname = fname;
		}

		public Date getRegdte() {
			return regdte;
		}

		public void setRegdte(Date regdte) {
			this.regdte = regdte;
		}

}
