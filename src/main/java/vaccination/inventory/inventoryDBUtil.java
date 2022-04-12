package vaccination.inventory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class inventoryDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertvaccine(String batch_no, String vaccine_name, String receive_date, String country, String expire_date, int quantity) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//database call
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
//    		double unitPrice=0;
    		
//    		//get the unit price from the item list
//    		String sql1 = "SELECT unit FROM inventory_item WHERE name = '"+name+"' limit 1";
//    		ResultSet unit1 = stmt.executeQuery(sql1);
//		if(unit1.next()) 
//			unitPrice = unit1.getDouble(1);
//    		double total1 = unitPrice*quantity;
    		
    	    String sql = "insert into inventory_all values ('"+batch_no+"','"+vaccine_name+"','"+receive_date+"','"+country+"','"+expire_date+"','"+quantity+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }

}
