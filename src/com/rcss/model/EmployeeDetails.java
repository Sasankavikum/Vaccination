package com.rcss.model;

public class EmployeeDetails {

	private int empId;
	private String empFullName;
	private String empNIC;
	private String empGender;
	private String empEmail;
	private String empContactNo;
	private String empAddress;
	private String empBirth;
	private String empJoin;
	private String password;
	private String repassword;
	
	public EmployeeDetails() {
		super();
	}

	public EmployeeDetails(int empId, String empFullName, String empNIC, String empGender, String empEmail,
			String empContactNo, String empAddress, String empBirth, String empJoin, String password,
			String repassword) {
		super();
		this.empId = empId;
		this.empFullName = empFullName;
		this.empNIC = empNIC;
		this.empGender = empGender;
		this.empEmail = empEmail;
		this.empContactNo = empContactNo;
		this.empAddress = empAddress;
		this.empBirth = empBirth;
		this.empJoin = empJoin;
		this.password = password;
		this.repassword = repassword;
	}

	public int getEmpId() {
		return empId;
	}

	public String getEmpFullName() {
		return empFullName;
	}

	public String getEmpNIC() {
		return empNIC;
	}

	public String getEmpGender() {
		return empGender;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public String getEmpContactNo() {
		return empContactNo;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public String getEmpBirth() {
		return empBirth;
	}

	public String getEmpJoin() {
		return empJoin;
	}

	public String getPassword() {
		return password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public void setEmpFullName(String empFullName) {
		this.empFullName = empFullName;
	}

	public void setEmpNIC(String empNIC) {
		this.empNIC = empNIC;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public void setEmpContactNo(String empContactNo) {
		this.empContactNo = empContactNo;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}

	public void setEmpJoin(String empJoin) {
		this.empJoin = empJoin;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	
}
