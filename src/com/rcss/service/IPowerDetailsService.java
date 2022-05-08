package com.rcss.service;

import java.util.ArrayList;

import java.util.logging.Logger;

import com.rcss.model.PowerDetails;


public interface IPowerDetailsService {
	
	public static final Logger log = Logger.getLogger(IPowerDetailsService.class.getName());
	
	public void addPowerDetail(PowerDetails powerDetail);
	public ArrayList<PowerDetails> getPowerDetails();
	public PowerDetails getPowerDetail(int empId);
	public PowerDetails updatePower(int empId, PowerDetails powerDetail);
	public void removePowerDetail(int empId);

}
