package com.rcss.model;

public class VaccineReport {
	private String vaccineName;
	private int count;
	
	public VaccineReport() {
		super();
	}
	
public VaccineReport(String vaccineName, int count) {
		super();
		this.vaccineName = vaccineName;
		this.count = count;
	}
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
