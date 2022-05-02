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
									<button type="submit" class="btn btn-block btn-warning float-right">Print Stock Report</button>
			                    </form>
							</div>
							<div class="col-md-5">
								<h5 class="card-title mt-1 fw-bold d-flex justify-content-center">Inventory Details</h5>
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
										<th>Batch Number</th>
										<th>Receive Date</th>
										<th>Receive Country</th>
										<th>Expire Date</th>
										<th>Quantity</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Vaccine No</th>
										<th>Vaccine Name</th>
										<th>Batch Number</th>
										<th>Receive Date</th>
										<th>Receive Country</th>
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
										<td class="text-uppercase"><%= vaccine.getVaccineName() %></td>
										<td class="text-uppercase"><%= vaccine.getBatchNo() %></td>
										<td class="text-uppercase"><%= vaccine.getVaccineReceive().split(" ")[0] %></td>
										<td class="text-uppercase"><%= vaccine.getVaccineCountry() %></td>
										<td class="text-uppercase"><%= vaccine.getVaccineExpire() %></td>
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
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="name" class="form-label">Batch Number</label> <input
										type="text" class="form-control text-uppercase" id="batchNumber"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="mr-sm-2" for="vaccineName">Vaccine Name</label> <br/>
							      		<select class="form-select mt-2" id="vaccineName">
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
							<div class="row mt-4">
								<div class="col-md-6">
									<label for="vreceiveDate" class="form-label">Receive Date</label> 
									<input type="date" class="form-control" id="receiveDate" required>
								</div>
								<div class="col-md-6">
									<label for="country" class="form-label">Country From</label> <input
										type="text" class="form-control text-uppercase" id="country"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-6">
									<label for="expireDate" class="form-label">Expire Date</label> 
									<input type="date" class="form-control" id="expireDate" required>
									
								</div>
								<div class="col-md-6">
									<label for="quantity" class="form-label">Quantity</label> <input
										type="number" class="form-control text-uppercase" id="quantity" 
										required>
										
										<script>
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth() + 1; //January is 0!
				var yyyy = today.getFullYear();
				if (dd < 10) {
   					dd = '0' + dd;
				}
				if (mm < 10) {
  	 				mm = '0' + mm;
				} 
    
				today = yyyy + '-' + mm + '-' + dd;
				document.getElementById("receiveDate").setAttribute("max", today);
				document.getElementById("expireDate").setAttribute("min", today);
				

				
			</script>
										
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
	    	var formdata = [];
	    	var table = $('#dataTable').DataTable();
	    	
		    $("#btninsert").click(function() {
		    	formState = "NE";
		    	
		        $('#vaccineNo').val("");
				$('#vaccineName').val("");
				$('#batchNumber').val("");
				$('#receiveDate').val("");
		        $('#country').val("");
				$('#expireDate').val("");
				$('#quantity').val("");
		    	
				$("#vaccineForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add Inventory');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objVaccine = {
		    				vaccineNo: $('#vaccineNo').val(),
		    				vaccineName: $('#vaccineName').val(),
		    				batchNumber: $('#batchNumber').val(),
		    				receiveDate: $('#receiveDate').val(),
		    				country: $('#country').val(),
		    				expireDate: $('#expireDate').val(),
		    				quantity: $('#quantity').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8095/RedCrossSupportService/VaccineDetails?action=NE',
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
		    				batchNumber: $('#batchNumber').val(),
		    				receiveDate: $('#receiveDate').val(),
		    				country: $('#country').val(),
		    				expireDate: $('#expireDate').val(),
		    				quantity: (formdata[6]==$('#quantity').val())?($('#quantity').val()):(formdata[6]-$('#quantity').val()),
		    		}
		    		if(formdata[6]<$('#quantity').val()){
		    			alert("Update Quantity Error");
		    			location.reload();
		    		}else{
		    			
		     	    $.ajax({
		     	        url      : 'http://localhost:8095/RedCrossSupportService/VaccineDetails?action=UP',
		     	        method   : 'POST', 
		     	        data     : objVaccine,
		     	        success  : function(response){
		     	        	formState = "";	     	        	
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });}
		    	}
		    	else if(formState == "DL") {
		    		$("#loader").show();
		    		var objVaccine = {
		    				vaccineNo: $('#vaccineNo').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8095/RedCrossSupportService/VaccineDetails?action=DL',
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
		        formdata = table.row( $(this).parents('tr') ).data();
		       
		        $('#vaccineNo').val(formdata[0]);
		        $('#vaccineName').val(formdata[1]);
				$('#batchNumber').val(formdata[2]);
				$('#receiveDate').val(formdata[3]);
				$('#country').val(formdata[4]);
				$('#expireDate').val(formdata[5]);
				$('#quantity').val(formdata[6]);
				
				$("#vaccineForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update Inventory');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        
		        $('#vaccineNo').val(data[0]);
		        $('#vaccineName').val(data[1]);
				$('#batchNumber').val(data[2]);
				$('#receiveDate').val(data[3]);
				$('#country').val(data[4]);
				$('#expireDate').val(data[5]);
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