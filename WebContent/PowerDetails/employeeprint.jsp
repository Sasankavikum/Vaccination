<%@page import="com.rcss.util.CommonConstants"%>
<%@page import="com.rcss.model.PowerDetails"%>
<%@page import="com.rcss.service.PowerDetailsServiceImpl"%>
<%@page import="com.rcss.service.IPowerDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Daily Progress Report</title>
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
		HttpSession Session = request.getSession();
		String empId = session.getAttribute("EmpId").toString();
		
		IPowerDetailsService powerService = new PowerDetailsServiceImpl();
		PowerDetails emp = powerService.getPowerDetail(Integer.parseInt(empId));
		
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
				<h4 class="font-weight-bold m-0 p-0 text-center mt-1">Daily Progress Information</h4>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-1"></div>
			<div class="col-md-10 justify-content-center">
				<table class="table mt-3">
				<tbody>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Code</td>
					  <td><%= emp.getEmpId() %></td>
					</tr>	
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Location</td>
					  <td><%= emp.getLocation().toUpperCase() %></td>
					</tr>	
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Date</td>
					  <td><%= emp.getDate() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Vaccine Type</td>
					  <td><%= emp.getVaccineType().toUpperCase() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Number of Vaccine</td>
					  <td><%= emp.getNoVaccines() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee ID</td>
					  <td><%= emp.getEmployeeId() %></td>
					</tr>
					<tr>
					  <td class="text-dark font-weight-bold h5 p-1">Employee Name</td>
					  <td><%= emp.getEmployeeName().toUpperCase() %></td>
					</tr>														
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