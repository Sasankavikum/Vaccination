<%@page import="com.rcss.model.EmployeeDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcss.service.EmployeeDetailsServiceImpl"%>
<%@page import="com.rcss.service.IEmployeeDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details</title>
</head>
<body>
	<jsp:include page="/index.jsp"></jsp:include>

	<%
		IEmployeeDetailsService employeeService = new EmployeeDetailsServiceImpl();
		ArrayList<EmployeeDetails> employeeList = employeeService.getEmployeeDetails();
	%>

	<div class="container-fluid ml-2 mr-2">
		<div class="row mt-5">
			<div class="col-md-12 w-100">
				<div class="card text-dark bg-light w-100 h-100">
					<div class="card-header">
						<div class="row">
							<div class="col-md-5">
								<button type="button" id="btninsert" class="btn btn-primary">Add New Employee</button>
							</div>
							<div class="col-md-2">
							    <form action="${pageContext.request.contextPath}/EmployeeDetails?action=PR" method="POST" target="_blank">
									<button type="submit" class="btn btn-block btn-warning float-right">Print ID</button>
			                    </form>
							</div>
							<div class="col-md-7">
								<h5 class="card-title mt-1 fw-bold ml-5">Employee Details</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="dataTable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>Employee Id</th>
										<th>Employee Name</th>
										<th>NIC</th>
										<th>Gender</th>
										<th>Email</th>
										<th>Contact No</th>
										<th>Address</th>
										<th>Date of Birth</th>
										<th>Date of joining Employment</th>
										<th>Password</th>
										<th>Repassword</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Employee Id</th>
										<th>Employee Name</th>
										<th>NIC</th>
										<th>Gender</th>
										<th>Email</th>
										<th>Contact No</th>
										<th>Address</th>
										<th>Date of Birth</th>
										<th>Date of joining Employment</th>
										<th>Password</th>
										<th>Repassword</th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<%
										for(EmployeeDetails emp : employeeList){
									%>
									<tr>
										<td class="emp text-uppercase"><%= emp.getEmpId() %></td>
										<td class="text-uppercase"><%= emp.getEmpFullName() %></td>
										<td class="text-uppercase"><%= emp.getEmpNIC() %></td>
										<td class="text-uppercase"><%= emp.getEmpGender().equalsIgnoreCase("M") ? "Male" : "Female" %></td>
										<td class="text-uppercase"><%= emp.getEmpEmail() %></td>
										<td class="text-uppercase"><%= emp.getEmpContactNo() %></td>
										<td class="text-uppercase"><%= emp.getEmpAddress() %></td>
										<td class="text-uppercase"><%= emp.getEmpBirth() %></td>
										<td class="text-uppercase"><%= emp.getEmpJoin() %></td>
										<td class="text-uppercase"><%= emp.getPassword() %></td>
										<td class="text-uppercase"><%= emp.getRepassword() %></td>
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
					<h5 class="modal-title">Employee Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<form id="employeeForm">
							<input type="text" id="empId" hidden="true">
							<div class="row mt-2">
								<div class="col-md-12">
									<label for="empFullName" class="form-label">Employee Full Name</label> <input
										type="text" class="form-control text-uppercase" id="empFullName"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="empNIC" class="form-label">Employee NIC</label> <input
										type="text" class="form-control text-uppercase" id="empNIC" maxlength="10"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="compName" class="form-label">Employee Gender</label> <br/>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="empGender" id="male" value="M">
									  <label class="form-check-label" for="empGender">Male</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="empGender" id="female" value="F">
									  <label class="form-check-label" for="empGender">Female</label>
									</div>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-4">
									<label for="empContactNo" class="form-label">Employee Contact No</label> <input
										type="text" class="form-control text-uppercase" id="empContactNo" maxlength="10"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="empAddress" class="form-label">Employee Address</label> <input
										type="text" class="form-control text-uppercase" id="empAddress"
										required>
								</div>
							</div>	
							<div class="row mt-3">
								<div class="col-md-4">
									<label for="empBirth" class="form-label">Employee Date of Birth</label> <input
										type="date" class="form-control text-uppercase" id="empBirth"
										required>
								</div>
							</div>	
							<div class="row mt-3">
									<div class="col-md-4">
										<label for="empJoin" class="form-label">Employee Date of join Employment</label> <input
											type="date" class="form-control text-uppercase" id="empJoin"
											required>
									</div>
							</div>	
							<div class="row mt-3">
									<div class="col-md-4">
										<label for="password" class="form-label">Password</label> <input
											type="password" class="form-control text-uppercase" id="password"
											required>
									</div>
							</div>		
							<div class="row mt-3">
									<div class="col-md-4">
										<label for="repassword" class="form-label">Re-password</label> <input
											type="password" class="form-control text-uppercase" id="repassword"
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
                <h5 class="modal-title" id="exampleModalLabel">Print Employee Report</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row-md-12 justify-content-center">
                    <form action="${pageContext.request.contextPath}/EmployeeDetails?action=PR" method="POST" target="_blank">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <label for="GRNNo">Employee Id :</label>
                                    <input type="text" class="form-control form-control-sm" id="empid_print" name="empid_print" readonly />
                                </div>
                                 <div class="col-md-12 mt-2">
                                    <label for="GRNNo">Employee Name :</label>
                                    <input type="text" class="form-control form-control-sm text-uppercase" id="empname_print" name="empname_print" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <div class="form-row float-right">
                                <button type="submit" class="btn btn-block btn-success float-right">Print Employee Report</button>
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
				$('#empFullName').val("");
				$('#empNIC').val("");
				$('#empGender').val("");
				$('#empEmail').val("");
				$('#empContactNo').val("");
				$('#empAddress').val("");
		        $('#empBirth').val(""),
		        $('#empJoin').val("");
		        $('#password').val("");
		        $('#repassword').val("");
		    	
				$("#employeeForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add New Employee');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objEmp = {
		    				empId: $('#empId').val(),
		    				empFullName: $('#empFullName').val(),
		    				empNIC: $('#empNIC').val(),
		    				empGender: $('input[name="empGender"]:checked').val(),
		    				empEmail: $('#empEmail').val(),
		    				empContactNo: $('#empContactNo').val(),
		    				empAddress: $('#empAddress').val(),
		    				empBirth: $('#empBirth').val(),
		    				empJoin: $('#empJoin').val(),
		    				password: $('#password').val(),
			        		repassword: $('#repassword').val()
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/RedCrossSupportService/EmployeeDetails?action=NE',
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
		    				empFullName: $('#empFullName').val(),
		    				empNIC: $('#empNIC').val(),
		    				empGender: $('input[name="empGender"]:checked').val(),
		    				empEmail: $('#empEmail').val(),
		    				empContactNo: $('#empContactNo').val(),
		    				empAddress: $('#empAddress').val(),
		    				empBirth: $('#empBirth').val(),
		    				empJoin: $('#empJoin').val(),
		    				password: $('#password').val(),
			        		repassword: $('#repassword').val()
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/RedCrossSupportService/EmployeeDetails?action=UP',
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
		     	        url      : 'http://localhost:8090/RedCrossSupportService/EmployeeDetails?action=DL',
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
				$('#empFullName').val(data[1]);
				$('#empNIC').val(data[2]);
				$("input[name=empGender][value=" + data[3].charAt(0) + "]").attr('checked', 'checked');
				$('#empEmail').val(data[4]);
				$('#empContactNo').val(data[5]);
				$('#empAddress').val(data[6]);
				$('#empBirth').val(data[7]);
				$('#empJoin').val(data[8]);
				$('#password').val(data[9]),
        		$('#repassword').val(data[10])
				
				$("#employeeForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update Employee');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        
		        $('#empId').val(data[0]),
				$('#empFullName').val(data[1]);
				$('#empNIC').val(data[2]);
				$("input[name=empGender][value=" + data[3].charAt(0) + "]").attr('checked', 'checked');
				$('#empEmail').val(data[4]);
				$('#empContactNo').val(data[5]);
				$('#empAddress').val(data[6]);
				$('#empBirth').val(data[7]);
				$('#empJoin').val(data[8]);
				$('#password').val(data[9]),
        		$('#repassword').val(data[10])
				
				$("#employeeForm :input").prop("disabled", true);
				$("#btnAddAndUpdateModal").prop("disabled", false);
				
		    	formState = "DL";
		    	$('#btnAddAndUpdateModal').html('Delete Employee');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btnprint', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        $('#empid_print').val(data[0]);
		        $('#empname_print').val(data[1]);
		        $('#print').modal('toggle');
		    });
	    });
	    
    </script>

</body>
</html>