package com.intgram.model;

public class Co2VO {
	private int user_co2_seq;
	private String mem_id;
	private String transportation;
	private String mem_fuel_name;
	private int fuel_amount;
	private float co2_emission;
	private float ch4_emission;
	private float n2o_emission;
	private float total_emission;
	private String driving_date;
	
	public int getUser_co2_seq() {
		return user_co2_seq;
	}
	public void setUser_co2_seq(int user_co2_seq) {
		this.user_co2_seq = user_co2_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	public String getTransportation() {
		return transportation;
	}
	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}
	public String getMem_fuel_name() {
		return mem_fuel_name;
	}
	public void setMem_fuel_name(String mem_fuel_name) {
		this.mem_fuel_name = mem_fuel_name;
	}
	public float getFuel_amount() {
		return fuel_amount;
	}
	public void setFuel_amount(int fuel_amount) {
		this.fuel_amount = fuel_amount;
	}
	public float getCo2_emission() {
		return co2_emission;
	}
	public void setCo2_emission(float co2_emission) {
		this.co2_emission = co2_emission;
	}
	public float getCh4_emission() {
		return ch4_emission;
	}
	public void setCh4_emission(float ch4_emission) {
		this.ch4_emission = ch4_emission;
	}
	public float getN2o_emission() {
		return n2o_emission;
	}
	public void setN2o_emission(float n2o_emission) {
		this.n2o_emission = n2o_emission;
	}
	public float getTotal_emission() {
		return total_emission;
	}
	public void setTotal_emission(float total_emission) {
		this.total_emission = total_emission;
	}
	public String getDriving_date() {
		return driving_date;
	}
	public void setDriving_date(String driving_date) {
		this.driving_date = driving_date;
	}
	

}
