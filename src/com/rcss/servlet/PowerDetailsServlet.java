package com.rcss.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rcss.model.PowerDetails;
import com.rcss.service.PowerDetailsServiceImpl;
import com.rcss.service.IPowerDetailsService;

@WebServlet("/PowerDetailsServlet")
public class PowerDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PowerDetailsServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.sendRedirect("/RedCrossSupportService/PowerDetails/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	
    	if(action.equalsIgnoreCase("NE")) { 
    		IPowerDetailsService powerService = new PowerDetailsServiceImpl();
    		powerService.addPowerDetail(new PowerDetails(
    				0, 
    				request.getParameter("location"), 
    				request.getParameter("date"), 
    				request.getParameter("vaccineType"), 
    				request.getParameter("noVaccines"), 
    				request.getParameter("employeeId"), 
    				request.getParameter("employeeName")));    		  
    	
    		response.sendRedirect("/RedCrossSupportService/PowerDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("UP")) {
    		IPowerDetailsService powerService = new PowerDetailsServiceImpl();
    		powerService.updatePower(Integer.parseInt(request.getParameter("empId")), new PowerDetails(
    				Integer.parseInt(request.getParameter("empId")), 
    				request.getParameter("location"), 
    				request.getParameter("date"), 
    				request.getParameter("vaccineType"), 
    				request.getParameter("noVaccines"), 
    				request.getParameter("employeeId"), 
    				request.getParameter("employeeName")));
    		  		
    		response.sendRedirect("/RedCrossSupportService/PowerDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("DL")) {
    		IPowerDetailsService powerService = new PowerDetailsServiceImpl();
    		powerService.removePowerDetail(Integer.parseInt(request.getParameter("empId")));
    		
    		response.sendRedirect("/RedCrossSupportService/PowerDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("PR")) {
    		HttpSession httpSession = request.getSession();
    		httpSession.setAttribute("EmpId", request.getParameter("empid_print"));
    		response.sendRedirect("/RedCrossSupportService/PowerDetails/powerprint.jsp");
    	}
	}
}
