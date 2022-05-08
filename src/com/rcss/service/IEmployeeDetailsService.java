package com.rcss.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.rcss.model.EmployeeDetails;

public interface IEmployeeDetailsService {

	public static final Logger log = Logger.getLogger(IEmployeeDetailsService.class.getName());
	
	public void addEmployeeDetail(EmployeeDetails employeeDetail);
	public ArrayList<EmployeeDetails> getEmployeeDetails();
	public EmployeeDetails getEmployeeDetail(int empId);
	public EmployeeDetails updateEmployee(int empId, EmployeeDetails employeeDetail);
	public void removeEmployeeDetail(int empId);
	
}
