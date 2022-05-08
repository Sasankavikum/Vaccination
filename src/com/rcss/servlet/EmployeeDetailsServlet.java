package com.rcss.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebEndpoint;

import com.rcss.model.EmployeeDetails;
import com.rcss.service.IEmployeeDetailsService;
import com.rcss.service.EmployeeDetailsServiceImpl;

@WebServlet("/EmployeeDetails")
public class EmployeeDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployeeDetailsServlet() {
        super();
    }

    @WebEndpoint
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.sendRedirect("/RedCrossSupportService/EmployeeDetails/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	
    	if(action.equalsIgnoreCase("NE")) { 
    		IEmployeeDetailsService employeeService = new EmployeeDetailsServiceImpl();
    		employeeService.addEmployeeDetail(new EmployeeDetails(
    				0, 
    				request.getParameter("empFullName"), 
    				request.getParameter("empNIC"), 
    				request.getParameter("empGender"), 
    				request.getParameter("empEmail"), 
    				request.getParameter("empContactNo"), 
    				request.getParameter("empAddress"),
    				request.getParameter("empBirth"), 
    				request.getParameter("empJoin"), 
    				request.getParameter("password"), 
    				request.getParameter("repassword")));    		  
    	
    		response.sendRedirect("/RedCrossSupportService/EmployeeDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("UP")) {
    		IEmployeeDetailsService employeeService = new EmployeeDetailsServiceImpl();
    		employeeService.updateEmployee(Integer.parseInt(request.getParameter("empId")), new EmployeeDetails(
    				Integer.parseInt(request.getParameter("empId")), 
    				request.getParameter("empFullName"), 
    				request.getParameter("empNIC"), 
    				request.getParameter("empGender"), 
    				request.getParameter("empEmail"), 
    				request.getParameter("empContactNo"), 
    				request.getParameter("empAddress"),
    				request.getParameter("empBirth"), 
    				request.getParameter("empJoin"), 
    				request.getParameter("password"), 
    				request.getParameter("repassword"))); 
    		  		
    		response.sendRedirect("/RedCrossSupportService/EmployeeDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("DL")) {
    		IEmployeeDetailsService employeeService = new EmployeeDetailsServiceImpl();
    		employeeService.removeEmployeeDetail(Integer.parseInt(request.getParameter("empId")));
    		
    		response.sendRedirect("/RedCrossSupportService/EmployeeDetails/index.jsp");
    	}
    	else if(action.equalsIgnoreCase("PR")) {
    		HttpSession httpSession = request.getSession();
    		httpSession.setAttribute("EmpId", request.getParameter("empid_print"));
    		response.sendRedirect("/RedCrossSupportService/EmployeeDetails/employeeprint.jsp");
    	}
	}
	
}
