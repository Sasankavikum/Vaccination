package com.rcss.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.rcss.model.EmployeeDetails;
import com.rcss.model.VaccineDetails;
import com.rcss.model.VaccineReport;
import com.rcss.util.CommonConstants;
import com.rcss.util.DBConnectionUtil;
import com.rcss.util.QueryUtil;

public class VaccineDetailsServiceImpl implements IVaccineDetailsService {

	public static final Logger log = Logger.getLogger(VaccineDetailsServiceImpl.class.getName());
	
	private static Connection connection;
	private PreparedStatement preparedStatement;
	
	@Override
	public void addVaccineDetail(VaccineDetails vaccineDetail) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_VACCINE));
			connection.setAutoCommit(false);
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, vaccineDetail.getVaccineName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, vaccineDetail.getBatchNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, vaccineDetail.getVaccineReceive());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, vaccineDetail.getVaccineCountry());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, vaccineDetail.getVaccineExpire());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SIX, vaccineDetail.getQuantity());
			
			preparedStatement.execute();
			connection.commit();
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}
		}
	}

	@Override
	public ArrayList<VaccineDetails> getVaccineDetails() {
		return actionOnVaccineDetails(0);
	}

	@Override
	public VaccineDetails getVaccineDetails(int vaccineNo) {
		return actionOnVaccineDetails(vaccineNo).get(0);
	}
	
	private ArrayList<VaccineDetails> actionOnVaccineDetails(int vaccineNo) {
		ArrayList<VaccineDetails> vaccineList = new ArrayList<VaccineDetails>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			if (vaccineNo != 0) {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_VACCINE));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, vaccineNo);
			}
			else {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_VACCINE));
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				VaccineDetails vaccine = new VaccineDetails();
				vaccine.setVaccineNo(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
				vaccine.setVaccineName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				vaccine.setBatchNo(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				vaccine.setVaccineReceive(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				vaccine.setVaccineCountry(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				vaccine.setVaccineExpire(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				vaccine.setQuantity(resultSet.getInt(CommonConstants.COLUMN_INDEX_SEVEN));
				vaccineList.add(vaccine);
			}
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}
		}
		
		return vaccineList;
	}


	@Override
	public VaccineDetails updateVaccine(int vaccineNo, VaccineDetails vaccineDetail) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_VACCINE));
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, vaccineDetail.getVaccineName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, vaccineDetail.getBatchNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, vaccineDetail.getVaccineReceive());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, vaccineDetail.getVaccineCountry());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, vaccineDetail.getVaccineExpire());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SIX, vaccineDetail.getQuantity());			
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SEVEN, vaccineNo);
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}
		}
		
		return getVaccineDetails(vaccineNo);
	}

	@Override
	public void removeVaccineDetail(int vaccineNo) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_VACCINE));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, vaccineNo);
			preparedStatement.executeUpdate();
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}
		}
	}

	@Override
	public ArrayList<VaccineReport> getVaccinePrintDetails() {
		ArrayList<VaccineReport> vaccineList = new ArrayList<VaccineReport>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();			
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_PRINT_VACCINE));
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				VaccineReport vaccine = new VaccineReport(); 
				vaccine.setVaccineName(resultSet.getString(CommonConstants.COLUMN_INDEX_ONE));
				vaccine.setCount(resultSet.getInt(CommonConstants.COLUMN_INDEX_TWO));
				vaccineList.add(vaccine);
			}
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				log.log(Level.SEVERE, ex.getMessage());
			}
		}
		return vaccineList;
	}

}
