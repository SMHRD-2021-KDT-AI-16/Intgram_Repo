package com.intgram.model;

public class MemberVO {
	// 1. 필드(속성)
		private String com_num;
		private String id;
		private String pw;
		private String mem_name;
		private String position;
		
		public String getCom_num() {
			return com_num;
		}
		public void setCom_num(String com_num) {
			this.com_num = com_num;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPw() {
			return pw;
		}
		public void setPw(String pw) {
			this.pw = pw;
		}
		public String getMem_name() {
			return mem_name;
		}
		public void setMem_name(String mem_name) {
			this.mem_name = mem_name;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		
}
