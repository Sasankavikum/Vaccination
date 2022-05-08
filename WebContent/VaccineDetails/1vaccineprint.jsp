<%@page import="com.rcss.util.CommonConstants"%>
<%@page import="com.rcss.model.VaccineReport"%>
<%@page import="com.rcss.service.VaccineDetailsServiceImpl"%>
<%@page import="com.rcss.service.IVaccineDetailsService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccine Report</title>
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
		
		IVaccineDetailsService vaccineService = new VaccineDetailsServiceImpl();
		ArrayList<VaccineReport> vaccineList = vaccineService.getVaccinePrintDetails();
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
				<h4 class="font-weight-bold m-0 p-0 text-center mt-1">Total amount of vaccines issued by the System.</h4>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-1"></div>
			<div class="col-md-10 justify-content-center">
				<table class="table mt-3">
				<thead>
					<tr>
						<th>Vaccine Name</th>
						<th>Amount Given</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(VaccineReport vaccine : vaccineList){
					%>
					<tr>
						<td class="text-uppercase p-1 text-dark h5"><%= vaccine.getVaccineName() %></td>
						<td class="text-uppercase p-1 text-dark h5"><%= vaccine.getCount() %></td>			
					</tr>	
					<% } %>														
				</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<div class="row mt-4">
			<div class="col-md-12">
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Approved  By: ................................................ </p>
				
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Generetaed by: ................................................ </p>
				
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired Date: ................................................ </p>
				
			</div>
		</div>
	</div>
	
    <script>
		window.print();
    </script>

</body>
</html>