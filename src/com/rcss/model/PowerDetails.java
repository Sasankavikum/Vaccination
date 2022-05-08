package com.rcss.model;

public class PowerDetails {
	
	private int empId;
	private String location;
	private String date;
	private String vaccineType;
	private String noVaccines;
	private String employeeId;
	private String employeeName;
	
	public PowerDetails() {
		
	}

	public PowerDetails(int empId, String location, String date, String vaccineType, String noVaccines,
			String employeeId, String employeeName) {
		super();
		this.empId = empId;
		this.location = location;
		this.date = date;
		this.vaccineType = vaccineType;
		this.noVaccines = noVaccines;
		this.employeeId = employeeId;
		this.employeeName = employeeName;
	}

	public int getEmpId() {
		return empId;
	}

	public String getLocation() {
		return location;
	}

	public String getDate() {
		return date;
	}

	public String getVaccineType() {
		return vaccineType;
	}

	public String getNoVaccines() {
		return noVaccines;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setVaccineType(String vaccineType) {
		this.vaccineType = vaccineType;
	}

	public void setNoVaccines(String noVaccines) {
		this.noVaccines = noVaccines;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	
	
	
	

}
