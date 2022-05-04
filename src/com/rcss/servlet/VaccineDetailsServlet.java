package com.rcss.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.xml.ws.WebEndpoint;

import com.rcss.model.VaccineDetails;
import com.rcss.service.IVaccineDetailsService;
import com.rcss.service.VaccineDetailsServiceImpl;

@WebServlet("/VaccineDetails")
public class VaccineDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VaccineDetailsServlet() {
        super();
    }

//    @WebEndpoint
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/RedCrossSupportService/VaccineDetails/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	
    	if(action.equalsIgnoreCase("NE")) { 
    		IVaccineDetailsService vaccineService = new VaccineDetailsServiceImpl();
    		vaccineService.addVaccineDetail(new VaccineDetails(
    				0, 
    				request.getParameter("vaccineName"), 
    				request.getParameter("batchNumber"), 
    				request.getParameter("receiveDate"), 
    				request.getParameter("country"), 
    				request.getParameter("expireDate"),  
    				Integer.parseInt(request.getParameter("quantity")) 
    				));    		  
    	
    		response.sendRedirect("/RedCrossSupportService/VaccineDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("UP")) {
    		IVaccineDetailsService vaccineService = new VaccineDetailsServiceImpl();
    		vaccineService.updateVaccine(Integer.parseInt(request.getParameter("vaccineNo")), new VaccineDetails(
    				Integer.parseInt(request.getParameter("vaccineNo")), 
    				request.getParameter("vaccineName"), 
    				request.getParameter("batchNumber"), 
    				request.getParameter("receiveDate"), 
    				request.getParameter("country"), 
    				request.getParameter("expireDate"),  
    				Integer.parseInt(request.getParameter("quantity"))		
    				));
    		  		
    		response.sendRedirect("/RedCrossSupportService/VaccineDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("DL")) {
    		IVaccineDetailsService vaccineService = new VaccineDetailsServiceImpl();
    		vaccineService.removeVaccineDetail(Integer.parseInt(request.getParameter("vaccineNo")));
    		
    		response.sendRedirect("/RedCrossSupportService/VaccineDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("PR")) {
    		response.sendRedirect("/RedCrossSupportService/VaccineDetails/vaccineprint.jsp");
    	}
	}

}
