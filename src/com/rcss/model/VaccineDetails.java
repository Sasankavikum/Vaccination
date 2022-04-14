package com.rcss.model;

public class VaccineDetails {
	private int vaccineNo;
	private String batch_number;
	private String vaccine_name;
	private String receive_date;
	private String country;
	private String expire_date;
	private int quantity;

	public VaccineDetails() {
		super();
	}
	public VaccineDetails(int vaccineNo, String batch_number, String vaccine_name, String receive_date, String country,
			String expire_date, int quantity) {
		super();
		this.vaccineNo = vaccineNo;
		this.batch_number = batch_number;
		this.vaccine_name = vaccine_name;
		this.receive_date = receive_date;
		this.country = country;
		this.expire_date = expire_date;
		this.quantity = quantity;
	}
	
	public int getVaccineNo() {
		return vaccineNo;
	}
	public String getBatch_number() {
		return batch_number;
	}
	public String getVaccine_name() {
		return vaccine_name;
	}
	public String getReceive_date() {
		return receive_date;
	}
	public String getCountry() {
		return country;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public void setBatch_number(String batch_number) {
		this.batch_number = batch_number;
	}
	public void setVaccine_name(String vaccine_name) {
		this.vaccine_name = vaccine_name;
	}
	public void setReceive_date(String receive_date) {
		this.receive_date = receive_date;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
