package com.intgram.model;

public class MemberVO {
	// 1. 필드(속성)
	
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_position;
	private String com_id;
	private String MEM_JOINDATE;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_position() {
		return mem_position;
	}
	public void setMem_position(String mem_position) {
		this.mem_position = mem_position;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getMEM_JOINDATE() {
		return MEM_JOINDATE;
	}
	public void setMEM_JOINDATE(String mEM_JOINDATE) {
		MEM_JOINDATE = mEM_JOINDATE;
	}
	
}
