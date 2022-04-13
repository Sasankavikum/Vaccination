<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Red Cross Support Service</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" 
	crossorigin="anonymous" />
	<style>
		@media only screen and (max-width: 600px) {
		  .logo {
		    width: 80%;
		  }
		}
		
		#loader {
		  display: flex;
		  height: 100vh;
		  width: 100%;
		  background: white;
		  position: fixed;
		  bottom: 0;
		  left: 0;
		  right: 0;
		  top: 0;
		  z-index: 9998;
		  align-items: center;
		  justify-content: center;
		  flex-direction: column;
		  opacity: 0.8;
		}	
	</style>
</head>
<body>
      <div id="loader" align="center">
        <img
          class="logo"
          id="loading"
          src="../Assest/Loading.gif"
          alt="inner"
        />
      </div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand">Vaccination Detail System</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="/RedCrossSupportService/EmployeeDetails">Employee Details</a>
              </li>
              <li class="nav-item">
              	<a class="nav-link" href="/RedCrossSupportService/VaccineDetails">Vaccine Details</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/RedCrossSupportService/VaccineDetails">Inventory</a>
              </li>
              <li class="nav-item">
              	<a class="nav-link" href="/RedCrossSupportService/VaccineDetails">Daily Progress</a>
              </li>
            </ul>
            <form class="d-flex">
              <button class="btn btn-outline-danger" id="btnLogout" type="submit">Logout</button>
            </form>
          </div>
        </div>
    </nav>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    
    	<script type="text/javascript">
    
    	$(document).ready(function() {	
	    	
    		$("#loader").hide();
    		
		    $("#btnLogout").click(function() {
		    	
		    });
		    
    	});
    	
    </script>
</body>
</html>