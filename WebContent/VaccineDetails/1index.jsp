<%@page import="com.rcss.model.VaccineDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcss.service.VaccineDetailsServiceImpl"%>
<%@page import="com.rcss.service.IVaccineDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vaccine Details</title>
</head>
<body>
	<jsp:include page="/index.jsp"></jsp:include>

	<%
		IVaccineDetailsService vaccineService = new VaccineDetailsServiceImpl();
		ArrayList<VaccineDetails> vaccineList = vaccineService.getVaccineDetails();
	%>

	<div class="container-fluid ml-2 mr-2">
		<div class="row mt-5">
			<div class="col-md-12 w-100">
				<div class="card text-dark bg-light w-100 h-100">
					<div class="card-header">
						<div class="row">
							<div class="col-md-2">
								<button type="button" id="btninsert" class="btn btn-primary">Add New Vaccine Details</button>
							</div>
							<div class="col-md-2">
							    <form action="${pageContext.request.contextPath}/VaccineDetails?action=PR" method="POST" target="_blank">
									<button type="submit" class="btn btn-block btn-warning float-right">Print Vaccine Report</button>
			                    </form>
							</div>
							<div class="col-md-5">
								<h5 class="card-title mt-1 fw-bold d-flex justify-content-center">Vaccine Details</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="dataTable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>Vaccine No</th>
										<th>Vaccine Name</th>
										<th>Batch No</th>
										<th>Dose</th>
										<th>Vaccined Date</th>
										<th>Province</th>
										<th>District</th>
										<th>Name</th>
										<th>Age</th>
										<th>Email</th>
										<th>Contact No</th>
										<th>NIC</th>
										<th>Gender</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Vaccine No</th>
										<th>Vaccine Name</th>
										<th>Batch No</th>
										<th>Dose</th>
										<th>Vaccined Date</th>
										<th>Province</th>
										<th>District</th>
										<th>Name</th>
										<th>Age</th>
										<th>Email</th>
										<th>Contact No</th>
										<th>NIC</th>
										<th>Gender</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<%
										for(VaccineDetails vaccine : vaccineList){
									%>
									<tr>
										<td class="emp text-uppercase"><%= vaccine.getVaccineNo() %></td>
										<td class="text-uppercase"><%= vaccine.getVaccineName() %></td>
										<td class="text-uppercase"><%= vaccine.getBatchNo() %></td>
										<td class="text-uppercase"><%= vaccine.getDose().equalsIgnoreCase("1") ? "1st Dose" : vaccine.getDose().equalsIgnoreCase("2") ? "2nd Dose" : "Booster Dose" %></td>
										<td class="text-uppercase"><%= vaccine.getVaccinedDate().split(" ")[0] %></td>
										<td class="text-uppercase"><%= vaccine.getProvince() %></td>
										<td class="text-uppercase"><%= vaccine.getDistrict() %></td>
										<td class="text-uppercase"><%= vaccine.getName() %></td>
										<td class="text-uppercase"><%= vaccine.getAge() %></td>
										<td class="text-uppercase"><%= vaccine.getEmail() %></td>
										<td class="text-uppercase"><%= vaccine.getContactNo() %></td>
										<td class="text-uppercase"><%= vaccine.getNIC() %></td>
										<td class="text-uppercase"><%= vaccine.getGender().equalsIgnoreCase("M") ? "Male" : "Female" %></td>
										<td>
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
					<h5 class="modal-title">Vaccine Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<form id="vaccineForm">
							<input type="text" id="vaccineNo" hidden="true">
							<div class="row mt-2">
								<div class="col-md-8">
									<label for="name" class="form-label">Name</label> <input
										type="text" class="form-control text-uppercase" id="name"
										required>
								</div>
								<div class="col-md-4">
									<label for="NIC" class="form-label">NIC</label> <input
										type="text" class="form-control text-uppercase" id="NIC" maxlength="10"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-4">
									<label for="contactNo" class="form-label">Contact No</label> <input
										type="text" class="form-control text-uppercase" id="contactNo" maxlength="10"
										required>
								</div>
								<div class="col-md-4">
									<label for="compName" class="form-label">Gender</label> <br/>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="gender" id="male" value="M">
									  <label class="form-check-label" for="gender">Male</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="gender" id="female" value="F">
									  <label class="form-check-label" for="gender">Female</label>
									</div>
								</div>
								<div class="col-md-4">
									<label for="age" class="form-label">Age</label> <input
										type="number" class="form-control text-uppercase" id="age" maxlength="2"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-4">
									<label for="email" class="form-label">Email</label> <input
										type="email" class="form-control text-uppercase" id="email"
										required>
								</div>
								<div class="col-md-4">
							      <label class="mr-sm-2" for="province">Province</label> <br/>
							      <select class="form-select mt-2" id="province">
							        <option value="D">Choose...</option>
							        <option value="Central">Central</option>
							        <option value="Eastern">Eastern</option>
							        <option value="North Central">North Central</option>
							        <option value="Northern">Northern</option>
							        <option value="North Western">North Western</option>
							        <option value="Sabaragamuwa">Sabaragamuwa</option>
							        <option value="Southern">Southern</option>
							        <option value="Uva">Uva</option>
							        <option value="Western">Western</option>
							      </select>
								</div>
								<div class="col-md-4">
									<label for="district" class="form-label">District</label> <input
										type="text" class="form-control text-uppercase" id="district" maxlength="15"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-6">
							      <label class="mr-sm-2" for="vaccineName">Vaccine Name</label> <br/>
							      <select class="form-select mt-2" id="vaccineName">
							        <option value="D">Choose...</option>
							        <option value="Pizer">Pizer</option>
							        <option value="Moderna">Moderna</option>
							        <option value="Sputnik">Sputnik</option>
							        <option value="AstraZeneca">AstraZeneca</option>
							        <option value="Sinopharm">Sinopharm</option>
							        <option value="Sinovac">Sinovac</option>
							      </select>
								</div>
								<div class="col-md-6">
									<label for="batchNo" class="form-label">Batch No</label> <input
										type="text" class="form-control text-uppercase" id="batchNo" maxlength="15"
										required>
								</div>
							</div>							
							<div class="row mt-3">
								<div class="col-md-8">
									<label for="compName" class="form-label">Dose</label> <br/>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="dose" id="firstDose" value="1">
									  <label class="form-check-label" for="dose">1st Dose</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="dose" id="secondDose" value="2">
									  <label class="form-check-label" for="dose">2nd Dose</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="dose" id="boosterDose" value="3">
									  <label class="form-check-label" for="dose">Booster Dose</label>
									</div>
								</div>
								<div class="col-md-4">
									<label for="vaccinedDate" class="form-label">Vaccined Date</label> 
									<input type="date" class="form-control" id="vaccinedDate" required>
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
	


	<script type="text/javascript">
    
	    $(document).ready(function() {
	    	var formState = "";
	    	var table = $('#dataTable').DataTable();
	    	
		    $("#btninsert").click(function() {
		    	formState = "NE";
		    	
		        $('#vaccineNo').val(""),
				$('#vaccineName').val("D");
				$('#batchNo').val("");
				$('#dose').val("");
				//$('#vaccinedDate').val("");
		        $('#province').val("D"),
				$('#district').val("");
				$('#name').val("");
				$('#age').val("");
				$('#email').val("");
				$('#contactNo').val("");
				$('#NIC').val("");
				$('#gender').val("");
		    	
				$("#vaccineForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add New Vaccine Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objVaccine = {
		    				vaccineNo: $('#vaccineNo').val(),
		    				vaccineName: $('#vaccineName').val(),
		    				batchNo: $('#batchNo').val(),
		    				dose: $('input[name="dose"]:checked').val(),
		    				vaccinedDate: $('#vaccinedDate').val().split(" ")[0],
		    				province: $('#province').val(),
		    				district: $('#district').val(),
		    				name: $('#name').val(),
		    				age: $('#age').val(),
		    				email: $('#email').val(),
		    				contactNo: $('#contactNo').val(),
		    				NIC: $('#NIC').val(),		    				
		    				gender: $('input[name="gender"]:checked').val()
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:3000/RedCrossSupportService/VaccineDetails?action=NE',
		     	        method   : 'POST', 
		     	        data     : objVaccine,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    	else if(formState == "UP") {
		    		$("#loader").show();
		    		var objVaccine = {
		    				vaccineNo: $('#vaccineNo').val(),
		    				vaccineName: $('#vaccineName').val(),
		    				batchNo: $('#batchNo').val(),
		    				dose: $('input[name="dose"]:checked').val(),
		    				vaccinedDate: $('#vaccinedDate').val().split(" ")[0],
		    				province: $('#province').val(),
		    				district: $('#district').val(),
		    				name: $('#name').val(),
		    				age: $('#age').val(),
		    				email: $('#email').val(),
		    				contactNo: $('#contactNo').val(),
		    				NIC: $('#NIC').val(),		    				
		    				gender: $('input[name="gender"]:checked').val()
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:3000/RedCrossSupportService/VaccineDetails?action=UP',
		     	        method   : 'POST', 
		     	        data     : objVaccine,
		     	        success  : function(response){
		     	        	formState = "";	     	        	
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    	else if(formState == "DL") {
		    		$("#loader").show();
		    		var objVaccine = {
		    				vaccineNo: $('#vaccineNo').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:3000/RedCrossSupportService/VaccineDetails?action=DL',
		     	        method   : 'POST', 
		     	        data     : objVaccine,
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
		       
		        $('#vaccineNo').val(data[0]),
		        $('#vaccineName').val(data[1]);
				$('#batchNo').val(data[2]);
				$("input[name=dose][value=" + data[3].charAt(0) + "]").attr('checked', 'checked');
				$('#vaccinedDate').val(data[4]);
				$('#province').val(data[5]);
				$('#district').val(data[6]);
				$('#name').val(data[7]);
				$('#age').val(data[8]);
				$('#email').val(data[9]);
				$('#contactNo').val(data[10]);
				$('#NIC').val(data[11]);
				$("input[name=gender][value=" + data[12].charAt(0) + "]").attr('checked', 'checked');
				
				$("#vaccineForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update Vaccine Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        
		        $('#vaccineNo').val(data[0]),
		        $('#vaccineName').val(data[1]);
				$('#batchNo').val(data[2]);
				$("input[name=dose][value=" + data[3].charAt(0) + "]").attr('checked', 'checked');
				$('#vaccinedDate').val(data[4]);
				$('#province').val(data[5]);
				$('#district').val(data[6]);
				$('#name').val(data[7]);
				$('#age').val(data[8]);
				$('#email').val(data[9]);
				$('#contactNo').val(data[10]);
				$('#NIC').val(data[11]);
				$("input[name=gender][value=" + data[12].charAt(0) + "]").attr('checked', 'checked');
				
				$("#vaccineForm :input").prop("disabled", true);
				$("#btnAddAndUpdateModal").prop("disabled", false);
				
		    	formState = "DL";
		    	$('#btnAddAndUpdateModal').html('Delete');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
	    });
	    
    </script>

</body>
</html>