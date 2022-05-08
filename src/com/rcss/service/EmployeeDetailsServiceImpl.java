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
import com.rcss.util.CommonConstants;
import com.rcss.util.DBConnectionUtil;
import com.rcss.util.QueryUtil;

public class EmployeeDetailsServiceImpl implements IEmployeeDetailsService{

	public static final Logger log = Logger.getLogger(EmployeeDetailsServiceImpl.class.getName());
	
	private static Connection connection;
	private PreparedStatement preparedStatement;
	
	@Override
	public void addEmployeeDetail(EmployeeDetails employeeDetail) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_INSERT_EMPLOYEE));
			connection.setAutoCommit(false);
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, employeeDetail.getEmpFullName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, employeeDetail.getEmpNIC());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, employeeDetail.getEmpGender());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, employeeDetail.getEmpEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, employeeDetail.getEmpContactNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, employeeDetail.getEmpAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, employeeDetail.getEmpBirth());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, employeeDetail.getEmpJoin());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, employeeDetail.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TEN, employeeDetail.getRepassword());
			
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
	public ArrayList<EmployeeDetails> getEmployeeDetails() {
		return actionOnEmployeeDetails(0);
	}

	@Override
	public EmployeeDetails getEmployeeDetail(int empId) {
		return actionOnEmployeeDetails(empId).get(0);
	}
	
	private ArrayList<EmployeeDetails> actionOnEmployeeDetails(int empId) {
		ArrayList<EmployeeDetails> empList = new ArrayList<EmployeeDetails>();
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			
			if (empId != 0) {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_GET_EMPLOYEE));
				preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ONE, empId);
			}
			else {
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_ALL_EMPLOYEE));
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				EmployeeDetails emp = new EmployeeDetails();
				emp.setEmpId(resultSet.getInt(CommonConstants.COLUMN_INDEX_ONE));
				emp.setEmpFullName(resultSet.getString(CommonConstants.COLUMN_INDEX_TWO));
				emp.setEmpNIC(resultSet.getString(CommonConstants.COLUMN_INDEX_THREE));
				emp.setEmpGender(resultSet.getString(CommonConstants.COLUMN_INDEX_FOUR));
				emp.setEmpEmail(resultSet.getString(CommonConstants.COLUMN_INDEX_FIVE));
				emp.setEmpContactNo(resultSet.getString(CommonConstants.COLUMN_INDEX_SIX));
				emp.setEmpAddress(resultSet.getString(CommonConstants.COLUMN_INDEX_SEVEN));
				emp.setEmpBirth(resultSet.getString(CommonConstants.COLUMN_INDEX_EIGHT));
				emp.setEmpJoin(resultSet.getString(CommonConstants.COLUMN_INDEX_NINE));
				emp.setPassword(resultSet.getString(CommonConstants.COLUMN_INDEX_TEN));
				emp.setRepassword(resultSet.getString(CommonConstants.COLUMN_INDEX_ELEVEN));
				empList.add(emp);
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
		
		return empList;
	}

	@Override
	public EmployeeDetails updateEmployee(int empId, EmployeeDetails employeeDetail) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_UPDATE_EMPLOYEE));
			
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_ONE, employeeDetail.getEmpFullName());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TWO, employeeDetail.getEmpNIC());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_THREE, employeeDetail.getEmpGender());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FOUR, employeeDetail.getEmpEmail());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_FIVE, employeeDetail.getEmpContactNo());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SIX, employeeDetail.getEmpAddress());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_SEVEN, employeeDetail.getEmpBirth());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_EIGHT, employeeDetail.getEmpJoin());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_NINE, employeeDetail.getPassword());
			preparedStatement.setString(CommonConstants.COLUMN_INDEX_TEN, employeeDetail.getRepassword());
			preparedStatement.setInt(CommonConstants.COLUMN_INDEX_ELEVEN, empId);
			
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
		
		return getEmployeeDetail(empId);
	}

	@Override
	public void removeEmployeeDetail(int empId) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.QUERY_ID_DELETE_EMPLOYEE));
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
