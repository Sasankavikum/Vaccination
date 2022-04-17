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
								<button type="button" id="btninsert" class="btn btn-primary">Add New Inventory</button>
							</div>
							<div class="col-md-2">
							    <form action="${pageContext.request.contextPath}/VaccineDetails?action=PR" method="POST" target="_blank">
									<button type="submit" class="btn btn-block btn-warning float-right">Print Vaccine Report</button>
			                    </form>
							</div>
							<div class="col-md-5">
								<h5 class="card-title mt-1 fw-bold d-flex justify-content-center">Stock</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="dataTable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>Vaccine No</th>
										<th>Batch Number</th>
										<th>Vaccine Name</th>
										<th>Received Date</th>
										<th>Country From</th>
										<th>Expire Date</th>
										<th>Quantity</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Vaccine No</th>
										<th>Batch Number</th>
										<th>Vaccine Name</th>
										<th>Received Date</th>
										<th>Country From</th>
										<th>Expire Date</th>
										<th>Quantity</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<%
										for(VaccineDetails vaccine : vaccineList){
									%>
									<tr>
										<td class="emp text-uppercase"><%= vaccine.getVaccineNo() %></td>
										<td class="text-uppercase"><%= vaccine.getBatch_number() %></td>
										<td class="text-uppercase"><%= vaccine.getVaccine_name() %></td>
										<td class="text-uppercase"><%= vaccine.getReceive_date() %></td>
										<td class="text-uppercase"><%= vaccine.getCountry() %></td>
										<td class="text-uppercase"><%= vaccine.getExpire_date() %></td>
										<td class="text-uppercase"><%= vaccine.getQuantity() %></td>

										<td>
											<button type="button"
												class="btnupdate btn btn-success btn-circle">
												<i class="fas fa-edit"></i>
											</button>
											<button type="button"
												class="btndelete btn btn-danger btn-circle">
												<i class="fas fa-trash"></i>
											</button>
											<button type="button"
												class="btnprint btn btn-warning btn-circle">
												<i class="fas fa-print"></i>
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
								<div class="col-md-12">
									<label for="name" class="form-label">Batch Number</label> <input
										type="text" class="form-control text-uppercase" id="batch_number"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="mr-sm-2" for="vaccineName">Vaccine Name</label> <br/>
							      <select class="form-select mt-2" id="vaccine_name">
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
								<div class="col-md-6">
									<label for="receive" class="form-label">Receive Date</label> <input
										type="date" class="form-control text-uppercase" id="receive_date"
										required>
								</div>
								<div class="col-md-6">
									<label for="email" class="form-label">Country From</label> <input
										type="text" class="form-control text-uppercase" id="country"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-6">
							      <label for="expire" class="form-label">Expire Date</label> <input
										type="date" class="form-control text-uppercase" id="expire_date"
										required>
								</div>
								<div class="col-md-6">
									<label for="batchNo" class="form-label">Quantity</label> <input
										type="number" class="form-control text-uppercase" id="quantity" maxlength="10"
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
	


	<script type="text/javascript">
    
	    $(document).ready(function() {
	    	var formState = "";
	    	var table = $('#dataTable').DataTable();
	    	
		    $("#btninsert").click(function() {
		    	formState = "NE";
		    	
		        $('#vaccineNo').val(""),
		        $('#batch_number').val("");
				$('#vaccine_name').val("D");
				$('#receive_date').val("");
				//$('#vaccinedDate').val("");
		        $('#country').val(""),
				$('#expire_date').val("");
				$('#quantity').val("");
		    	
				$("#vaccineForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add New Batch');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objVaccine = {
		    				vaccineNo: $('#vaccineNo').val(),
		    				batch_number: $('#batch_number').val(),
		    				vaccine_name: $('#vaccine_name').val(),
		    				//vaccinedDate: $('#vaccinedDate').val().split(" ")[0],
		    				receive_date: $('#receive_date').val(),
		    				country: $('#country').val(),
		    				expire_date: $('#expire_date').val(),
		    				quantity: $('#quantity').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8092/RedCrossSupportService/VaccineDetails?action=NE',
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
		    				batch_number: $('#batch_number').val(),
		    				vaccine_name: $('#vaccine_name').val(),
		    				//vaccinedDate: $('#vaccinedDate').val().split(" ")[0],
		    				receive_date: $('#receive_date').val(),
		    				country: $('#country').val(),
		    				expire_date: $('#expire_date').val(),
		    				quantity: $('#quantity').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8092/RedCrossSupportService/VaccineDetails?action=UP',
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
		     	        url      : 'http://localhost:8092/RedCrossSupportService/VaccineDetails?action=DL',
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
		        $('#batch_number').val(data[1]);
				$('#vaccine_name').val(data[2]);
				$('#receive_date').val(data[3]);
				$('#country').val(data[4]);
				$('#expire_date').val(data[5]);
				$('#quantity').val(data[6]);
				
				$("#vaccineForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        
		        $('#vaccineNo').val(data[0]),
		        $('#batch_number').val(data[1]);
				$('#vaccine_name').val(data[2]);
				$('#receive_date').val(data[3]);
				$('#country').val(data[4]);
				$('#expire_date').val(data[5]);
				$('#quantity').val(data[6]);
				
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