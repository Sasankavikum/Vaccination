<%@page import="com.rcss.util.CommonConstants"%>
<%@page import="com.rcss.model.EmployeeDetails"%>
<%@page import="com.rcss.service.EmployeeDetailsServiceImpl"%>
<%@page import="com.rcss.service.IEmployeeDetailsService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Report</title>
<style type="text/css">
body {
 
}
page[size="A4"] {
  width: 21cm;
  height: 29.7cm;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
}
@media print {
  body, page[size="A4"] {
    margin: 0;
    box-shadow: 0;
  }
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	
	<%
		
	IEmployeeDetailsService employeeService = new EmployeeDetailsServiceImpl();
		ArrayList<EmployeeDetails> employeeList = employeeService.getEmployeeDetails();
	%>
	
	<div class="A4" style="border:1px solid black; height:40.0cm;">
		<div class="row">
			<div class="col-md-12 justify-content-center">
				<h2 class="font-weight-bold m-0 p-0 text-center mt-1"><%= CommonConstants.COMPANY_NAME.toString() %></h2>
				<h4 class="font-weight-bold m-0 p-0 text-center mt-1"><%= CommonConstants.COMPANY_ADDRESS.toString() %></h4>
				<h4 class="font-weight-bold m-0 p-0 text-center mt-1"><%= CommonConstants.CONTACT_NO.toString() %></h4>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-md-12 justify-content-center">
				<h4 class="font-weight-bold m-0 p-0 text-center mt-1">Total amount of vaccines issued by Red Cross</h4>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-1"></div>
			<div class="col-md-10 justify-content-center">
				<table class="table mt-3">
				
				<tbody>
					<%
						for(EmployeeDetails emp : employeeList){
					%>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Code</td>
					  <td><%= emp.getEmpId() %></td>
					</tr>	
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Name</td>
					  <td><%= emp.getEmpFullName().toUpperCase() %></td>
					</tr>	
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee NIC</td>
					  <td><%= emp.getEmpNIC().toUpperCase() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Gender</td>
					  <td><%= emp.getEmpGender().equalsIgnoreCase("M") ? "Male" : "Female" %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Email</td>
					  <td><%= emp.getEmpEmail().toUpperCase() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Contact No</td>
					  <td><%= emp.getEmpContactNo().toUpperCase() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Address</td>
					  <td><%= emp.getEmpAddress().toUpperCase() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Birthday </td>
					  <td><%= emp.getEmpBirth() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee joining Date</td>
					  <td><%= emp.getEmpJoin() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee password</td>
					  <td><%= emp.getPassword() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee repassword</td>
					  <td><%= emp.getRepassword() %></td>
					</tr>
					
					
					<tr>
					<% } %>														
				</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<div class="row mt-4">
			<div class="col-md-12">
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired By: ................................................ </p>
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired Date: ................................................ </p>
			</div>
		</div>
	</div>
	
    <script>
		window.print();
    </script>

</body>
</html>