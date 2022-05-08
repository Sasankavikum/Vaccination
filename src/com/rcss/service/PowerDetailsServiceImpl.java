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
import com.rcss.model.PowerDetails;
import com.rcss.model.VaccineDetails;
import com.rcss.model.VaccineReport;
import com.rcss.util.CommonConstants;
import com.rcss.util.DBConnectionUtil;
import com.rcss.util.QueryUtil;


public class PowerDetailsServiceImpl implements IPowerDetailsService {

public static final Logger log = Logger.getLogger(PowerDetailsServiceImpl.class.getName());
	
	private static Connection connection;
	private PreparedStatement preparedStatement;
	
	@Override
	public void addPowerDetail(PowerDetails powerDetail) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_POWER));
			connection.setAutoCommit(false);
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, powerDetail.getLocation());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, powerDetail.getDate());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, powerDetail.getVaccineType());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, powerDetail.getNoVaccines());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, powerDetail.getEmployeeId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, powerDetail.getEmployeeName());
			
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
	public ArrayList<PowerDetails> getPowerDetails() {
		return actionOnPowerDetails(0);
	}

	@Override
	public PowerDetails getPowerDetail(int empId) {
		return actionOnPowerDetails(empId).get(0);
	}
	
	private ArrayList<PowerDetails> actionOnPowerDetails(int empId) {
		ArrayList<PowerDetails> powerList = new ArrayList<PowerDetails>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			if (empId != 0) {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_POWER));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, empId);
			}
			else {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_POWER));
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				PowerDetails emp = new PowerDetails();
				emp.setEmpId(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
				emp.setLocation(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				emp.setDate(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				emp.setVaccineType(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				emp.setNoVaccines(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				emp.setEmployeeId(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				emp.setEmployeeName(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				powerList.add(emp);
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
		
		return powerList;
	}

	@Override
	public PowerDetails updatePower(int empId, PowerDetails powerDetail) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_POWER));
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, powerDetail.getLocation());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, powerDetail.getDate());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, powerDetail.getVaccineType());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, powerDetail.getNoVaccines());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, powerDetail.getEmployeeId());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, powerDetail.getEmployeeName());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_SEVEN, empId);
			
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
		
		return getPowerDetail(empId);
	}

	@Override
	public void removePowerDetail(int empId) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_POWER));
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, empId);
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
	
	
}
