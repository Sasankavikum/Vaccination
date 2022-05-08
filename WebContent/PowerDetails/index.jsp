<%@page import="com.rcss.model.PowerDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcss.service.PowerDetailsServiceImpl"%>
<%@page import="com.rcss.service.IPowerDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Daily Progress Details</title>
</head>
<body>
	<jsp:include page="/index.jsp"></jsp:include>

	<%
		IPowerDetailsService powerService = new PowerDetailsServiceImpl();
		ArrayList<PowerDetails> powerList = powerService.getPowerDetails();
	%>

	<div class="container-fluid ml-2 mr-2">
		<div class="row mt-5">
			<div class="col-md-12 w-100">
				<div class="card text-dark bg-light w-100 h-100">
					<div class="card-header">
						<div class="row">
							<div class="col-md-5">
								<button type="button" id="btninsert" class="btn btn-primary">Add New Daily Progress</button>
							</div>
							<div class="col-md-7">
								<h5 class="card-title mt-1 fw-bold ml-5">Daily Progress Details</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="dataTable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>Progress Id</th>
										<th>Location</th>
										<th>Date</th>
										<th>Vaccine Type</th>
										<th>Number of Vaccines</th>
										<th>Employee ID</th>
										<th>Employee Name</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Progress Id</th>
										<th>Location</th>
										<th>Date</th>
										<th>Vaccine Type</th>
										<th>Number of Vaccines</th>
										<th>Employee ID</th>
										<th>Employee Name</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<%
										for(PowerDetails emp : powerList){
									%>
									<tr>
										<td class="emp text-uppercase"><%= emp.getEmpId() %></td>
										<td class="text-uppercase"><%= emp.getLocation() %></td>
										<td class="text-uppercase"><%= emp.getDate() %></td>
										<td class="text-uppercase"><%= emp.getVaccineType() %></td>
										<td class="text-uppercase"><%= emp.getNoVaccines() %></td>
										<td class="text-uppercase"><%= emp.getEmployeeId() %></td>
										<td class="text-uppercase"><%= emp.getEmployeeName() %></td>
										<td>
											<button type="button"
												class="btnprint btn btn-warning btn-circle">
												<i class="fas fa-print"></i>
											</button>
											<button type="button"
												class="btnupdate btn btn-success btn-circle">
												<i class="fas fa-edit"></i>
											</button>
											<button type="button"
												class="btndelete btn btn-danger btn-circle">
												<i class="fas fa-trash"></i>
											</button>
										</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade bd-example-modal-lg" id="addAndUpdateModal"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Daily Progress Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<form id="employeeForm">
							<input type="text" id="empId" hidden="true">
							<div class="row mt-2">
								<div class="col-md-12">
									<label for="location" class="form-label">Location</label> <input
										type="text" class="form-control text-uppercase" id="location"
										required>
								</div>
							</div>		
							<div class="row mt-3">
								<div class="col-md-6">
									<label for="date" class="form-label">Date</label> <input
										type="date" class="form-control text-uppercase" id="date"
										required>
								</div>
								<div class="col-md-6">
									<label for="noVaccines" class="form-label">Number Of Vaccines</label> <input
										type="number" class="form-control text-uppercase" id="noVaccines"
										required>
								</div>
							</div>							
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="mr-sm-2" for="vaccineType">Vaccine Name</label> <br/>
							      		<select class="form-select mt-2" id="vaccineType">
							        		<option value="D">Choose...</option>
							        		<option value="Pfizer">Pfizer</option>
							        		<option value="Moderna">Moderna</option>
							        		<option value="Sputnik">Sputnik</option>
							        		<option value="AstraZeneca">AstraZeneca</option>
							        		<option value="Sinopharm">Sinopharm</option>
							        		<option value="Sinovac">Sinovac</option>
							      		</select>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
							      <label for="employeeId" class="form-label">Employee ID</label> <input
										type="text" class="form-control text-uppercase" id="employeeId"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="employeeName" class="form-label">Employee Name</label> <input
										type="text" class="form-control text-uppercase" id="employeeName"
										required>
								</div>
							</div>
							<div class="row mt-5 mb-2">
								<div class="col-md-12 d-flex justify-content-center">
									<button type="button" class="btn btn-success w-100"
										id="btnAddAndUpdateModal"></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="print" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Print Daily Progress Report</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row-md-12 justify-content-center">
                    <form action="${pageContext.request.contextPath}/PowerDetails?action=PR" method="POST" target="_blank">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <label for="GRNNo">Progress Id :</label>
                                    <input type="text" class="form-control form-control-sm" id="progress_print" name="progress_print" readonly />
                                </div>
                                 <div class="col-md-12 mt-2">
                                    <label for="GRNNo">Location :</label>
                                    <input type="text" class="form-control form-control-sm text-uppercase" id="location_print" name="location_print" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <div class="form-row float-right">
                                <button type="submit" class="btn btn-block btn-success float-right">Print Daily Progress Report</button>
                            </div>
                        </div>
                    	</form>
                	</div>
            	</div>
        	</div>
    	</div>
	</div>
	

	<script type="text/javascript">
    
	    $(document).ready(function() {
	    	var formState = "";
	    	var table = $('#dataTable').DataTable();
	    	
		    $("#btninsert").click(function() {
		    	formState = "NE";
		    	
		        $('#empId').val(""),
				$('#location').val("");
				$('#date').val("");
				$('#vaccineType').val("");
				$('#noVaccines').val("");
		        $('#employeeId').val(""),
				$('#employeeName').val("");
		    	
				$("#powerForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add New Daily Progress');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objEmp = {
		    				empId: $('#empId').val(),
		    				location: $('#location').val(),
		    				date: $('#date').val(),
		    				vaccineType: $('#vaccineType').val(),
		    				noVaccines: $('#noVaccines').val(),
		    				employeeId: $('#employeeId').val(),
		    				employeeName: $('#employeeName').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8095/RedCrossSupportService/PowerDetails?action=NE',
		     	        method   : 'POST', 
		     	        data     : objEmp,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    	else if(formState == "UP") {
		    		$("#loader").show();
		    		var objEmp = {
		    				empId: $('#empId').val(),
		    				location: $('#location').val(),
		    				date: $('#date').val(),
		    				vaccineType: $('#vaccineType').val(),
		    				noVaccines: $('#noVaccines').val(),
		    				employeeId: $('#employeeId').val(),
		    				employeeName: $('#employeeName').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8095/RedCrossSupportService/PowerDetails?action=UP',
		     	        method   : 'POST', 
		     	        data     : objEmp,
		     	        success  : function(response){
		     	        	formState = "";	     	        	
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    	else if(formState == "DL") {
		    		$("#loader").show();
		    		var objEmp = {
		    				empId: $('#empId').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8095/RedCrossSupportService/PowerDetails?action=DL',
		     	        method   : 'POST', 
		     	        data     : objEmp,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btnupdate', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		       
		        $('#empId').val(data[0]),
				$('#location').val(data[1]);
				$('#date').val(data[2]);
				$('#vaccineType').val(data[3]);
				$('#noVaccines').val(data[4]);
				$('#employeeId').val(data[5]);
				$('#employeeName').val(data[6]);
				
				$("#powerForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update Daily Progress');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        
		        $('#empId').val(data[0]),
		        $('#location').val(data[1]);
				$('#date').val(data[2]);
				$('#vaccineType').val(data[3]);
				$('#noVaccines').val(data[4]);
				$('#employeeId').val(data[5]);
				$('#employeeName').val(data[6]);
				
				$("#powerForm :input").prop("disabled", true);
				$("#btnAddAndUpdateModal").prop("disabled", false);
				
		    	formState = "DL";
		    	$('#btnAddAndUpdateModal').html('Delete Daily Progress');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btnprint', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        $('#progress_print').val(data[0]);
		        $('#location_print').val(data[1]);
		        $('#print').modal('toggle');
		    });
	    });
	    
    </script>

</body>
</html>