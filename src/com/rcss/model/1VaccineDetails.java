package com.rcss.model;

public class VaccineDetails {
	private int vaccineNo;
	private String vaccineName;
	private String batchNo;
	private String dose;
	private String vaccinedDate;
	private String province;
	private String district;
	private String name;
	private int age;
	private String email;
	private String contactNo;
	private String NIC;
	private String gender;
	public VaccineDetails() {
		super();
	}
	public VaccineDetails(int vaccineNo, String vaccineName, String batchNo, String dose, String vaccinedDate,
			String province, String district, String name, int age, String email, String contactNo, String nIC,
			String gender) {
		super();
		this.vaccineNo = vaccineNo;
		this.vaccineName = vaccineName;
		this.batchNo = batchNo;
		this.dose = dose;
		this.vaccinedDate = vaccinedDate;
		this.province = province;
		this.district = district;
		this.name = name;
		this.age = age;
		this.email = email;
		this.contactNo = contactNo;
		NIC = nIC;
		this.gender = gender;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public String getDose() {
		return dose;
	}
	public void setDose(String dose) {
		this.dose = dose;
	}
	public String getVaccinedDate() {
		return vaccinedDate;
	}
	public void setVaccinedDate(String vaccinedDate) {
		this.vaccinedDate = vaccinedDate;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getNIC() {
		return NIC;
	}
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
