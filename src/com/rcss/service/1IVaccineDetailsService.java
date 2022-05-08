package com.rcss.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.rcss.model.VaccineDetails;
import com.rcss.model.VaccineReport;

public interface IVaccineDetailsService {

	public static final Logger log = Logger.getLogger(IVaccineDetailsService.class.getName());
	
	public void addVaccineDetail(VaccineDetails vaccineDetail);
	public ArrayList<VaccineDetails> getVaccineDetails();
	public VaccineDetails getVaccineDetails(int vaccineNo);
	public VaccineDetails updateVaccine(int vaccineNo, VaccineDetails vaccineDetail);
	public void removeVaccineDetail(int vaccineNo);
	public ArrayList<VaccineReport> getVaccinePrintDetails();
}
