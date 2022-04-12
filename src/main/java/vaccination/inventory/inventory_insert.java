package vaccination.inventory;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/inventory_insert")
public class inventory_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String batch_no = request.getParameter("batch_no");
		String vaccine_name = request.getParameter("vaccine_name");
		String receive_date = request.getParameter("receive_date");
		String country = request.getParameter("country");
		String expire_date = request.getParameter("expire_date");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		
		boolean isTrue;
		
		
		isTrue = inventoryDBUtil.insertvaccine(batch_no, vaccine_name, receive_date,  country, expire_date, quantity);
		
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("inventory_view.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("inventory_unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
