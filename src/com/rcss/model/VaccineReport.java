package com.rcss.model;

public class VaccineReport {
	private String vaccineName;
	private String batchNo;
	private String vaccineReceive;
	private String vaccineCountry;
	private String vaccineExpire;
	private int quantity;
	
	public VaccineReport() {
		super();
	}
	public VaccineReport(String vaccineName, String batchNo, String vaccineReceive, String vaccineCountry,
			String vaccineExpire, int quantity) {
		super();
		this.vaccineName = vaccineName;
		this.batchNo = batchNo;
		this.vaccineReceive = vaccineReceive;
		this.vaccineCountry = vaccineCountry;
		this.vaccineExpire = vaccineExpire;
		this.quantity = quantity;
	}
	
	public String getVaccineName() {
		return vaccineName;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public String getVaccineReceive() {
		return vaccineReceive;
	}
	public String getVaccineCountry() {
		return vaccineCountry;
	}
	public String getVaccineExpire() {
		return vaccineExpire;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public void setVaccineReceive(String vaccineReceive) {
		this.vaccineReceive = vaccineReceive;
	}
	public void setVaccineCountry(String vaccineCountry) {
		this.vaccineCountry = vaccineCountry;
	}
	public void setVaccineExpire(String vaccineExpire) {
		this.vaccineExpire = vaccineExpire;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
